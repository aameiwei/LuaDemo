co = coroutine.create(   --创建 coroutine，返回 coroutine， 参数是一个函数，
                         --当和 resume 配合使用的时候就唤醒函数调用
    function(i)
        print(i);
    end
)
 
coroutine.resume(co, 1)   -- 1   --重启 coroutine，和 create 配合使用
print(coroutine.status(co))  -- dead
 
print("----------")
 
co = coroutine.wrap(   --创建 coroutine，返回一个函数，
                       --一旦你调用这个函数，就进入 coroutine，和 create 功能重复
		       --于create的区别可以理解为调用方式不一样
    function(i)
        print(i);
    end
)
 
co(1)
 
print("----------")
 
co2 = coroutine.create(
    function()
        for i=1,10 do
            print(i)
            if i == 3 then
                print(coroutine.status(co2))  --running
                print(coroutine.running()) --thread:XXXXXX
            end
            coroutine.yield()
        end
    end
)
 
coroutine.resume(co2) --1
coroutine.resume(co2) --2
coroutine.resume(co2) --3
 
print(coroutine.status(co2))   -- suspended
print(coroutine.running())  --返回正在跑的 coroutine，即返回一个状态为running的线程
                            --一个 coroutine 就是一个线程，
                            --当使用running的时候，就是返回一个 corouting 的线程号
 
print("----------")
--[=[
coroutine.running就可以看出来,coroutine在底层实现就是一个线程。
当create一个coroutine的时候就是在新线程中注册了一个事件。
当使用resume触发事件的时候，create的coroutine函数就被执行了，
当遇到yield的时候就代表挂起当前线程，等候再次resume触发事件。
]=]


--eg2
function foo (a)
    print("foo 函数输出", a)
    return coroutine.yield(2 * a) -- 返回  2*a 的值
end
 
co = coroutine.create(function (a , b)
    print("第一次协同程序执行输出", a, b) -- co-body 1 10
    local r = foo(a + 1)
     
    print("第二次协同程序执行输出", r)     --注意这里输出的结果为 "r"这个值，原因是第二次resume传入了"r"这个参数，
                                           --他将作为上一个yield的返回值，即将第一次的local r = "r"
					   --第三次yield的时候同理
					   --这样就实现了将外部的值传入到内部中
    local r, s = coroutine.yield(a + b, a - b)  -- a，b的值为第一次调用协同程序时传入
     
    print("第三次协同程序执行输出", r, s)
    return b, "结束协同程序"                   -- b的值为第二次调用协同程序时传入
end)
       
print("main", coroutine.resume(co, 1, 10)) -- true, 4
print("--分割线----")
print("main", coroutine.resume(co, "r")) -- true 11 -9 
print("---分割线---")
print("main", coroutine.resume(co, "x", "y")) -- true 10 end
print("---分割线---")
print("main", coroutine.resume(co, "x", "y")) -- cannot resume dead coroutine
print("---分割线---")
--[=[
调用resume，将协同程序唤醒,resume操作成功返回true，否则返回false；
协同程序运行；
运行到yield语句；
yield挂起协同程序，第一次resume返回；（注意：此处yield返回，参数是resume的参数）
第二次resume，再次唤醒协同程序；（注意：此处resume的参数中，除了第一个参数，剩下的参数将作为yield的参数）
yield返回；
协同程序继续运行；
如果使用的协同程序继续运行完成后继续调用 resume方法则输出：cannot resume dead coroutine
resume和yield的配合强大之处在于，resume处于主程中，它将外部状态（数据）传入到协同程序内部；而yield则将内部的状态（数据）返回到主程中。
]=]
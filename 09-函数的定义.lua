--函数定义的实例
--[[ 函数返回两个值的最大值 --]]
function max(num1, num2)

   if (num1 > num2) then
      result = num1;
   else
      result = num2;
   end

   return result;
end
-- 调用函数
print("两值比较最大值为 ",max(10,4))
print("两值比较最大值为 ",max(5,6))

--将函数作为参数传递给函数
myprint = function(param)
   print("这是打印函数 -   ##",param,"##")
end

function add(num1,num2,functionPrint)
   result = num1 + num2
   -- 调用传递的函数参数
   functionPrint(result)
end
myprint(10)
-- myprint 函数作为参数传递
add(2,5,myprint)

--多返回值的函数
function maximum (a)
    local mi = 1             -- 最大值索引
    local m = a[mi]          -- 最大值
    for i,val in ipairs(a) do
       if val > m then
           mi = i
           m = val
       end
    end
    return m, mi
end

print(maximum({8,10,23,12,5}))

--可变参函数
function average(...)
   result = 0
   local arg={...}    --> arg 为一个表，局部变量
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. #arg .. " 个数")
   return result/#arg --#代表长度，这里表示的时参数的个数
end

print("平均值为",average(10,5,3,4,5,6))

--固定参数加可变参数
--[=[通常在遍历变长参数的时候只需要使用 {…}，然而变长参数可能会包含一些 nil，
那么就可以用 select 函数来访问变长参数了：select('#', …) 或者 select(n, …)
select('#', …) 返回可变参数的长度
select(n, …) 用于访问 n 到 select('#',…) 的参数
调用select时，必须传入一个固定实参selector(选择开关)和一系列变长参数。
如果selector为数字n,那么select返回它的第n个可变实参，
否则只能为字符串"#",这样select会返回变长参数的总数。]=]
    function foo(...)  
        for i = 1, select('#', ...) do  -->获取参数总数
            local arg = select(i, ...); -->读取参数
            print("arg", arg);  
        end  
    end  
 
    foo(1, 2, 3, 4);  
 

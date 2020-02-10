--什么是闭包
--[=[闭包：通过调用含有一个内部函数
加上该外部函数持有的外部局部变量（upvalue）的外部函数（就是工厂）产生的一个实例函数
闭包组成：外部函数+外部函数创建的upvalue+内部函数（闭包函数）]=]
--upvalue的概念介绍参照下面的示例
function test()
        local i=0
        return function()
            i=i+1
            return i   --函数作为返回值,这里的i也叫外部局部变量，就是lua中的upvalue
        end
    end
    c1=test()
    c2=test()--c1,c2是建立在同一个函数，同一个局部变量的不同实例上面的两个不同的闭包
            --闭包中的upvalue各自独立，调用一次test（）就会产生一个新的闭包
    print(c1()) -->1
    print(c1()) -->2//重复调用时每一个调用都会记住上一次调用后的值，就是说i=1了已经
    print(c2())    -->1//闭包不同所以upvalue不同
    print(c2()) -->2

--lua的闭包环境
--[=[lua将所有的全局变量/局部变量保存在一个常规table中，
这个table一般被称为全局或者某个函数(闭包)的环境。
为了方便，lua在创建最初的全局环境时，使用全局变量 _G 来引用这个全局环境。
因此，在未手工设置环境的情况下，可以使用 _G[varname] 来存取全局变量的值.]=]
for k,v in pairs(_G) do
 print(k,"->",v)
end

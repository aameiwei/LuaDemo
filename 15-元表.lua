--元表中的定义
--mytable = {}                          -- 普通表
--mymetatable = {}                      -- 元表
--setmetatable(mytable,mymetatable)     -- 把 mymetatable 设为 mytable 的元表
--以上三行代码可以写成一行
--mytable = setmetatable({},{})

--实例
local mt = {}
--定义mt.__add元方法（其实就是元表中一个特殊的索引值）为将两个表的元素合并后返回一个新表
mt.__add = function(t1,t2)
    local temp = {}
    for _,v in pairs(t1) do
        table.insert(temp,v)
    end
    for _,v in pairs(t2) do
        table.insert(temp,v)
    end
    return temp
end
local t1 = {1,2,3}
local t2 = {2}
--设置t1的元表为mt
setmetatable(t1,mt)

local t3 = t1 + t2 --程序在执行t1+t2的时候，会去调用t1的元表mt的__add元方法进行计算。
                   --这里可以认为 + 会向方法中传递两个参数，t1和t2。
		   --这里称 + 对元方法 add这个元表的原方法的描述
--输出t3
local st = "{"
for _,v in pairs(t3) do
    st = st..v..", "
end
st = st.."}"
print(st)
--[=[
具体的过程是�
1.查看t1是否有元表，若有，则查看t1的元表是否有__add元方法，若有则调用。
2.查看t2是否有元表，若有，则查看t2的元表是否有__add元方法，若有则调用。
3.若都没有则会报错。
所以说，我们通过定义了t1元表的__add元方法，达到了让两个表通过+号来相加的效果]=]

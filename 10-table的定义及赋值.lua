-- 简单的 table
mytable = {}
print("mytable 的类型是 ",type(mytable))

--table的最基础的作用就是当成字典来用，它几乎可以是任何数值
t={}
t[{}] = "table"                 -- key 可以是表
t[1] = "int"                    -- key 可以是整数
t[1.1] = "double"               -- key 可以是小数
t[function () end] = "function" -- key 可以是函数
t[true] = "Boolean"             -- key 可以是布尔值
t["abc"] = "String"             -- key 可以是字符串
t[io.stdout] = "userdata"       -- key 可以是userdata
t[coroutine.create(function () end)] = "Thread" -- key可以是thread

--table作为数组
--当 key 为整数时，table 就可以当成数组来用。
--而且这个数组是一个 索引从1开始 ，没有固定长度，可以根据需要自动增长的数组。
a = {}
for i=0,5 do  -- 注意，这里故意写成了i从0开始
 a[i] = 0
end
--当将 table 当成数组来用时，
--可以通过 长度操作符 # 来获取数组的长度
--这里的结果是5
print(#a)


--对table进行赋值
--[=[以下示例说明：当我们为 table a 并设置元素，然后将 a 赋值给 b，
则 a 与 b 都指向同一个内存。当b的值改变时，对a的值是有影响的
但如果 b设置为 nil ， a同样能访问 table 的元素。]=]
mytable[1]= "Lua"
mytable["wow"] = "修改前"
print("mytable 索引为 1 的元素是 ", mytable[1])
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

-- alternatetable和mytable的是指同一个 table
alternatetable = mytable

print("alternatetable 索引为 1 的元素是 ", alternatetable[1])
print("mytable 索引为 wow 的元素是 ", alternatetable["wow"])

alternatetable["wow"] = "修改后"

print("mytable 索引为 wow 的元素是 ", mytable["wow"])

-- 释放变量
alternatetable = nil
print("alternatetable 是 ", alternatetable)

-- mytable 仍然可以访问
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

mytable = nil
print("mytable 是 ", mytable)
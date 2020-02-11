--__newindex
--[=[
__newindex 元方法用来对表更新，__index则用来对表访问 。
当为table中一个不存在的索引赋值时，会去调用元表中的__newindex元方法
如果存在则调用这个函数而不进行赋值操作
]=]
--作为函数
--__newindex是一个函数时会将赋值语句中的表、索引、赋的值当作参数去调用。不对表进行改变
local mt = {}
--第一个参数时表自己，第二个参数是索引，第三个参数是赋的值
mt.__newindex = function(t,index,value)
    print("index is "..index)
    print("value is "..value)
end

t = {key = "it is key"}
setmetatable(t,mt)
--输出表中已有索引key的值
print(t.key)
--为表中不存在的newKey索引赋值，调用了元表的__newIndex元方法，输出了参数信息
t.newKey = 10
--表中的newKey索引值还是空，上面看着是一个赋值操作，其实只是调用了__newIndex元方法，
--并没有对t中的元素进行改动
print(t.newKey)


--作为table
--__newindex是一个table时
--为t中不存在的索引赋值会将该索引和值赋到__newindex所指向的表中
--不对原来的表进行改变
local mt = {}
--将__newindex元方法设置为一个空表newTable
local newTable = {}
mt.__newindex = newTable
t = {}
setmetatable(t,mt)
print(t.newKey,newTable.newKey)
--对t中不存在的索引进行赋值时，由于t的元表中的__newindex元方法指向了一个表，所以并没有对t中的索引进行赋值操作将，而是将__newindex所指向的newTable的newKey索引赋值为了"it is newKey"
t.newKey = "it is newKey"
print(t.newKey,newTable.newKey)

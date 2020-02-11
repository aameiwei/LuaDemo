--rawget 和 rawset
--有时候我们希望直接改动或获取表中的值时，就需要rawget和rawset方法了。

--rawget可以让你直接获取到表中索引的实际值，而不通过元表的__index元方法。
local mt = {}
mt.__index = {key = "it is key"}
t = {}
setmetatable(t,mt)
print(t.key)
--通过rawget直接获取t中的key索引，即获取到t本身的值，而不走_index这个流程
--t这个表本身是没有key这个值的，所以获取到的值就是nil
print(rawget(t,"key"))

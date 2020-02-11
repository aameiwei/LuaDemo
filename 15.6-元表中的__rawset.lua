--rawset可以让你直接为表中索引的赋值，而不通过元表的__newindex元方法。
local mt = {}
local newTable = {}
mt.__newindex = newTable
t = {}
setmetatable(t,mt)
print(t.newKey,newTable.newKey)
--通过rawset直接向t的newKey索引赋值
rawset(t,"newKey","it is newKey")
print(t.newKey,newTable.newKey)
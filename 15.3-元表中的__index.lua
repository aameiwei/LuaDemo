--元方法__index
--[=[
调用table的一个不存在的索引时，会使用到元表的__index元方法，
当你通过键来访问 table 的时候，如果这个键没有值，
那么Lua就会寻找该table的metatable（假定有metatable）中的__index 键。
如果__index包含一个表格，Lua会在表格中查找相应的键。
简单来说就是设置a表中包含的另一个b表，使用__index后就可以通过a表调用b表中的东西
]=]

--__index作为函数

--eg1:
local mt = {}
--第一个参数是表自己，第二个参数是调用的索引
mt.__index = function(t,key)
    return "it is "..key
end

t = {1,2,3}
--输出未定义的key索引，输出为nil
print(t.key)
setmetatable(t,mt)
--设置元表后输出未定义的key索引，调用元表的__index函数，返回"it is key"输出
print(t.key)

--eg2:
mytable = setmetatable({key1 = "value1"}, {  
  __index = function(mytable, key)    --这种表示方法可以理解为将eg1的mt中的方法放到了括号里面
    if key == "key2" then
      return "metatablevalue"
    else
      return nil
    end
  end
})

print(mytable.key1,mytable.key2) --输出结果为value1    metatablevalue
--[=[
程序解读：
mytable 表赋值为 {key1 = "value1"}。
mytable 设置了元表，元方法为 __index。
在mytable表中查找 key1，如果找到，返回该元素，找不到则继续。
在mytable表中查找 key2，如果找到，返回 metatablevalue，找不到则继续。
判断元表有没有__index方法，如果__index方法是一个函数，则调用该函数。
元方法中查看是否传入 "key2" 键的参数（mytable.key2已设置），如果传入 "key2" 参数返回 "metatablevalue"，否则返回 mytable 对应的键值。
]=]

--可以将eg2简化为eg3:
mytable = setmetatable({key1 = "value1"}, { __index = { key2 = "metatablevalue" } })
print(mytable.key1,mytable.key2)

--__index作为table
--查找__index元方法表，若有该索引，则返回该索引对应的值，否则返回nil
local mt = {}
mt.__index = {key = "it is key"}

t = {1,2,3}
--输出未定义的key索引，输出为nil
print(t.key)
setmetatable(t,mt)
--输出表中未定义，但元表的__index中定义的key索引时，输出__index中的key索引值"it is key"
print(t.key)
--输出表中未定义，但元表的__index中也未定义的值时，输出为nil
print(t.key2)

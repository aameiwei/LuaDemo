array = {"Google", "Runoob"}

function elementIterator (collection)
   local index = 0
   local count = #collection
   -- 闭包函数
   return function ()
      index = index + 1
      if index <= count
      then
         --  返回迭代器的当前元素
         return collection[index]
      end
   end
end

for element in elementIterator(array)
do
   print(element)
end

--[=[
在上面的例子中，可以看到elementIterator中有另一个方法，
它使用局部外部变量index和count来通过每次调用函数时递增索引来返回集合中的每个元素。
可使用闭包创建函数迭代器，如上所示，它可以为迭代整个集合的每个时间返回多个元素。
]=]
--这里针对table的函数操作给出示例
fruits = { "banana", "orange", "apple" }
-- 返回 table 连接后的字符串
print("连接后的字符串 ", table.concat(fruits))

-- 指定连接字符
print("连接后的字符串 ", table.concat(fruits, ", "))

-- 指定索引来连接 table
print("连接后的字符串 ", table.concat(fruits, ", ", 2, 3))

--Table的插入和移除
fruits = { "banana", "orange", "apple" }

-- 在末尾插入
table.insert(fruits, "mango")
print("索引为 4 的元素为 ", fruits[4])

-- 在索引为 2 的键处插入
table.insert(fruits, 2, "grapes")
print("索引为 2 的元素为 ", fruits[2])

print("最后一个元素为 ", fruits[5])
table.remove(fruits)
print("移除后最后一个元素为 ", fruits[5])

--table的排序
fruits = { "banana", "orange", "apple", "grapes" }
print("排序前")
for k, v in ipairs(fruits) do
    print(k, v)
end

table.sort(fruits)
print("排序后")
for k, v in ipairs(fruits) do
    print(k, v)
end
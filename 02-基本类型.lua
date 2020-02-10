--lua的8种类型分别为：nil、boolean、number、string、userdata、function、thread 和 table。
--其中thread后续专门介绍，thread用于协同程序，userdata为用户自定义。
print(type("Hello world"))      --> string
print(type(10.4*3))             --> number
print(type(print))              --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
--这里要注意nil
--nil 类型表示一种没有任何有效值，它只有一个值，例如打印一个没有赋值的变量，便会输出一个 nil 值
--同时对于全局变量和 table，nil 还有一个"删除"作用
tab1 = { key1 = "val1", key2 = "val2", "val3" }
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end

tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end


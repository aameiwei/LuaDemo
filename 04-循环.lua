--[[
-- lua中有for、while、repeat until三种循环
-- --]]
--同时lua也支持嵌套的循环

for循环：重复执行指定语句，重复次数可在 for 语句中控制。
s = 0
for i = 1, 10 do
    s = s + i
end
print(s)


a = 1; b = 2
a, b = b, a
print(a, b)

--while循环，在条件为 true 时，让程序重复地执行某些语句。执行语句前会先检查条件是否为 true。
i = 1
while i < 10 do
    i = i + 1
    print(i)
end

--repeat until循环：重复执行循环，直到 指定的条件为真时为止
print("until-----------")
i = 1
repeat
    i = i + 1
    print(i)
until i >= 10

do
    print("do end 相当于一个语句块，可以出现在任意位置")
end

for i = 1, 10, 2 do print(i) end
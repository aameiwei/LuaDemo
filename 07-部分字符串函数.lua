print(string.upper("hello"))--转换为大写
print(string.lower("Hello"))--转换为小写
print(string.gsub("weiyinfui", 'i', '$', 2)) --字符串替换
print(string.find("Hello Lua user", "Lua", 1)) --字符串查找,第三个参数为搜索起始位置
print(string.reverse("hello"))--颠倒顺序
print(string.format("%d+%d=%d", 3, 4, 3 + 4))--格式化
print(string.char(97, 98, 99, 100))--官方解释为char 将整型数字转成字符并连接，可以理解为ASC码对应
s = "huoziwei"
print(#s, string.len(s)) --表示占用的字节数
print(string.rep(s, 3)) --返回字符串string的n个拷贝

--字符串格式化
string1 = "Lua"
string2 = "Tutorial"
number1 = 10
number2 = 20
-- 基本字符串格式化
print(string.format("基本格式化 %s %s",string1,string2))
-- 日期格式化
date = 2; month = 1; year = 2014
print(string.format("日期格式化 %02d/%02d/%03d", date, month, year)) --%02d表示最少输出最少几位
print(string.format("日期格式化 %02d/%02d/%06d", date, month, year)) --结果是02/01/002014                                                          
-- 十进制格式化
print(string.format("%.4f",1/3))


string.format("%c", 83)                 -- 输出S
string.format("%+d", 17.0)              -- 输出+17
string.format("%05d", 17)               -- 输出00017
string.format("%o", 17)                 -- 输出21
string.format("%u", 3.14)               -- 输出3
string.format("%x", 13)                 -- 输出d
string.format("%X", 13)                 -- 输出D
string.format("%e", 1000)               -- 输出1.000000e+03
string.format("%E", 1000)               -- 输出1.000000E+03
string.format("%6.3f", 13)              -- 输出13.000
string.format("%q", "One\nTwo")         -- 输出"One\
                                        -- 　　Two"
string.format("%s", "monkey")           -- 输出monkey
string.format("%10s", "monkey")         -- 输出    monkey
string.format("%5.3s", "monkey")        -- 输出  mon


--字符与整数相互转换
-- 字符转换
-- 转换第一个字符
print(string.byte("Lua"))
-- 转换第三个字符
print(string.byte("Lua",3))
-- 转换末尾第一个字符
print(string.byte("Lua",-1))
-- 第二个字符
print(string.byte("Lua",2))
-- 转换末尾第二个字符
print(string.byte("Lua",-2))
-- 整数 ASCII 码转换为字符
print(string.char(97))

--[[
lua的正则表达式比较怪异

.(点): 与任何字符配对
%a: 与任何字母配对
%c: 与任何控制符配对(例如\n)
%d: 与任何数字配对
%l: 与任何小写字母配对
%p: 与任何标点(punctuation)配对
%s: 与空白字符配对
%u: 与任何大写字母配对
%w: 与任何字母/数字配对
%x: 与任何十六进制数配对
%z: 与任何代表0的字符配对
%x(此处x是非字母非数字字符): 与字符x配对. 主要用来处理表达式中有功能的字符(^$()%.[]*+-?)的配对问题, 例如%%与%配对
[数个字符类]: 与任何[]中包含的字符类配对. 例如[%w_]与任何字母/数字, 或下划线符号(_)配对
[^数个字符类]: 与任何不包含在[]中的字符类配对. 例如[^%s]与任何非空白字符配对
-- --]]

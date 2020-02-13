--简单模式
-- 以只读方式打开文件
file = io.open("testio.lua", "r")

-- 设置默认输入文件为 testio.lua
io.input(file)

-- 输出文件第一行
print(io.read())

-- 关闭打开的文件
io.close(file)

-- 以附加的方式打开只写文件
file = io.open("testio.lua", "a")

-- 设置默认输出文件为 testio.lua
io.output(file)

-- 在文件最后一行添加 Lua 注释
io.write("--  testio.lua 文件末尾注释")

-- 关闭打开的文件
io.close(file)

--[=[
在以上实例中我们使用了 io."x" 方法，其中 io.read() 中我们没有带参数，参数可以是下表中的一个：

模式	描述
"*n"	读取一个数字并返回它。例：file.read("*n")
"*a"	从当前位置读取整个文件。例：file.read("*a")
"*l"（默认）	读取下一行，在文件尾 (EOF) 处返回 nil。例：file.read("*l")
number	返回一个指定字符个数的字符串，或在 EOF 时返回 nil。例：file.read(5)
]=]

--[=[
其他的 io 方法有：
io.tmpfile():返回一个临时文件句柄，该文件以更新模式打开，程序结束时自动删除
io.type(file): 检测obj是否一个可用的文件句柄
io.flush(): 向文件写入缓冲中的所有数据
io.lines(optional file name): 返回一个迭代函数,每次调用将获得文件中的一行内容,当到文件尾时，将返回nil,但不关闭文件
]=]

--针对于句柄的解释
--[=[
1.只有windows中才有句柄，windows中的句柄是指针的指针，因为windows中对象的经常会在内存中移动（如进行垃圾回收后），所以地址值经常会变，所以就对外提供一个指针的指针即句柄给用户，句柄的地址是不会变的。
2.linux中是没有文件句柄的，只有文件描述符，只是大家习惯把它说成句柄。
3.linux中， 每当进程打开一个文件时，系统就为其分配一个唯一对应的整型文件描述符（从0开始），用来标识这个文件。linux 操作系统通常对每个进程能打开的文件数量有一个限制。默认是1024。
]=]

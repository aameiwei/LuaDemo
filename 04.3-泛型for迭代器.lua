array = {"Google", "Runoob"}

for key,value in ipairs(array)
do
   print(key, value)
end

--[=[
以上实例中我们使用了 Lua 默认提供的迭代函数 ipairs。

下面我们看看泛型 for 的执行过程：

首先，初始化，计算 in 后面表达式的值，表达式应该返回泛型 for 需要的三个值：迭代函数、状态常量、控制变量；
    与多值赋值一样，如果表达式返回的结果个数不足三个会自动用 nil 补足，多出部分会被忽略。
第二，将状态常量和控制变量作为参数调用迭代函数（注意：对于 for 结构来说，状态常量没有用处，仅仅在初始化时获取他的值并传递给迭代函数）。
第三，将迭代函数返回的值赋给变量列表。
第四，如果返回的第一个值为nil循环结束，否则执行循环体。
第五，回到第二步再次调用迭代函数
]=]

--[=[
简单来说
for var_1, ..., var_n in explist do block end 

等价于
do 
 local _f, _s, _var = explist 
 while true do 
  local var_1, ... , var_n = _f(_s, _var) 
  _var = var_1 
  if _var == nil then break end 
  block 
 end 
end 

泛型 for 在自己内部保存三个值：迭代函数(_f)、状态常量(_s)、控制变量(_var)
这三个值要广义的理解，如果硬扣他们三到底对应代表的啥，我也理解不了
]=]

--[=[
pairs: 迭代 table，可以遍历表中所有的 key 可以返回 nil

ipairs: 迭代数组，不能返回 nil,如果遇到 nil 则退出

这里给出ipairs的示例
local function iter(s, i)
 i = i + 1
 local v = s[i]
 if v then return i, v end
end
function ipairs(s)
 return iter, s, 0
end
]=]
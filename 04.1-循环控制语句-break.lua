--Lua 编程语言 break 语句插入在循环体中，用于退出当前循环或语句，并开始脚本执行紧接着的语句。
--如果你使用循环嵌套，break语句将停止最内层循环的执行，并开始执行的外层的循环语句。
--[ 定义变量 --]
a = 10

--[ while 循环 --]
while( a < 20 )
do
   print("a 的值为:", a)
   a=a+1
   if( a > 15)
   then
      --[ 使用 break 语句终止循环 --]
      break
   end
end

--Lua 语言中的 goto 语句允许将控制流程无条件地转到被标记的语句处。

local a = 1
::Label::print("--- goto label ---")
if a < 3 then
    goto label   -- a 小于 3 的时候跳转到标签 label
end

--实现数字 n 的平方
function square(iteratorMaxCount,currentNumber)
   if currentNumber<iteratorMaxCount
   then
      currentNumber = currentNumber+1
   return currentNumber, currentNumber*currentNumber
   end
end

for i,n in square,3,0 --square是一个可以参与运行的函数，3和0为参数
do
   print(i,n)
end


--将上述代码进行修改，便于理解，修改为类似ipairs
function square(iteratorMaxCount,currentNumber)
   if currentNumber<iteratorMaxCount
   then
      currentNumber = currentNumber+1
   return currentNumber, currentNumber*currentNumber
   end
end
function squares(iteratorMaxCount)
   return square,iteratorMaxCount,0
end 

for i,n in squares(3)
do
 print(i,n)
end
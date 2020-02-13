--eg1
--[[
table中查找字段name的过程：
1.table是否有字段name：是，则返回name；否，则进入下一步
2.table是否设置了metatable：是，则下一步；否，则返回nil
3.table的metatable是否有__index字段：是，则下一步；否，则返回nil
4.table的metatable中的__index是否有name字段，是则返回__index.name；否，则返回nil
]]

--[[
1.使用metatable实现类
原理：
    使用metatable中的__index字段，指向一个table名为A，A中包含了一些属性和方法。
    新建一个对象，即构造了一个新的table名为B，并将B的metatable设置为A，这样B就可以访问A中的属性和方法
]]

-- Person类
Person = {}
Person.__index = Person --元表的__index字段很重要

Person.name = ""
Person.age = 0

function Person:new()
    local obj = {}
    setmetatable(obj, Person)
    return obj
end

function Person:say(words)
    print(words or "Hello")
end


-- 实现一个Person类的对象
local me = Person.new()
print(me.name)  -- 输出空字符串
print(me.age)   -- 输出0
me:say()        -- 输出Hello

me.name = nil
print(me.name)  -- me这个table本身就没有name字段，所以上面给name置为nil后，这里访问到的仍然是metatable中的name

me.name = "xiaoming"
print(me.name)  -- 这里访问到的是me这个table自己的name字段
print(me:say("I am xiaoming.")) -- 调用的还是metatable的say函数

--[[
总结：
    所谓的类，实际是通过metatable给一个table提供（规定）了一些默认的属性和方法。
    当这个table自己有某个字段时，访问到的就是这个table自己的字段和方法。
    否则，访问的是metatable提供的默认字段。
]]



--eg2：
classA = {
 a=0,b=0
}

classA.__index = classA

function classA:new (a,b)
    local o = {}
    setmetatable(o,classA)
    o.a=a
    o.b=b
    return o  -- new方法最后返回的是新创建的o,
              --所以test_a, test_b最终访问的才不是同一个getA getB
	      --o把classA设置为了元表
end


--[=[
getA方法里的self指的是调用它的对象,而不是classA这个对象本身
(当然classA也可以作为调用它的对象,比如  "classA:new(1,2)"  里传入的self就是classA对象)
classA:getA的写法只是说明getA是在classA里面定义的而已
]=]

function classA:getA()
    return self.a
end

function classA:getB()
    return self.b
end

local test_a = classA:new(1,2)
local test_b = classA:new(2,3)
print(test_a:getA().."  "..test_a:getB())
print(test_b:getA().."  "..test_b:getB())

--[=[
test_a:getA()的调用顺序:
1.查看test_a里有没有getA方法 ?其中test_a里包含的成员为: a,b,元表 classA?
2.发现没有getA方法,继续确认getA有没有元表, 发现有元表 classA
3.查看 元表classA有没有 __index元方法,发现存在
4.继续访问classA里有没有getA()方法
5.发现存在getA()方法,就调用它?"classA:getA()"? 注意这里传入的self 是test_a对象 (关键3)
6.查看 test_a里有没有 成员a , 其中test_a里包含的成员为: a,b,元表 classA?
7.发现存在a,所以返回a

结论: 最终其实test_a test_b访问的都是自己定义的a和b,而不是classA里的 a和b. ?(测试:把classA里的代码清空 ?结论:依然可以正确执行)

]=]



--eg3
--最终的使用类的方法
-- 元类
Shape = {area = 0}

-- 基础类方法 new
function Shape:new (o,side)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  side = side or 0
  self.area = side*side;
  return o
end

-- 基础类方法 printArea
function Shape:printArea ()
  print("面积为 ",self.area)
end

-- 创建对象
myshape = Shape:new(nil,10)

myshape:printArea()
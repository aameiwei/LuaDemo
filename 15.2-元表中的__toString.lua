--元方法__tostring
--__tostring可以修改table转化为字符串的行为
local mt = {}
--参数是表自己
mt.__tostring = function(t)
    local s = "{"
    for i,v in ipairs(t) do
        if i > 1 then  --避免了i=0时出现的情况
            s = s..", "
        end
        s = s..v
    end
    s = s .."}"
    return s
end

t = {1,2,3}
--直接输出t，结果为t这个table的地址
print(t)
--将t的元表设为mt，结果为{1,2,3}
setmetatable(t,mt)
--输出t
print(t)
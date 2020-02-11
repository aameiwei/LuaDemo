--Ôª±íÖĞµÄ¶¨Òå
--mytable = {}                          -- ÆÕÍ¨±í
--mymetatable = {}                      -- Ôª±í
--setmetatable(mytable,mymetatable)     -- °Ñ mymetatable ÉèÎª mytable µÄÔª±í
--ÒÔÉÏÈıĞĞ´úÂë¿ÉÒÔĞ´³ÉÒ»ĞĞ
--mytable = setmetatable({},{})

--ÊµÀı
local mt = {}
--¶¨Òåmt.__addÔª·½·¨£¨ÆäÊµ¾ÍÊÇÔª±íÖĞÒ»¸öÌØÊâµÄË÷ÒıÖµ£©Îª½«Á½¸ö±íµÄÔªËØºÏ²¢ºó·µ»ØÒ»¸öĞÂ±í
mt.__add = function(t1,t2)
    local temp = {}
    for _,v in pairs(t1) do
        table.insert(temp,v)
    end
    for _,v in pairs(t2) do
        table.insert(temp,v)
    end
    return temp
end
local t1 = {1,2,3}
local t2 = {2}
--ÉèÖÃt1µÄÔª±íÎªmt
setmetatable(t1,mt)

local t3 = t1 + t2 --³ÌĞòÔÚÖ´ĞĞt1+t2µÄÊ±ºò£¬»áÈ¥µ÷ÓÃt1µÄÔª±ímtµÄ__addÔª·½·¨½øĞĞ¼ÆËã¡£
                   --ÕâÀï¿ÉÒÔÈÏÎª + »áÏò·½·¨ÖĞ´«µİÁ½¸ö²ÎÊı£¬t1ºÍt2¡£
		   --ÕâÀï³Æ + ¶ÔÔª·½·¨ addÕâ¸öÔª±íµÄÔ­·½·¨µÄÃèÊö
--Êä³öt3
local st = "{"
for _,v in pairs(t3) do
    st = st..v..", "
end
st = st.."}"
print(st)
--[=[
¾ßÌåµÄ¹ı³ÌÊÇ£
1.²é¿´t1ÊÇ·ñÓĞÔª±í£¬ÈôÓĞ£¬Ôò²é¿´t1µÄÔª±íÊÇ·ñÓĞ__addÔª·½·¨£¬ÈôÓĞÔòµ÷ÓÃ¡£
2.²é¿´t2ÊÇ·ñÓĞÔª±í£¬ÈôÓĞ£¬Ôò²é¿´t2µÄÔª±íÊÇ·ñÓĞ__addÔª·½·¨£¬ÈôÓĞÔòµ÷ÓÃ¡£
3.Èô¶¼Ã»ÓĞÔò»á±¨´í¡£
ËùÒÔËµ£¬ÎÒÃÇÍ¨¹ı¶¨ÒåÁËt1Ôª±íµÄ__addÔª·½·¨£¬´ïµ½ÁËÈÃÁ½¸ö±íÍ¨¹ı+ºÅÀ´Ïà¼ÓµÄĞ§¹û]=]

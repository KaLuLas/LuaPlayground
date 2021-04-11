-- 23.1 弱引用表
local a = {}
local mt = {__mode = "k"} -- 弱引用值表
setmetatable(a, mt)

local key = {}
a[key] = 1

key = {}
a[key] = 2

print("before collectgarbage():")
for _, value in pairs(a) do
    print(value)
end

collectgarbage()

print("after collectgarbage():")
for _, value in pairs(a) do
    print(value)
end
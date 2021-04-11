-- 23.5 瞬表
require("Tools.utils")

local mem = {}
setmetatable(mem, {__mode = "k"})

function Factory(o)
    local res = mem[o]
    if res == nil then
        res = function() return o end
        mem[o] = res -- 表的值指向表的键
    end
    return res
end

local object = {
    name = "edwardchen",
    age = 24,
    job = "college student",
} -- mem表以外的引用1：object

-- mem表以外的间接引用2：instance
local instance = Factory(object)
print("after instance created:" .. table.length(mem))
for key, value in pairs(mem) do
    print(key, value)
end

instance = nil
collectgarbage("collect")
print("set instance nil and collectgarbage():" .. table.length(mem))
for key, value in pairs(mem) do
    print(key, value)
end

object = nil
collectgarbage("collect")
print("set object nil and collectgarbage():" .. table.length(mem))
for key, value in pairs(mem) do
    print(key, value)
end

-- 即使mem value -> key存在引用，仍然被回收
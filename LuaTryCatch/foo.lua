-- 1. error test
-- error "this is an error!"

local foo = function()
    error "it's a trap!!!"
end

local main = function()
    foo()
end

--[[ 2. pcall test
local state, ret = pcall(main)
if not state then
    print(ret)
end
]]

-- 3. xpcall test
local state, ret = xpcall(main, debug.traceback)
if not state then
    print(ret)
end
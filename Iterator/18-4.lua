-- 无状态迭代器
local iterstr = function(state, idx)
    idx = idx + 1
    local len = state[1]
    if idx == 1 then -- 迭代从头开始，步长加1
        state[3] = state[3] + 1
        if idx + state[3] > len then
            return nil
        end
    end
    local content = state[2]
    local ret = string.sub(content, idx, idx + state[3])
    if idx + state[3] == len then
        idx = 0 -- 下一次迭代从头开始
    end
    return idx, ret
end

local allsub = function(str)
    local state = {str:len(), str, -1} -- {长度，字符串，步长}
    return iterstr, state, 0
end

for _, substr in allsub("a sample string") do
    print(substr)
end
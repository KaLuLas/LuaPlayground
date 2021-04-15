local iter = function(state, cur)
    local ret
    if cur == nil then
        ret = state[1] -- 起点
    else
        ret = cur + (state[3] and state[3] or 1) -- 有步长加步长没步长加1
    end
    if ret > state[2] then
        ret = nil -- 超出终点
    end
    return ret
end

local fromto = function(n, m, p) -- 左边界n，右边界m，步长p
    local state = {n, m, p}
    return iter, state, nil -- 返回迭代器iter, 不可变状态，控制变量
end

for i in fromto(1, 5, 2) do
    print(i)
end
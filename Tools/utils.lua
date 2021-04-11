--- 基于pairs计算并返回表的大小
---@param table any
---@return integer 表的大小，为空时返回0
table.length = function(table)
    local ret = 0
    for _, _ in pairs(table) do
        ret = ret + 1
    end
    return ret
end
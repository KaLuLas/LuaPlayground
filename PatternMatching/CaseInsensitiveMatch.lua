local toInsensitive = function(target)
    target = target:gsub("(%W)", "%%%1") -- 预处理：对所有非字母数字转义
    target = target:gsub("%a", function(letter)
        return "[" .. letter:lower() .. letter:upper() .. "]"
    end)
    return target
end

local l_target = "this is a search string ABCD [100.00%]"
local l_source = "This Is A Search String ABCD [100.00%]"
local l_convert = toInsensitive(l_target)
print("before:" .. l_target)
print("after:" .. l_convert)
print("match:" .. l_source:match(l_convert))

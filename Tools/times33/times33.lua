local input = io.read("l")
local uint32_max = (1 << 32) - 1
local hash = 5381
local char

for i = 1, #input do
    char = string.byte(input, i)
    hash = (hash << 5) + hash + char -- hash = hash * 33 + str[i]
    hash = hash % uint32_max -- mod uint32_max
    -- print(string.format("[%d] '%s' -> %d", i, input:sub(1, i), hash))
end

print(string.format("result: %d", hash))
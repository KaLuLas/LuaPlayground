-- 二进制读取文件，并将二进制内容打印出来
local f = assert(io.open(arg[1], "rb"))
local blocksize = 16
for bytes in f:lines(blocksize) do
    for i = 1, #bytes do
        local b = string.unpack("B", bytes, i)
        io.write(string.format("%02X ", b))
    end
    io.write(string.rep("    ", blocksize - #bytes)) -- 补全一行
    bytes = string.gsub(bytes, "%c", ".") -- 替换控制字符
    io.write("  ", bytes, "\n") -- 分隔二进制与文本
end
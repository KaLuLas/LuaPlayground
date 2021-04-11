-- 23.6 析构器

local object = { last_words = "bye" }

setmetatable(object, {__gc = function (o)
    if o.last_words then
        print(o.last_words)
    end
end})

object = nil
collectgarbage()
print("collectgarbage() finished")
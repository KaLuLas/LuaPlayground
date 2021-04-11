-- 23.6 析构器

local finalizer = function (object)
    if object.last_words then
        print(string.format("\"%s\" from %s", object.last_words, object.name))
    end
end
local mt = {__gc = finalizer}

local ed = { last_words = "bye", name = "edwardchen"}
local tom = { last_words = "wtf?", name = "tom"}

setmetatable(ed, mt) -- 为ed进行标记
mt.__gc = nil
setmetatable(tom, mt) -- tom未被标记

mt.__gc = finalizer -- 设置元表后重新赋值也没用

ed = nil
tom = nil
collectgarbage() -- 仅执行ed的析构器
print("collectgarbage() finished")
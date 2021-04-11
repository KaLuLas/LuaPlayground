print(rawget(_ENV, "print")) -- function: 0000000068d17b70
print(_ENV.print) -- function: 0000000068d17b70

a = 10 -- 等价于_ENV.a
print(_ENV.a) -- 10
print(rawget(_ENV, "a")) -- 10
print(_ENV._G.a) -- 10

-- 可以看到Lua创建并初始化的_ENV包含了全局环境中的内容（不需要通过__index去_G全局环境中搜索）
-- 同时对_ENV的字段赋值会通过__newindex同步设置_G对应字段

_ENV = {_G = _G} -- 将_ENV指向重新创建的环境
_G.print(_G.rawget(_ENV, "print")) -- nil, print 和 rawget都必须用_G
-- 注意编译时这里其实也是_ENV._G.print / _ENV._G.rawget
a = 5
_G.print(_ENV.a) -- 5
_G.print(_ENV._G.a) -- 10

-- 而我们重新创建环境后，没有__index导向_G索引，也没有__newindex对_G赋值
-- 所以无法在环境中找到print / rawget方法，对_ENV.a进行赋值也不影响_ENV._G.a
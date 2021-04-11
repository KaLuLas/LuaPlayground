local function _sayHello()
    print("hello world")
end

_sayHello()

_G.TEST = {}
_G.TEST.a = "1145"
_G.TEST.b = "25678"

for key, value in pairs(_G.TEST) do
    print(key, value)
end

for key, value in pairs(_G.TEST) do
    if value == "1145" then
        break
        print "unreachable"
    end
end

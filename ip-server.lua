local socket = require("socket")
local port = "8080"
local server = assert(socket.bind("*", port))



local s = socket.udp()
s:setpeername("8.8.8.8", 80) -- Google DNS
local ip, _ = s:getsockname()
print("http://" .. ip ..":" ..port)
s:close()

--web server
while true do
    local client = server:accept()
    client:settimeout(1)
    
    print("İstek:", (client))
    
       
local response_body = "<h1>Welcome LuaSocket HTTP Project</h1>"
    
        local response =
            "HTTP/1.1 200 OK\r\n" ..
            "Content-Type: text/html\r\n" ..
            "Content-Length: " .. #response_body .. "\r\n" ..
            "\r\n" ..
            response_body
    
        client:send(response)
        client:close()
    
end
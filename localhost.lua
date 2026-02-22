local socket = require("socket")
local port = "8080"
local server = assert(socket.bind("0.0.0.0", port))

print("http://127.0.0.1:" .. port)

--web server
while true do
    local client = server:accept()
    client:settimeout(1)
    
    print("İstek:", (client))
    
    
    
local response_body = "<h1>Welcome LuaSocket HTTP Project</h1>" -- tüm dosyayı oku
    
        local response =
            "HTTP/1.1 200 OK\r\n" ..
            "Content-Type: text/html\r\n" ..
            "Content-Length: " .. #response_body .. "\r\n" ..
            "\r\n" ..
            response_body
    
    
        client:send(response)
        client:close()
    
end
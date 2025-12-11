-- Example; Change to your needs
local net = require("networkApi")
local completion = require("cc.completion")
local modem = peripheral.wrap("top")
local home = net.server.setUpServer(2006)
local port = 1000
 
local possibleMessages = net.getResponse(port, home.code, {"help", {}}, modem)
 
local function completeFunction(text)
return completion.choice(text, possibleMessages)
end
 
print("Waiting for input...")
 
while true do
value = {}
local i = 0
 
repeat
 
i = i + 1
 
if i == 1 then
userInput = read(nil, nil, completeFunction)
else
userInput = read()
end
 
 
if tonumber(userInput) then
userInput = tonumber(userInput)
end
value[i] = userInput
until value[i] == ""
 
messageCode = table.remove(value, 1)
sendMessage = value
 
 
message = net.getResponse(port, home.code, {messageCode, sendMessage}, modem)
print("> "..tostring(message).."\n")
end
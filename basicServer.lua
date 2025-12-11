net = require("networkApi")
util = require("utilityApi")
home = net.server.setUpServer(2006)
modem = peripheral.wrap("top")

port = 1000
cb = require("callbacks")

function cb.help()
keys, _ = util.getKeyValues(cb)
return keys
end
 
message = "Looking for input..."
while true do
value = net.getResponse(port, home.code, message, modem)
message = net.runCallbacks(value, cb) 
print(value)
end
component = require("component")
modem = component.modem
event = require("event")

modem.open(2)
modem.broadcast(1,"nanomachines", "setResponsePort", 2)
_, _, _, _, _, name = event.pull(10,"modem_message")
if name ~= nil then
for i = 1, modem.broadcast(1,"nanomachines", "getTotalInputCount") + 1 do
modem.broadcast(1,"nanomachines", "setInput", i, true)
os.sleep(1)
modem.broadcast(1,"nanomachines", "getActiveEffects")
_, _, _, _, _, result = event.pull(10,"modem_message")
print(result)
modem.broadcast(1,"nanomachines", "setInput", i, false)
os.sleep(1)
end
end
modem.close(2)
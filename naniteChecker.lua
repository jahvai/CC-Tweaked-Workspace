component = require("component")
modem = component.modem
event = require("event")

modem.open(2)
modem.broadcast(1,"nanomachines", "setResponsePort", 2)
_, _, _, _, _, name = event.pull(10,"modem_message")
if name == "SkiddyMango3125" then
modem.broadcast(1,"nanomachines", "getTotalInputCount")
inputs = event.pull(10, "modem_message")
for i = 1, inputs + 1 do
modem.broadcast(1,"nanomachines", "setInput", i, true)
os.sleep(1)
modem.broadcast(1,"nanomachines", "getActiveEffects")
_, _, _, _, _, result = event.pull(10,"modem_message")
print(result)
modem.broadcast(1,"nanomachines", "setInput", i, false)
end
end
modem.close(2)
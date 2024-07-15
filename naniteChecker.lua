component = require("component")
m = component.modem
event = require("event")
 
m.open(2)
m.open(1)
 
m.broadcast(1,"nanomachines", "setResponsePort", 2)
event.pull("modem_message")
m.broadcast(1,"nanomachines", "getTotalInputCount")
_, _, _, _, _, _, _, inputs = event.pull("modem_message")
print(inputs)
for i = 1, inputs do
m.broadcast(1,"nanomachines", "setInput", i, true)
os.sleep(1)
m.broadcast(1,"nanomachines", "getActiveEffects")
_, _, _, _, _, _, _, result = event.pull("modem_message")
m.broadcast(1,"nanomachines", "setInput", i, false)
event.pull("modem_message")
print(result)
end
component = require("component")
modem = component.modem
event = require("event")

modem.open(2)
modem.broadcast(1,"nanomachine", "setResponsePort", 2)
name = event.pull(10,"modem_message")
if name then
for i = 1, modem.broadcast(1,"nanomachine", "getTotalInputCount") + 1 do
modem.broadcast(1,"nanomachine", "setInput", i, true)
os.sleep(2)
modem.broadcast(1,"nanomachine", "getActiveEffects")
print(event.pull(10,"modem_message"))
modem.broadcast(1,"nanomachine", "setInput", i, false)
os.sleep(2)
end
end
modem.close(2)
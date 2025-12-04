local modem = peripheral.find("modem")

-- Add futher functionality later
local function setUpServer(serverCode)
    return {code = serverCode}
end

--  Callback Structure
-- {code, {function: str, params: table}}
-- function(table.unpack(table))


local function runCallbacks(message, callbackTable)
    for k, v in pairs(callbackTable) do
        if (message[1] == k) and type(message[2] == "table") then
            v(table.unpack(message[2]))
        end
    end
end

local function getResponse(port, code, data, modem)
    if modem ~= table then
        modem = peripheral.find("modem")
    end
    portWasOpen = modem.isOpen(port)
    if not portWasOpen then
        modem.open(port)
    end

    modem.transmit(port, port, {code, data})

    local networkMessage
    repeat
        _, _, _, _, networkMessage, _ = os.pullEvent("modem_message")
    until networkMessage[1] == code

    if not portWasOpen then
        modem.close(port)
    end
    table.remove(networkMessage, 1)
    return table.unpack(networkMessage)
end


local networkApiTable = {modem = modem, getResponse = getResponse, runCallbacks = runCallbacks}
networkApiTable["client"] = {}
networkApiTable["server"] = {setUpServer = setUpServer}

return networkApiTable
local modem = peripheral.find("modem")

-- Add futher functionality later
local function setUpServer(serverCode)
    return {code = serverCode}
end

local function createCallback(name, func)
    return {name, func}
-- {code, {function: str, params: table}}
-- function(table.unpack(table))
end

local function runCallbacks()

local function getResponse(port, code, data)
    portWasOpen = modem.isOpen(port)
    if not portWasOpen then
        modem.open(port)
    end

    modem.transmit(port, port, {code, data})

    local networkMessage
    repeat
        _, _, _, _, networkMessage, _ = os.pullEvent("modem_message")
    until networkMessage[1] = code

    if not portWasOpen then
        modem.close(port)
    end
    return table.unpack(networkMessage)
end


local networkApiTable = {modem = modem, getResponse = getResponse}
networkApiTable["client"] = {}
networkApiTable["server"] = {setUpServer = setUpServer}

return networkApiTable
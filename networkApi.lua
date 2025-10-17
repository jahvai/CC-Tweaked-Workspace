local modem = peripheral.find("modem")


local function getResponse(port, data)
    modem.transmit(port,port,data)
    if not modem.isOpen(port) then
        modem.open(port)
    end
end


local networkApiTable = {}
networkApiTable["client"] = {}
networkApiTable["server"] = {}

return networkApiTable
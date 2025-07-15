local utilApi = require("utilityApi")

local function readButton(file)
local fileHandle = io.open("/ui/buttons/"..file)
assert(fileHandle)
local data = {}

for i = 1, 8 do
data[i] = fileHandle:read("l")
end

data[1] = tonumber(data[1])
data[2] = tonumber(data[2])
data[3] = tonumber(data[3])
data[4] = tonumber(data[4])
if data[5] == "true" then data[5] = true else data[5] = false end
data[6] = tonumber(data[6])
data[7] = tonumber(data[7])
return data
end

local function writeButton(data)
local x1, y1, x2, y2, filled, textX, textY, text = unpack(data)

local backgroundColor = colors.white
local textColor = colors.black
if filled then
paintutils.drawFilledBox(x1,y1,x2,y2,backgroundColor)
else
paintutils.drawBox(x1,y1,x2,y2,backgroundColor)
end
term.setTextColor(textColor)
term.setBackgroundColor(backgroundColor)
term.setCursorPos(textX, textY)
write(text)
term.setTextColor(colors.white)
term.setBackgroundColor(colors.black)
end

local function connectFunction(connections)
while true do
local event, mouseKey, x, y = os.pullEvent()
if event == "stopUI" then

break

elseif event == "mouse_click" and mouseKey == 1 then

for i = 1, #connections do
if utilApi.isInBetween(
x, connections[i][1][1], connections[i][1][3]
) and utilApi.isInBetween(
y, connections[i][1][2], connections[i][1][4]
) then
connections[i][2]()
end
end
end
end
end

return { readButton = readButton, writeButton = writeButton, connectFunction = connectFunction }

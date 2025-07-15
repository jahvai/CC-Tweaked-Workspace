local name = arg[1]

local function clear () 
term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.setCursorPos(0, 0)
shell.run("clear")
end

local width, height = term.getSize()

local function waitForClick ()
local oldx, oldy
oldx, oldy = term.getCursorPos()
term.setCursorPos(1, height)
term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
write("Click to Continue")
term.setCursorPos(oldx, oldy)
os.pullEvent("mouse_click")
end

clear()
print(
"On the following screen, click the screen in the 2 corners you want for your box."
)
waitForClick()
clear()
local button, x1, y1, x2, y2
local filled, text, ySize, xSize, yHalfSize, xHalfSize, textOffset, finalTextX, finalTextY
repeat
_, button, x1, y1 = os.pullEvent("mouse_click")
until button == 1
paintutils.drawPixel(x1,y1,colors.white)
button = 0

repeat
_, button, x2, y2 = os.pullEvent("mouse_click")
until button == 1
paintutils.drawBox(x1,y1,x2,y2,colors.white)
waitForClick()
clear()
print("Do you want it filled?")
filled = read()
filled = string.lower(filled) == "true"
clear()
if filled then 
paintutils.drawFilledBox(x1,y1,x2,y2,colors.white)
end
clear()
print("What text should be drawn? (Tip: Keep it short.)")
text = read()
paintutils.drawFilledBox(x1,y1,x2,y2,colors.white)
term.setBackgroundColor(colors.white)
term.setTextColor(colors.black)
if text then
ySize = math.abs(y1-y2)
xSize = math.abs(x1-x2)
yHalfSize = math.ceil(ySize / 2)
xHalfSize = math.ceil(xSize / 2)
textOffset = math.floor(#text / 2)
finalTextX = x1 + xHalfSize - textOffset
finalTextY = y1 + yHalfSize
term.setCursorPos(finalTextX, finalTextY)
write(text)
end
waitForClick()
clear()
local file
file = io.open("/ui/buttons/"..name, "w+")
assert(file)
file:write(
x1.."\n"..y1.."\n"..x2.."\n"..y2.."\n"..tostring(filled).."\n"..finalTextX.." \n"..finalTextY.." \n"..text
)
file:close()
print("Done.")

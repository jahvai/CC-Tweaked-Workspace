local completion = require "cc.shell.completion"
local complete = completion.build(
  completion.file 
)
shell.setCompletionFunction("themeApplier.lua", complete)
shell.setCompletionFunction("themeApplier", complete)

filePath = arg[1]
if filePath == nil then
filePath = read(nil,nil, shell.complete)
end

file = io.open(filePath)
themeColor = {}

for i = 1, 16 do
themeColor[i] = string.gsub(file:read("l"), "#", "0x")
themeColor[i] = tonumber(themeColor[i])
end

term.setPaletteColor(colors.brown, themeColor[1])
term.setPaletteColor(colors.magenta, themeColor[2])

term.setPaletteColor(colors.black, themeColor[3])
term.setPaletteColor(colors.gray, themeColor[4])
term.setPaletteColor(colors.lightGray, themeColor[5])
term.setPaletteColor(colors.white, themeColor[6])

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)

term.setPaletteColor(colors.red, themeColor[7])
term.setPaletteColor(colors.orange, themeColor[8])
term.setPaletteColor(colors.yellow, themeColor[9])
term.setPaletteColor(colors.lime, themeColor[10])
term.setPaletteColor(colors.green, themeColor[11])
term.setPaletteColor(colors.cyan, themeColor[12])
term.setPaletteColor(colors.lightBlue, themeColor[13])
term.setPaletteColor(colors.blue, themeColor[14])
term.setPaletteColor(colors.purple, themeColor[15])
term.setPaletteColor(colors.pink, themeColor[16])





local completion = require "cc.shell.completion"
local complete = completion.build(
  completion.file 
)
shell.setCompletionFunction("themeApplier.lua", complete)

filePath = arg[1]
file = io.open(filePath)

for i = 1, 18 do
themeColor[i] = tonumber(string.gsub(file:read("l"), "#", "0x"))
end

term.setBackgroundColor(themeColor[1])
term.setTextColor(themeColor[2])

term.setPaletteColor(colors.black, themeColor[3])
term.setPaletteColor(colors.gray, themeColor[4])
term.setPaletteColor(colors.lightGray, themeColor[5])
term.setPaletteColor(colors.white, themeColor[6])

term.setPaletteColor(colors.red, themeColor[7])
term.setPaletteColor(colors.orange, themeColor[8])
term.setPaletteColor(colors.yellow, themeColor[9])
term.setPaletteColor(colors.lime, themeColor[10])
term.setPaletteColor(colors.green, themeColor[11])
term.setPaletteColor(colors.cyan, themeColor[12])
term.setPaletteColor(colors.lightBlue, themeColor[13])
term.setPaletteColor(colors.blue, themeColor[14])
term.setPaletteColor(colors.purple, themeColor[15])
term.setPaletteColor(colors.magenta, themeColor[16])
term.setPaletteColor(colors.pink, themeColor[17])
term.setPaletteColor(colors.brown, themeColor[18])

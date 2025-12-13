local pos1 = vector.new(90, 101, -122)
local pos2 = vector.new(90, 103, -123)
 
local offsetX = 8
local replaceBlock = ""
 
function getPowered(pos)
    local blockInfo = commands.getBlockInfo(
    pos.x, pos.y, pos.z
    )
    return blockInfo.state.powered
end
 
function fillDoor(pos1, pos2, replaceBlock)
    local x1, y1, z1 = pos1.x, pos1.y, pos1.z
    local x2, y2, z2 = pos2.x, pos2.y, pos2.z
    exec(
    "fill "..x1.." "..y1.." "..z1.." "..x2.." "..y2.." "
    ..z2.." "..replaceBlock
    )
end
 
local button1 = vector.new(91, 102, -121)
local button2 = vector.new(97, 102, -121)
local offset = vector.new(8, 0, 0)
 
while true do
if getPowered(button1) then
replaceBlock = "minecraft:iron_block"
else
replaceBlock = "minecraft:air"
end
fillDoor(pos1, pos2, replaceBlock)
 
if getPowered(button2) then
replaceBlock = "minecraft:iron_block"
else
replaceBlock = "minecraft:air"
end
fillDoor(pos1:add(offset), pos2:add(offset), replaceBlock
)
end
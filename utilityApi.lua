local function isInBetween(base, num1, num2)
return (base >= num1 and base <= num2) or (base <= num1 and base >= num2)
end

local function clear ()
term.setCursorPos(0, 0)
shell.run("clear")
end


return { isInBetween = isInBetween, }
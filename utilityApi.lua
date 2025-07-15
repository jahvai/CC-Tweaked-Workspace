local function isInBetween(base, num1, num2)
    return (base >= num1 and base <= num2) or (base <= num1 and base >= num2)
end

local function clear()
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    term.setCursorPos(0, 0)
    shell.run("clear")
end

local function getScreenInput()
    local mouseKey, id, x, y

    local function mouseInput()
        _, mouseKey, x, y = os.pullEvent("mouse_click")
    end

    local function monitorInput()
        _, id, x, y = os.pullEvent("monitor_touch")
        mouseKey = 2
    end
    parallel.waitForAny(mouseInput, monitorInput)
    return mouseKey, id, x, y
end

return { isInBetween = isInBetween, clear = clear, getScreenInput = getScreenInput}

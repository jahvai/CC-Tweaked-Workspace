local function findInventories()
    return table.pack(
    peripheral.find("inventory")
    )
end

local function getAllItems(inventories)
    if not inventories then
        inventories = findInventories()
    end

    local items = {}
    local allItems = {}
    local index = 1
    for invIndex, storage in ipairs(inventories) do
        items[invIndex] = {}
        for slot, itemData in pairs(storage.list()) do
            items[invIndex][slot] = itemData
            allItems[index] = {}
            allItems[index] = {itemData, peripheral.getName(inventories[invIndex]), slot}
            index = index + 1
        end
    end
    return items, allItems
end

-- Reset item list after adding getting.
local function requestItem(outputInventory, itemName, itemList)
    if type(outputInventory) ~= "table" then
        outputInventory = {outputInventory}
    end
    if type(itemName) ~= "table" then
        itemName = {itemName}
    end

    for i, v in ipairs(outputInventory) do
        if type(v) == "string" then
            outputInventory[i] = peripheral.wrap(v)
        end
    end

    for _, outputInventoryPeripheral in ipairs(outputInventory) do 
        for itemIndex, itemData in ipairs(itemList) do
            for _, currentItem in ipairs(itemName) do
                if (itemData[1].name == currentItem) and (itemData[2] ~= peripheral.getName(outputInventoryPeripheral)) then
                    if not outputInventoryPeripheral.pullItems(itemData[2], itemData[3]) then goto continueLoop end
                    itemList = table.remove(itemList, itemIndex)
                    return true, itemList
                    ::continueLoop::
                end
            end
        end
    end
    return false, itemList
end

return { findInventories = findInventories, getAllItems = getAllItems, requestItem = requestItem }
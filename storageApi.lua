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
    if type(outputInventory) == "string" then
        outputInventory = peripheral.wrap(outputInventory)
    end
    for i, v in ipairs(itemList) do
        if (v[1].name == itemName) and (v[2] ~= peripheral.getName(outputInventory)) then
            outputInventory.pullItems(v[2], v[3])
            itemList = table.remove(itemList, i)
            return true, itemList
        end
    end
    return false, itemList
end

return { findInventories = findInventories, getAllItems = getAllItems, requestItem = requestItem}
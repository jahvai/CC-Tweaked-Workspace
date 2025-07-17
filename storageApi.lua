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
            allItems[index] = {itemData, inventories[invIndex], slot}
            index = index + 1
        end
    end
    return items, allItems
end

local function requestItem(outputInventory, itemName, itemList)
    for i, v in ipairs(itemList) do
        if v[1] == itemName then
            outputInventory.pullItems(v[2], v[3])
            return true
        end
    end
    return false
end

return { findInventories = findInventories, getAllItems = getAllItems, requestItem = requestItem}
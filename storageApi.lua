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
    for i, s in ipairs(inventories) do
        items[i] = {}
        for k, v in pairs(s.list()) do
            items[i][k] = v
            allItems[1] = v
            i = i + 1
        end
    end
    return items, allItems
end

return { findInventories = findInventories, getAllItems = getAllItems}
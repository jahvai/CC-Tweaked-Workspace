local function findInventories()
    return table.pack(
    peripheral.find("inventory")
    )
end

local function getAllItems(inventories)
    local items = {}
    for i, s in ipairs(inventories) do
        items[i] = {}
        for k, v in pairs(s.list()) do
            items[i][k] = v
        end
    end
    return items
end

return { findInventories = findInventories, getAllItems = getAllItems}
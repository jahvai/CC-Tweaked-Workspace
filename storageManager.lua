local util = require("utilityApi")

local storages = table.pack(
peripheral.find("inventory")
)

local totals = {}
for i, s in ipairs(storages) do
for k, v in pairs(s.list()) do
totals = util.runningTotal(totals, v.name, v.count)
end
end

for k, v in pairs(totals) do
    print(k..": "..v)
end
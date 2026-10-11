-- List highlight groups whose fg/bg/sp is NOT a palette colour.
-- Independent of load order: it only inspects the final state.
package.loaded["lavet13.palette"] = nil
local p = require("lavet13.palette")
local ok = {}
for _, hex in pairs(p.raw) do ok[tonumber(hex:sub(2), 16)] = true end
local bad = {}
for name, h in pairs(vim.api.nvim_get_hl(0, {})) do
  if not h.link then
    for _, k in ipairs({ "fg", "bg", "sp" }) do
      if h[k] and not ok[h[k]] then
        table.insert(bad, ("%s.%s=#%06x"):format(name, k, h[k]))
      end
    end
  end
end
table.sort(bad)
print(#bad .. " off-palette:\n" .. table.concat(bad, "\n"))

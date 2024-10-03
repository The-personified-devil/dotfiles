local packer = require("packer")
local putil = require("packer.util")

local M = {}

-- Make this sane
function M.process_definition(defs)
    for name, settings in pairs(defs) do
        local def = vim.tbl_extend("keep", settings, { name, requires = {}, wants = {} })

        local deps = vim.tbl_map(function(t)
            return { t, opt = true }
        end, def.wants)
        def.requires = vim.tbl_extend("force", def.requires, deps)

        def.wants = vim.tbl_map(function(n)
            local name = putil.get_plugin_short_name({ n })
            return name
        end, def.wants)

        packer.use(def)
    end
end

return M

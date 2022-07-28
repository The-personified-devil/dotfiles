local packer = require("packer")

local M = {}

function M.process_definition(defs)
    for name, settings in pairs(defs) do
        table.insert(settings, name)
        settings.requires = settings.wants
        for _, value in ipairs(settings.wants) do
            table.insert(settings.wants, value["%f[/].*"])
        end
        error(vim.inspect(settings))
    end
end

return M

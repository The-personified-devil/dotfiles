local options = {
    excluded_fts = {},
    norelative_events = {
        "Insert",
    },
    relative_events = {
        "InsertLeave",
    },
}

local function set_numbering(relative)
    if options.excluded_fts[vim.o.filetype] ~= nil then
        vim.o.number = false
        vim.o.relativenumber = false
    else
        vim.o.number = true
        vim.o.relativenumber = true
    end
end

local group = vim.api.nvim_create_augroup("Numbering", { clear = true })

local function create_autocmds(autocmds, relative)
    vim.api.nvim_create_autocmd(autocmds, {
        group = group,
        callback = function()
            set_numbering(relative)
        end,
    })
end

create_autocmds(options.norelative_events)
create_autocmds(options.relative_events)

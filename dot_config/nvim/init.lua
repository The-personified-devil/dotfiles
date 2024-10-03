vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- vim.g.loaded_gzip              = 1
-- vim.g.loaded_tar               = 1
-- vim.g.loaded_tarPlugin         = 1
-- vim.g.loaded_zip               = 1
-- vim.g.loaded_zipPlugin         = 1
-- vim.g.loaded_getscript         = 1
-- vim.g.loaded_getscriptPlugin   = 1
-- vim.g.loaded_vimball           = 1
-- vim.g.loaded_vimballPlugin     = 1
-- vim.g.loaded_matchit           = 1
-- vim.g.loaded_matchparen        = 1
-- vim.g.loaded_2html_plugin      = 1
-- vim.g.loaded_logiPat           = 1
-- vim.g.loaded_rrhelper          = 1
-- vim.g.loaded_netrw             = 1
-- vim.g.loaded_netrwPlugin       = 1
-- vim.g.loaded_netrwSettings     = 1
-- vim.g.loaded_netrwFileHandlers = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.opt.mouse = ""

vim.keymap.set("i", "<Tab>", "<Tab>", { silent = true })

vim.opt.eventignore:append({ "CursorHold", "CursorHoldI" })

vim.g.cursorhold_updatetime = 4000

local group = vim.api.nvim_create_augroup("fix_cursorhold", {})
vim.api.nvim_clear_autocmds({ group = group })

local cursorhold_timer = vim.loop.new_timer()
local cursorholdi_timer = vim.loop.new_timer()

vim.api.nvim_create_autocmd("CursorMoved", {
    group = group,
    callback = function()
        cursorhold_timer:start(
            vim.g.cursorhold_updatetime,
            0,
            vim.schedule_wrap(function()
                vim.opt.eventignore:remove("CursorHold")
                vim.api.nvim_exec_autocmds("CursorHold", { modeline = false })
                vim.opt.eventignore:append("CursorHold")
            end)
        )
    end,
})

vim.api.nvim_create_autocmd("CursorMovedI", {
    group = group,
    callback = function()
        cursorholdi_timer:start(
            vim.g.cursorhold_updatetime,
            0,
            vim.schedule_wrap(function()
                vim.opt.eventignore:remove("CursorHoldI")
                vim.api.nvim_exec_autocmds("CursorHoldI", { modeline = false })
                vim.opt.eventignore:append("CursorHoldI")
            end)
        )
    end,
})

require("plugins")

-- Prevent screen shake from plugins initializing
vim.o.showtabline = 2
vim.o.signcolumn = "yes"

-- Use first screen draw autocmd?
local lazytime = 50

vim.fn.sign_define(
    "DiagnosticSignError",
    { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
)
vim.fn.sign_define(
    "DiagnosticSignWarn",
    { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" }
)
vim.fn.sign_define(
    "DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint", linehl = "", numhl = "" }
)
vim.fn.sign_define(
    "DiagnosticSignInfo",
    { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" }
)

vim.diagnostic.config({ severity_sort = true })

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]e", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>e", function()
    vim.diagnostic.open_float(nil, { scope = "line" })
end, opts)

vim.o.termguicolors = true
vim.o.foldenable = false
vim.o.number = true
vim.o.relativenumber = true

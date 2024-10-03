local opts = { noremap = true, silent = true }

local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
})

vim.api.nvim_set_keymap(
    "n",
    "<leader>ff",
    "<CMD>lua require('telescope.builtin').find_files()<CR>",
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fg",
    "<CMD>lua require('telescope.builtin').live_grep()<CR>",
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fb",
    "<CMD>lua require('telescope.builtin').buffers()<CR>",
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fh",
    "<CMD>lua require('telescope.builtin').help_tags()<CR>",
    opts
)

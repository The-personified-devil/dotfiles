local plugins = {}

-- eeeh for now, don't  know yet
plugins["chentoast/marks.nvim"] = {
    config = function()
        require("marks").setup({
            builtin_marks = {
                "'",
                "^",
                ".",
                "<",
                ">",
            },
            force_write_shada = true,
            excluded_filetypes = { "" },
        })
    end,
    opt = true,
    wants = { "nvim-lua/plenary.nvim" },
}

return plugins

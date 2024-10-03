local cmp, luasnip = require("cmp"), require("luasnip")

cmp.setup({
    mapping = {
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-Space>"] = cmp.mapping.complete(),

        ["<C-CR>"] = cmp.mapping.confirm({ select = true }),

        ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                cmp.complete()
            end
        end, {
            "i",
            "s",
        }),

        ["<C-i>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, {
            "i",
            "s",
        }),
    },
    -- use groups
    sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "neorg" },
    }, {
        { name = "buffer" },
    }),
    snippet = {
        expand = function(arg)
            luasnip.lsp_expand(arg.body)
        end,
    },
    experimental = {
        ghost_text = true,
    },
})

cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})

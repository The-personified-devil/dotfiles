local cmp = require("cmp")

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup({
	mapping = {
		["<C-e>"] = cmp.mapping.close(),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-Space>"] = cmp.mapping.complete(),

		["<CR>"] = function()
			if not cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }) then
				vim.fn.feedkeys(require("nvim-autopairs").autopairs_cr(), "n")
			end
		end,

		["<Tab>"] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
			elseif check_back_space() then
				fallback()
			else
				cmp.complete()
			end
		end,

		["<S-Tab>"] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "path" },
		{ name = "buffer" },
		{ name = "nvim_lsp" },
	},
	snippet = {
		expand = function(arg)
			require("luasnip").lsp_expand(arg.body)
		end,
	},
})

--[[ elseif vim.fn['vsnip#available']() == 1 then
      	vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '') ]]

vim.api.nvim_set_keymap("i", "<C-I>", "<cmd>lua require('luasnip').jump(1)<CR>", {})
vim.api.nvim_set_keymap("i", "<C-F>", "<cmd>lua require('luasnip').jump(1)<CR>", {})

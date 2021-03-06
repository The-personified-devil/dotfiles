local nvim_lsp = require("lspconfig")
local util = vim.lsp.util

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)

	buf_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>x", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

	buf_set_keymap("n", "<leader>bb", "<cmd>lua print(vim.inspect(vim.lsp.codelens.get(" .. bufnr .. ")))<CR>", opts)

	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end

	if client.resolved_capabilities.document_highlight then
		vim.cmd([[
      			hi LspReferenceText cterm=bold gui=underline cterm=underline
      			hi LspReferenceRead cterm=bold gui=underline cterm=underline
      			hi LspReferenceWrite cterm=bold gui=underline cterm=underline

      			augroup lsp_document_highlight
        			autocmd! * <buffer>
        			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      			augroup END
    		]])
	end
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local servers = {
	clangd = {},
	pyright = {},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					enable = false,
				},
				lens = {
					enable = true,
					methodReferences = true,
					references = true,
					run = true,
					debug = true,
					implementations = true,
				},
			},
		},
	},
	sumneko_lua = {
		cmd = { "lua-language-server", "-E", "/usr/share/lua-language-server/main.lua" },
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = runtime_path,
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
}

local function handler(_, result, ctx, config)
	-- error(vim.inspect(result))
	config = config or {}
	config.focus_id = ctx.method

	if not (result and result.contents) then
		return
	end

	local markdown_lines = util.convert_input_to_markdown_lines(result.contents)
	markdown_lines = util.trim_empty_lines(markdown_lines)

	if vim.tbl_isempty(markdown_lines) then
		return
	end

	table.insert(markdown_lines, "")
	table.insert(markdown_lines, "Hover actions:")
	for _, action in ipairs(result.actions) do
		for i, command in ipairs(action.commands) do
			table.insert(markdown_lines, i .. ": " .. command.title)
		end
	end

	return util.open_floating_preview(markdown_lines, "markdown", config)
end

function Callfuck()
	vim.lsp.buf_request(0, "textDocument/hover", vim.lsp.util.make_position_params(), handler)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

capabilities.experimental = {
	hoverActions = true,
	-- hoverRange = true,
}

for lsp, conf in pairs(servers) do
	local setup = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	for k, v in pairs(conf) do
		setup[k] = v
	end
	-- Use extend maybe

	nvim_lsp[lsp].setup(setup)
end

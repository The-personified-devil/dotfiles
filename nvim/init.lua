require("plugins")
require("lsp")
require("ts")
require("completion")
require("filemgr")

vim.g.mapleader = " "

require("lualine").setup({ options = { theme = "gruvbox" } })

require("dapui").setup({
	icons = {
		expanded = "▾",
		collapsed = "▸",
	},
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
	},
	sidebar = {
		open_on_start = true,
		elements = {
			-- You can change the order of elements in the sidebar
			"scopes",
			"breakpoints",
			"stacks",
			"watches",
		},
		width = 40,
		position = "left", -- Can be "left" or "right"
	},
	tray = {
		open_on_start = true,
		elements = {
			"repl",
		},
		height = 10,
		position = "bottom", -- Can be "bottom" or "top"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
	},
})

dap = require("dap")
dap.adapters.cpp = {
	type = "executable",
	stopOnEntry = true,
	attach = {
		pidProperty = "pid",
		pidSelect = "ask",
	},
	command = "lldb-vscode",
	env = {
		LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES",
	},
	name = "lldb",
}

local last_gdb_config

start_c_debugger = function(args, mi_mode, mi_debugger_path)
	if args and #args > 0 then
		last_gdb_config = {
			type = "cpp",
			name = args[1],
			request = "launch",
			program = table.remove(args, 1),
			args = args,
			cwd = vim.fn.getcwd(),
			env = {}, -- environment variables are set via `ENV_VAR_NAME=value` pairs
			externalConsole = true,
			MIMode = mi_mode or "gdb",
			MIDebuggerPath = mi_debugger_path,
		}
	end

	if not last_gdb_config then
		print('No binary to debug set! Use ":DebugC <binary> <args>"')
		return
	end

	dap.run(last_gdb_config)
	-- dap.repl.open()
end

require("nvim-web-devicons").setup({
	override = {
		lir_folder_icon = {
			icon = "",
			color = "#7ebae4",
			name = "LirFolderNode",
		},
	},
})

require("trouble").setup()

require("indent_blankline").setup({
	char = "|",
	show_trailing_blankline_indent = false,
	buftype_exclude = { "terminal", "help" },
})

local npairs = require("nvim-autopairs")
npairs.setup({
	check_ts = true,
	fast_wrap = {},
})
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))

require("numb").setup()

require'nvim-treesitter.configs'.setup {
    textsubjects = {
        enable = true,
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
        }
    },
}

vim.cmd([[
    command! -complete=file -nargs=* DebugC lua start_c_debugger({<f-args>}, "gdb")
]])

vim.cmd([[
  hi link TroubleSignError GruvboxRed
  hi link TroubleSignHint GruvboxAqua
  hi link TroubleSignWarning GruvboxYellow
  hi link TroubleSignInformation GruvboxBlue
  hi link TroubleFoldIcon GruvboxGreen
  hi link TroubleCount GruvboxGreen
]])

vim.cmd("colorscheme gruvbox")

vim.o.termguicolors = true
vim.o.foldenable = false
vim.o.number = true
vim.o.relativenumber = true

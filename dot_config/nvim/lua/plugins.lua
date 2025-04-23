local function map(...)
    vim.keymap.set(...)
end

require("lazy").setup({
    {
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup()
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async", "nvim-treesitter/nvim-treesitter" },
        event = "BufRead",
        priority = 500,
        config = function()
            vim.o.foldcolumn = '1' -- '0' is not bad
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

            require('ufo').setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { 'treesitter', 'indent' }
                end
            })
        end
    },
    -- {
    --     "cbochs/portal.nvim",
    --     init = function()
    --         vim.keymap.set("n", "<leader>o", require("portal").jump_backward, {})
    --         vim.keymap.set("n", "<leader>i", require("portal").jump_forward, {})
    --     end,
    -- },
    {
        "folke/trouble.nvim",
        lazy = true,
        dependencies = { "nvim-web-devicons" },
        init = function()
            local opts = { remap = false, silent = true }

            -- Don't map lsp definitons and type definitons, as there should normally only be one of them, so routing through Trouble would only add overhead
            map("n", "gr", function()
                require("trouble").action("lsp_references")
            end, opts)

            map("n", "<leader>xd", function()
                require("trouble").action("document_diagnostics")
            end)

            map("n", "<leader>xw", function()
                require("trouble").action("workspace_diagnostics")
            end)

            map("n", "<leader>xq", function()
                require("trouble").action("quickfix")
            end)

            map("n", "<leader>xl", function()
                require("trouble").action("loclist")
            end)
        end,
        config = function()
            require("trouble").setup({ padding = false, use_diagnostic_signs = true })
            -- Switch to lua
            vim.cmd([[
  				hi link TroubleSignError GruvboxRed
  				hi link TroubleSignHint GruvboxAqua
  				hi link TroubleSignWarning GruvboxYellow
  				hi link TroubleSignInformation GruvboxBlue
  				hi link TroubleFoldIcon GruvboxGreen
				hi link TroubleCount GruvboxGreen
			]])
        end
    },
    -- Does it properly detect trouble when it's loaded afterwards
    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup()
        end,
    },
    -- Load only for supported file types?
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        -- dependencies = { "hrsh7th/cmp-nvim-lsp", },
        config = function()
            require("lsp")
        end,
    },
    -- Only load for supported file types
    {
        "brymer-meneses/grammar-guard.nvim",
        dependencies = { "nvim-lspconfig" },
    },
    {
        'saghen/blink.cmp',
        -- -- optional: provides snippets for the snippet source
        -- dependencies = 'rafamadriz/friendly-snippets',

        build = 'nix run .#build-plugin',

        opts = {
            keymap = {
                ['<C-n>'] = {
                    function(cmp)
                        return cmp.snippet_forward()
                    end,
                    'select_next',
                    'fallback'
                },
                ['<C-i>'] = {
                    function(cmp)
                        return cmp.snippet_backward()
                    end,
                    'select_prev',
                    'fallback'
                },
                ['<C-CR>'] = { 'select_and_accept' },
                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, via `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- experimental auto-brackets support
            -- completion = { accept = { auto_brackets = { enabled = true } } }

            -- experimental signature help support
            -- signature = { enabled = true }
        },
        -- allows extending the enabled_providers array elsewhere in your config
        -- without having to redefine it
        opts_extend = { "sources.completion.enabled_providers" }
    },
    -- Configure
    -- { "L3MON4D3/LuaSnip" },
    -- {
    --     "hrsh7th/nvim-cmp",
    --     event = "InsertEnter",
    --     dependencies = {
    --         { "hrsh7th/cmp-buffer" },
    --         { "hrsh7th/cmp-path" },
    --         { "hrsh7th/cmp-nvim-lua" },
    --         { "LuaSnip" }
    --     },
    --     -- "Modernize"
    --     config = function()
    --         require("completion")
    --     end,
    -- },
    -- TODO: Fix lazy loading
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make", },
        },
        init = function()
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("undo")

            vim.keymap.set("n", "<leader>u", require("telescope").extensions.undo.undo)
        end,
        config = function()
            require("tele")
        end,
    },
    -- {
    --     "gruvbox-community/gruvbox",
    --     priority = 1000,
    --     config = function()
    --         vim.cmd("colorscheme gruvbox")
    --     end,
    -- },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup()
            vim.cmd("colorscheme gruvbox")
        end
    },
    {
        "windwp/windline.nvim",
        config = function()
            require("wlsample.evil_line")
        end,
    },
    {
        "nanozuki/tabby.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            local filename = require("tabby.filename")
            local util = require("tabby.util")

            local hl_tabline = util.extract_nvim_hl("TabLine")
            local hl_tabline_sel = util.extract_nvim_hl("TabLineSel")
            local hl_tabline_fill = util.extract_nvim_hl("TabLineFill")

            require("tabby").setup({

                tabline = {
                    hl = "TabLineFill",
                    layout = "active_wins_at_tail",
                    head = {
                        { "  ", hl = { fg = hl_tabline.fg, bg = hl_tabline.bg } },
                        { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
                    },
                    active_tab = {
                        label = function(tabid)
                            return {
                                "  " .. tabid .. " ",
                                hl = {
                                    fg = hl_tabline_sel.fg,
                                    bg = hl_tabline_sel.bg,
                                    style = "bold",
                                },
                            }
                        end,
                        left_sep = {
                            "",
                            hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg },
                        },
                        right_sep = {
                            "",
                            hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg },
                        },
                    },
                    inactive_tab = {
                        label = function(tabid)
                            return {
                                "  " .. tabid .. " ",
                                hl = {
                                    fg = hl_tabline.fg,
                                    bg = hl_tabline.bg,
                                    style = "bold",
                                },
                            }
                        end,
                        left_sep = {
                            "",
                            hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg },
                        },
                        right_sep = {
                            "",
                            hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg },
                        },
                    },
                    top_win = {
                        label = function(winid)
                            return {
                                "  " .. filename.unique(winid) .. " ",
                                hl = {
                                    fg = hl_tabline_sel.fg,
                                    bg = hl_tabline_sel.bg,
                                    style = "bold",
                                },
                            }
                        end,
                        left_sep = {
                            "",
                            hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg },
                        },
                        right_sep = {
                            "",
                            hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg },
                        },
                    },
                    win = {
                        label = function(winid)
                            return {
                                "  " .. filename.unique(winid) .. " ",
                                hl = {
                                    fg = hl_tabline.fg,
                                    bg = hl_tabline.bg,
                                    style = "bold",
                                },
                            }
                        end,
                        left_sep = {
                            "",
                            hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg },
                        },
                        right_sep = {
                            "",
                            hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg },
                        },
                    },
                    tail = {
                        { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
                        { "  ", hl = { fg = hl_tabline.fg, bg = hl_tabline.bg } },
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            })
        end,
    },
    {
        "RRethy/nvim-treesitter-textsubjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter.configs").setup({
                textsubjects = {
                    enable = true,
                    keymaps = {
                        ["."] = "textsubjects-smart",
                        [";"] = "textsubjects-container-outer",
                    },
                },
            })
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({ ignore = "^$" })
        end,
    },
    -- Lazy load
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            dap.adapters.lldb = {
                type = "executable",
                command = "/usr/bin/lldb-vscode",
                name = "lldb",
            }

            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        -- Use vim.ui.input()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                    runInTerminal = true,
                },
            }
            dap.configurations.rust = {
                {
                    name = "Remote attach",
                    type = "lldb",
                    request = "attach",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    attachCommands = function()
                        return {
                            "gdb-remote " .. vim.fn.input("Remote server address: "),
                        }
                    end,
                }
            }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        -- after = { "nvim-dap" },
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                whitespace = {
                    remove_blankline_trail = false
                }
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            local npairs = require("nvim-autopairs")

            npairs.setup({
                check_ts = true,
                fast_wrap = {},
            })

            npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))

            vim.keymap.set("i", "CR", function()
                vim.api.nvim_feedkeys(require("nvim-autopairs").autopairs_cr(), "n", true)
            end, { silent = true })
        end,
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end
    },
    {
        "ggandor/flit.nvim",
        dependencies = { "ggandor/leap.nvim" },
        config = true,
    },
    {
        "ggandor/leap-spooky.nvim",
        dependencies = { "ggandor/leap.nvim" },
        config = true,
    },
    {
        "ldelossa/litee.nvim",
        lazy = true,
        config = function()
            require("litee.lib").setup({
                tree = {
                    icon_set = "nerd",
                },
                panel = {
                    orientation = "left",
                    panel_size = 30,
                },
            })
        end,
    },
    {
        "ldelossa/litee-symboltree.nvim",
        dependencies = { "litee.nvim" },
        config = function()
            require("litee.symboltree").setup({})
        end,
        cmd = "LTPopOutSymboltree",
    },
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "plenary.nvim" },
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "monkoose/matchparen.nvim",
        config = function()
            require("matchparen").setup()
        end,
    }
    ,
    {
        "nvim-neorg/neorg",
        -- build = ":Neorg sync-parsers",
        -- dependencies = "plenary.nvim",
        version = "*",
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.norg.dirman"] = {
                        config = {
                            workspaces = {
                                work = "~/notes/work",
                                home = "~/notes/home",
                            },
                        },
                    },
                    ["core.norg.concealer"] = {},
                    ["core.norg.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        },
                    },
                },
            })
        end,
        ft = "norg",
        cmd = "NeorgStart",
    },
    {
        "folke/neoconf.nvim",
    },
    -- language specific shenanigans
    {
        "Julian/lean.nvim",
        ft = "lean"
    },
    {
        'chomosuke/typst-preview.nvim',
        ft = "typst",
        version = '1.*',
        opts = {}, -- lazy.nvim will implicitly calls `setup {}`
    },
})

-- require("core").process_definition(require("modules.ui.plugins"))

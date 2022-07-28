require("packer_compiled")

return require("packer").startup({
    function(use)
        use("lewis6991/impatient.nvim")

        -- Packer can manage itself
        use("wbthomason/packer.nvim")

        use({
            "nacro90/numb.nvim",
            config = function()
                require("numb").setup()
            end,
        })

        -- Look for alternative
        use({
            "folke/trouble.nvim",
            wants = { "nvim-web-devicons" },
            config = function()
                local trouble = require("trouble")

                local function map(...)
                    vim.keymap.set(...)
                end

                local opts = { remap = false, silent = true }

                trouble.setup({ padding = false, use_diagnostic_signs = true })

                -- Don't map lsp definitons and type definitons, as there should normally only be one of them, so routing through Trouble would only add overhead
                map("n", "gr", function()
                    trouble.action("lsp_references")
                end, opts)

                map("n", "<leader>xd", function()
                    trouble.action("document_diagnostics")
                end)

                map("n", "<leader>xw", function()
                    trouble.action("workspace_diagnostics")
                end)

                map("n", "<leader>xq", function()
                    trouble.action("quickfix")
                end)

                map("n", "<leader>xl", function()
                    trouble.action("loclist")
                end)

                -- Switch to lua
                vim.cmd([[
  				hi link TroubleSignError GruvboxRed
  				hi link TroubleSignHint GruvboxAqua
  				hi link TroubleSignWarning GruvboxYellow
  				hi link TroubleSignInformation GruvboxBlue
  				hi link TroubleFoldIcon GruvboxGreen
				hi link TroubleCount GruvboxGreen
			]]            )
            end,
            opt = true,
        })

        -- Load w/o trouble?
        use({
            "folke/todo-comments.nvim",
            wants = { "trouble.nvim" },
            config = function()
                require("todo-comments").setup()
            end,
            opt = true,
        })

        -- Load only for supported file types?
        use({
            "neovim/nvim-lspconfig",
            config = function()
                require("lsp")
            end,
        })

        -- Only load for supported file types
        use({
            "brymer-meneses/grammar-guard.nvim",
            wants = { "nvim-lspconfig" },
        })

        -- Configure
        use({ "L3MON4D3/LuaSnip", opt = true })

        use({
            "hrsh7th/nvim-cmp",
            requires = {
                { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
                { "hrsh7th/cmp-path", after = "nvim-cmp" },
                { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
                { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
            },
            wants = { "LuaSnip" },
            config = function()
                require("completion")
            end,
            event = "InsertEnter",
        })

        use({
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim", opt = true },
            wants = { "plenary.nvim" },
            config = function()
                require("tele")
            end,
            opt = true,
        })

        use({
            "nvim-telescope/telescope-fzy-native.nvim",
            after = "telescope.nvim",
            config = function()
                require("telescope").load_extension("fzy_native")
            end,
        })

        use({
            "gruvbox-community/gruvbox",
            config = function()
                vim.cmd("colorscheme gruvbox")
            end,
        })


        use({
            "windwp/windline.nvim",
            config = function()
                require("wlsample.evil_line")
            end,
            opt = true,
        })

        -- Reevaluate and probably replace
        use({
            "nanozuki/tabby.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            after = "gruvbox",
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
            opt = true,
        })
        use({ "andweeb/presence.nvim", opt = true })

        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
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

                vim.o.foldmethod = "expr"
                vim.o.foldexpr = "nvim_treesitter#foldexpr()"
                vim.o.foldtext = "Foldfn()"

                vim.cmd([[
    				function! Foldfn()
        			return getline(v:foldstart)
    				endfunction
			]]            )
            end,
        })

        use({
            "RRethy/nvim-treesitter-textsubjects",
            wants = { "nvim-treesitter/nvim-treesitter" },
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
        })

        use({
            "nvim-treesitter/playground",
            wants = { "nvim-treesitter" },
            config = function()
                require("nvim-treesitter.configs").setup({
                    playground = {
                        enable = true,
                    },
                    query_linter = {
                        enable = true,
                    },
                })
            end,
            cmd = {
                "TSPlaygroundToggle",
                "TSCaptureUnderCursor",
                "TSNodeUnderCursor",
                "TSHighlightCapturesUnderCursor",
            },
        })

        use({
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup({ ignore = "^$" })
            end,
        })

        use({
            "gpanders/editorconfig.nvim",
        })

        -- Lazy load
        use({
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
            end,
            opt = true,
        })

        -- Required to be first?
        use({
            "rcarriga/nvim-dap-ui",
            after = { "nvim-dap" },
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
        })

        use({
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup({
                    show_trailing_blankline_indent = false,
                    buftype_exclude = { "terminal", "help", "packer" },
                })
            end,
        })

        use({
            "windwp/nvim-autopairs",
            requires = { "nvim-treesitter/nvim-treesitter" },
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
        })


        use({
            "ggandor/lightspeed.nvim",
            config = function()
                require("lightspeed").setup({})
            end,
        })

        use({
            "ldelossa/litee.nvim",
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
            opt = true,
        })

        use({
            "ldelossa/litee-symboltree.nvim",
            wants = { "litee.nvim" },
            config = function()
                require("litee.symboltree").setup({})
            end,
            cmd = "LTPopOutSymboltree",
        })

        use({
            "lewis6991/gitsigns.nvim",
            wants = { "plenary.nvim" },
            config = function()
                require("gitsigns").setup()
            end,
            opt = true,
        })

        use({
            "monkoose/matchparen.nvim",
            config = function()
                require("matchparen").setup()
            end,
        })

        use({
            "nvim-neorg/neorg",
            wants = "plenary.nvim",
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
        })
    end,
    config = {
        -- Move to lua dir so impatient.nvim can cache it
        compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
        profile = {
            enable = true,
        },
    },
})

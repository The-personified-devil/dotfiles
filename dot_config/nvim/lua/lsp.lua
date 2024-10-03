local M =
{
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp", },
}

require("neoconf").setup({
  -- override any of the default settings here
})

local nvim_lsp = require("lspconfig")
local util = vim.lsp.util

local on_attach = function(_, bufnr)
    local function map(...)
        vim.keymap.set(...)
    end

    local opts = { remap = false, silent = true, buffer = bufnr }

    map("n", "gD", vim.lsp.buf.declaration, opts)

    map("n", "gd", vim.lsp.buf.definition, opts)

    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "gr", vim.lsp.buf.references, opts)

    map("n", "<leader>D", vim.lsp.buf.type_definition, opts)

    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    map("n", "<leader>r", vim.lsp.buf.rename, opts)
    map("n", "<leader>x", vim.lsp.buf.code_action, opts)

    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    map("n", "<leader>bb", function()
        print(vim.inspect(vim.lsp.codelens.get(" .. bufnr .. ")))
    end, opts)

    map("n", "<leader>f", vim.lsp.buf.format, opts)
    -- map("v", "<leader>f", vim.lsp.buf.range_formatting, opts)

    vim.api.nvim_set_hl(0, "LspReferenceText", { underline = true })
    vim.api.nvim_set_hl(0, "LspReferenceRead", { underline = true })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { underline = true })

    local group = vim.api.nvim_create_augroup("lsp_document_highlight", {})

    vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

    vim.api.nvim_create_autocmd("CursorHold", {
        group = group,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.document_highlight()
        end,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = group,
        buffer = bufnr,
        callback =  function(ev)
            vim.lsp.buf.clear_references(ev.buf)
        end,
    })
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('lean').setup{
  abbreviations = { builtin = true },
  lsp = { on_attach = on_attach },
  -- lsp3 = { on_attach = on_attach },
  mappings = true,
}

local servers = {
    clangd = { cmd = { "clangd", "-completion-style=detailed" } },
    pyright = {},
    rust_analyzer = {
        -- cmd = { "/home/duck/devel/rrust/build/host/stage2-tools-bin/rust-analyzer" },
        settings = {
            ["rust-analyzer"] = {
                lens = {
                    enable = true,
                    methodReferences = true,
                    references = true,
                    run = true,
                    debug = true,
                    implementations = true,
                },
                -- cargo = { target = "x86_64-unknown-atomkern", },
                -- checkOnSave = { allTargets = false,
                --     overrideCommand = {
                --         "cargo",
                --         "check",
                --         -- "clippy",
                --         "--message-format=json",
                --         "--bins",
                --         -- "--all-features",
                --         "--target",
                --         "x86_64-unknown-atomkern", 
                --         -- "kernel/x64.json",
                --     },
                -- },
            },
        },
    },
    ltex = { settings = { ltex = { enabled = { "latex", "tex", "bibtex", "markdown" }, language = "de-DE" } } },
    texlab = { settings = { texlab = { latexindent = { modifyLineBreaks = true } } } },
    lua_ls = {
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
    hls = {},
}

local function handler(_, result, ctx, config)
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
local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
vim.tbl_deep_extend("force", capabilities, cmp_caps)

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

return M

local windline = require("windline")
local helpers = require("windline.helpers")
local sep = helpers.separators

local b_comps = require("windline.components.basic")
local git_comps = require("windline.components.git")
local vim_comps = require("windline.components.vim")
local lsp_comps = require("windline.components.lsp")

local state = _G.WindLine.state

local breakpoint_width = 90

local hl_list = {
    default = { "black_light", "black" },
    dark_text = { "white_light", "black" },
    bright_text = { "white_light", "black_light" },
}

local basic = {}

local colors_mode = {
    Normal = { "red", "black_light", "bold" },
    Insert = { "green", "black_light", "bold" },
    Visual = { "yellow", "black_light", "bold" },
    Replace = { "blue_light", "black_light", "bold" },
    Command = { "magenta", "black_light", "bold" },
}

-- Includes padding whitespace
basic.vi_mode = {
    name = "vi_mode",
    hl_colors = colors_mode,
    text = function()
        return { { " " .. state.mode[1] .. " ", state.mode[2] } }
    end,
}

-- Includes padding whitespace
basic.git = {
    name = "git",
    hl_colors = {
        green = { "green", "black" },
        red = { "red", "black" },
        blue = { "blue", "black" },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if git_comps.is_git(bufnr) then
            return {
                { git_comps.diff_added({ format = "  %s", show_zero = true }), "green" },
                { git_comps.diff_removed({ format = "  %s", show_zero = true }), "red" },
                { git_comps.diff_changed({ format = " 柳%s ", show_zero = true }), "blue" },
            }
        end
        return ""
    end,
}

-- Includes padding whitespace
basic.lsp_diagnos = {
    name = "diagnostic",
    hl_colors = {
        red = { "red", "black" },
        yellow = { "yellow", "black" },
        blue = { "blue", "black" },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_error({ format = "  %s", show_zero = true }), "red" },
                { lsp_comps.lsp_warning({ format = "  %s", show_zero = true }), "yellow" },
                { lsp_comps.lsp_hint({ format = "  %s ", show_zero = true }), "blue" },
            }
        end
        return ""
    end,
}

basic.git_branch = {}

local default = {
    filetypes = { "default" },
    active = {
        basic.vi_mode,
        { sep.slant_right_2, hl_list.default },
        { git_comps.git_branch({}), hl_list.dark_text },
        { " " .. sep.slant_left, hl_list.default },
        { " ", hl_list.bright_text },
        { b_comps.file_name(), "" },
        { sep.slant_right_2, hl_list.default },
        basic.lsp_diagnos,
        basic.git,
        -- {vim_comps.search_count(),{"cyan", "NormalBg"}},
        { b_comps.divider, "" },
        { " ", { "white_light", "black_light" } },
        { b_comps.file_type({ icon = true }), "" },
        { " ", "" },
        { b_comps.file_encoding(), "" },
        { " ", "" },
        { b_comps.file_format({ icon = true }), { "white_light", "black_light" } },
        { " ", "" },
        basic.right_sep,
        basic.right,
    },
    inactive = {
        { b_comps.full_file_name, hl_list.Inactive },
        basic.divider,
        basic.divider,
        { b_comps.line_col, hl_list.Inactive },
        { b_comps.progress, hl_list.Inactive },
    },
}

windline.setup({
    statuslines = {
        default,
    },
})

-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = true
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/duck/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/duck/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/duck/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/duck/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/duck/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vignore\a^$\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = false,
    needs_bufread = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/duck/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/duck/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/duck/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim",
    wants = { "plenary.nvim" }
  },
  ["grammar-guard.nvim"] = {
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/grammar-guard.nvim",
    url = "https://github.com/brymer-meneses/grammar-guard.nvim",
    wants = { "nvim-lspconfig" }
  },
  gruvbox = {
    after = { "tabby.nvim" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\bvim\0" },
    loaded = true,
    only_config = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/gruvbox-community/gruvbox"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nñ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\4\0\0\rterminal\thelp\vpacker\1\0\1#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["litee-symboltree.nvim"] = {
    commands = { "LTPopOutSymboltree" },
    config = { "\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21litee.symboltree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/litee-symboltree.nvim",
    url = "https://github.com/ldelossa/litee-symboltree.nvim",
    wants = { "litee.nvim" }
  },
  ["litee.nvim"] = {
    config = { "\27LJ\2\nã\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\npanel\1\0\2\15panel_size\3\30\16orientation\tleft\ttree\1\0\0\1\0\1\ricon_set\tnerd\nsetup\14litee.lib\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/litee.nvim",
    url = "https://github.com/ldelossa/litee.nvim"
  },
  ["marks.nvim"] = {
    after = { "plenary.nvim" },
    config = { "\27LJ\2\në\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\23excluded_filetypes\1\2\0\0\5\18builtin_marks\1\0\1\22force_write_shada\2\1\6\0\0\6'\6^\6.\6<\6>\nsetup\nmarks\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim",
    wants = { "plenary.nvim" }
  },
  ["matchparen.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15matchparen\frequire\0" },
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/matchparen.nvim",
    url = "https://github.com/monkoose/matchparen.nvim"
  },
  neorg = {
    commands = { "NeorgStart" },
    config = { "\27LJ\2\nü\2\0\0\a\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0004\4\0\0=\4\4\0035\4\b\0005\5\6\0005\6\5\0=\6\a\5=\5\t\4=\4\n\0034\4\0\0=\4\v\0035\4\r\0005\5\f\0=\5\t\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\tload\1\0\0\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\24core.norg.concealer\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\2\thome\17~/notes/home\twork\17~/notes/work\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/nvim-neorg/neorg",
    wants = { "plenary.nvim" }
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\ns\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0006\2\3\0'\4\4\0B\2\2\0029\2\5\2B\2\1\2'\3\6\0+\4\2\0B\0\4\1K\0\1\0\6n\17autopairs_cr\19nvim-autopairs\frequire\18nvim_feedkeys\bapi\bvimﬁ\1\1\0\a\0\14\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\0\0=\4\4\3B\1\2\0019\1\5\0006\3\0\0'\5\6\0B\3\2\0A\1\0\0016\1\a\0009\1\b\0019\1\t\1'\3\n\0'\4\v\0003\5\f\0005\6\r\0B\1\5\1K\0\1\0\1\0\1\vsilent\2\0\aCR\6i\bset\vkeymap\bvim%nvim-autopairs.rules.endwise-lua\14add_rules\14fast_wrap\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lua", "cmp-buffer", "cmp-path" },
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15completion\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp",
    wants = { "LuaSnip" }
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui" },
    config = { "\27LJ\2\ng\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimä\2\1\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0=\2\3\0019\1\5\0004\2\3\0005\3\a\0003\4\b\0=\4\t\3>\3\1\2=\2\6\1K\0\1\0\fprogram\0\1\0\6\bcwd\23${workspaceFolder}\18runInTerminal\2\16stopOnEntry\2\ttype\tlldb\tname\vLaunch\frequest\vlaunch\bcpp\19configurations\1\0\3\ttype\15executable\tname\tlldb\fcommand\25/usr/bin/lldb-vscode\tlldb\radapters\bdap\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n\30\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\topen\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nclose⁄\1\1\0\4\0\14\0\0256\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1B\2\1\0019\2\4\0009\2\5\0029\2\6\0023\3\b\0=\3\a\0029\2\4\0009\2\t\0029\2\n\0023\3\v\0=\3\a\0029\2\4\0009\2\t\0029\2\f\0023\3\r\0=\3\a\0022\0\0ÄK\0\1\0\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\nsetup\ndapui\bdap\frequire\0" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0" },
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\në\4\0\0\5\0\22\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0'\1\15\0=\1\14\0006\0\f\0009\0\r\0'\1\17\0=\1\16\0006\0\f\0009\0\r\0'\1\19\0=\1\18\0006\0\f\0009\0\20\0'\2\21\0B\0\2\1K\0\1\0^    \t\t\t\tfunction! Foldfn()\n        \t\t\treturn getline(v:foldstart)\n    \t\t\t\tendfunction\n\t\t\t\bcmd\rFoldfn()\rfoldtext\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\6o\bvim\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\19init_selection\bgnn\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textsubjects"] = {
    config = { "\27LJ\2\n≥\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\17textsubjects\1\0\0\fkeymaps\1\0\2\6.\23textsubjects-smart\6;!textsubjects-container-outer\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects",
    wants = { "nvim-treesitter/nvim-treesitter" }
  },
  ["nvim-web-devicons"] = {
    load_after = {
      ["tabby.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle", "TSCaptureUnderCursor", "TSNodeUnderCursor", "TSHighlightCapturesUnderCursor" },
    config = { "\27LJ\2\nä\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\17query_linter\1\0\1\venable\2\15playground\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground",
    wants = { "nvim-treesitter" }
  },
  ["plenary.nvim"] = {
    load_after = {
      ["marks.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["tabby.nvim"] = {
    after = { "nvim-web-devicons" },
    config = { "\27LJ\2\ng\0\1\5\1\a\0\0155\1\5\0'\2\0\0\18\3\0\0'\4\1\0&\2\4\2>\2\1\0015\2\3\0-\3\0\0009\3\2\3=\3\2\2-\3\0\0009\3\4\3=\3\4\2=\2\6\1L\1\2\0\3¿\ahl\1\0\0\abg\1\0\1\nstyle\tbold\afg\6 \n ÔÉà g\0\1\5\1\a\0\0155\1\5\0'\2\0\0\18\3\0\0'\4\1\0&\2\4\2>\2\1\0015\2\3\0-\3\0\0009\3\2\3=\3\2\2-\3\0\0009\3\4\3=\3\4\2=\2\6\1L\1\2\0\2¿\ahl\1\0\0\abg\1\0\1\nstyle\tbold\afg\6 \n ÔÇñ |\0\1\6\2\b\0\0185\1\6\0'\2\0\0-\3\0\0009\3\1\3\18\5\0\0B\3\2\2'\4\2\0&\2\4\2>\2\1\0015\2\4\0-\3\1\0009\3\3\3=\3\3\2-\3\1\0009\3\5\3=\3\5\2=\2\a\1L\1\2\0\0¿\3¿\ahl\1\0\0\abg\1\0\1\nstyle\tbold\afg\6 \vunique\n ÔÜí |\0\1\6\2\b\0\0185\1\6\0'\2\0\0-\3\0\0009\3\1\3\18\5\0\0B\3\2\2'\4\2\0&\2\4\2>\2\1\0015\2\4\0-\3\1\0009\3\3\3=\3\3\2-\3\1\0009\3\5\3=\3\5\2=\2\a\1L\1\2\0\0¿\2¿\ahl\1\0\0\abg\1\0\1\nstyle\tbold\afg\6 \vunique\n ÔÑå π\a\1\0\r\0008\0ç\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1'\4\4\0B\2\2\0029\3\3\1'\5\5\0B\3\2\0029\4\3\1'\6\6\0B\4\2\0026\5\0\0'\a\a\0B\5\2\0029\5\b\0055\a6\0005\b\t\0004\t\3\0005\n\n\0005\v\f\0009\f\v\2=\f\v\v9\f\r\2=\f\r\v=\v\14\n>\n\1\t5\n\15\0005\v\16\0009\f\r\2=\f\v\v9\f\r\4=\f\r\v=\v\14\n>\n\2\t=\t\17\b5\t\19\0003\n\18\0=\n\20\t5\n\21\0005\v\22\0009\f\r\3=\f\v\v9\f\r\4=\f\r\v=\v\14\n=\n\23\t5\n\24\0005\v\25\0009\f\r\3=\f\v\v9\f\r\4=\f\r\v=\v\14\n=\n\26\t=\t\27\b5\t\29\0003\n\28\0=\n\20\t5\n\30\0005\v\31\0009\f\r\2=\f\v\v9\f\r\4=\f\r\v=\v\14\n=\n\23\t5\n \0005\v!\0009\f\r\2=\f\v\v9\f\r\4=\f\r\v=\v\14\n=\n\26\t=\t\"\b5\t$\0003\n#\0=\n\20\t5\n%\0005\v&\0009\f\r\3=\f\v\v9\f\r\4=\f\r\v=\v\14\n=\n\23\t5\n'\0005\v(\0009\f\r\3=\f\v\v9\f\r\4=\f\r\v=\v\14\n=\n\26\t=\t)\b5\t+\0003\n*\0=\n\20\t5\n,\0005\v-\0009\f\r\2=\f\v\v9\f\r\4=\f\r\v=\v\14\n=\n\23\t5\n.\0005\v/\0009\f\r\2=\f\v\v9\f\r\4=\f\r\v=\v\14\n=\n\26\t=\t0\b4\t\3\0005\n1\0005\v2\0009\f\r\2=\f\v\v9\f\r\4=\f\r\v=\v\14\n>\n\1\t5\n3\0005\v4\0009\f\v\2=\f\v\v9\f\r\2=\f\r\v=\v\14\n>\n\2\t=\t5\b=\b7\aB\5\2\0012\0\0ÄK\0\1\0\ftabline\1\0\0\ttail\1\0\0\1\2\0\0\n ÔÉ∂ \1\0\0\1\2\0\0\bÓÇ∫\bwin\1\0\0\1\2\0\0\bÓÇº\1\0\0\1\2\0\0\bÓÇ∫\1\0\0\0\ftop_win\1\0\0\1\2\0\0\bÓÇº\1\0\0\1\2\0\0\bÓÇ∫\1\0\0\0\17inactive_tab\1\0\0\1\2\0\0\bÓÇº\1\0\0\1\2\0\0\bÓÇ∫\1\0\0\0\15active_tab\14right_sep\1\0\0\1\2\0\0\bÓÇº\rleft_sep\1\0\0\1\2\0\0\bÓÇ∫\nlabel\1\0\0\0\thead\1\0\0\1\2\0\0\bÓÇº\ahl\abg\1\0\0\afg\1\2\0\0\n ÓüÖ \1\0\2\vlayout\24active_wins_at_tail\ahl\16TabLineFill\nsetup\ntabby\16TabLineFill\15TabLineSel\fTabLine\20extract_nvim_hl\15tabby.util\19tabby.filename\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/tabby.nvim",
    url = "https://github.com/nanozuki/tabby.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\15fzy_native\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-fzy-native.nvim" },
    config = { "\27LJ\2\n$\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\ttele\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "plenary.nvim" }
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim",
    wants = { "trouble.nvim" }
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n.\2\0\3\0\3\0\0066\0\0\0009\0\1\0009\0\2\0G\2\0\0A\0\0\1K\0\1\0\bset\vkeymap\bvim3\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\0¿\19lsp_references\vaction9\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\0¿\25document_diagnostics\vaction:\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\0¿\26workspace_diagnostics\vaction-\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\0¿\rquickfix\vaction,\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\0¿\floclist\vaction∫\4\1\0\t\0\20\0(6\0\0\0'\2\1\0B\0\2\0023\1\2\0005\2\3\0009\3\4\0005\5\5\0B\3\2\1\18\3\1\0'\5\6\0'\6\a\0003\a\b\0\18\b\2\0B\3\5\1\18\3\1\0'\5\6\0'\6\t\0003\a\n\0B\3\4\1\18\3\1\0'\5\6\0'\6\v\0003\a\f\0B\3\4\1\18\3\1\0'\5\6\0'\6\r\0003\a\14\0B\3\4\1\18\3\1\0'\5\6\0'\6\15\0003\a\16\0B\3\4\0016\3\17\0009\3\18\3'\5\19\0B\3\2\0012\0\0ÄK\0\1\0ç\2  \t\t\t\thi link TroubleSignError GruvboxRed\n  \t\t\t\thi link TroubleSignHint GruvboxAqua\n  \t\t\t\thi link TroubleSignWarning GruvboxYellow\n  \t\t\t\thi link TroubleSignInformation GruvboxBlue\n  \t\t\t\thi link TroubleFoldIcon GruvboxGreen\n\t\t\t\thi link TroubleCount GruvboxGreen\n\t\t\t\bcmd\bvim\0\15<leader>xl\0\15<leader>xq\0\15<leader>xw\0\15<leader>xd\0\agr\6n\1\0\2\25use_diagnostic_signs\2\fpadding\1\nsetup\1\0\2\nremap\1\vsilent\2\0\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim",
    wants = { "nvim-web-devicons" }
  },
  ["windline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23wlsample.evil_line\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/duck/.local/share/nvim/site/pack/packer/opt/windline.nvim",
    url = "https://github.com/windwp/windline.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nñ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\4\0\0\rterminal\thelp\vpacker\1\0\1#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: matchparen.nvim
time([[Config for matchparen.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15matchparen\frequire\0", "config", "matchparen.nvim")
time([[Config for matchparen.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\ns\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0006\2\3\0'\4\4\0B\2\2\0029\2\5\2B\2\1\2'\3\6\0+\4\2\0B\0\4\1K\0\1\0\6n\17autopairs_cr\19nvim-autopairs\frequire\18nvim_feedkeys\bapi\bvimﬁ\1\1\0\a\0\14\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\0\0=\4\4\3B\1\2\0019\1\5\0006\3\0\0'\5\6\0B\3\2\0A\1\0\0016\1\a\0009\1\b\0019\1\t\1'\3\n\0'\4\v\0003\5\f\0005\6\r\0B\1\5\1K\0\1\0\1\0\1\vsilent\2\0\aCR\6i\bset\vkeymap\bvim%nvim-autopairs.rules.endwise-lua\14add_rules\14fast_wrap\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\në\4\0\0\5\0\22\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0'\1\15\0=\1\14\0006\0\f\0009\0\r\0'\1\17\0=\1\16\0006\0\f\0009\0\r\0'\1\19\0=\1\18\0006\0\f\0009\0\20\0'\2\21\0B\0\2\1K\0\1\0^    \t\t\t\tfunction! Foldfn()\n        \t\t\treturn getline(v:foldstart)\n    \t\t\t\tendfunction\n\t\t\t\bcmd\rFoldfn()\rfoldtext\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\6o\bvim\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\19init_selection\bgnn\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\bvim\0", "config", "gruvbox")
time([[Config for gruvbox]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: nvim-treesitter-textsubjects
time([[Config for nvim-treesitter-textsubjects]], true)
try_loadstring("\27LJ\2\n≥\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\17textsubjects\1\0\0\fkeymaps\1\0\2\6.\23textsubjects-smart\6;!textsubjects-container-outer\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textsubjects")
time([[Config for nvim-treesitter-textsubjects]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vignore\a^$\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LTPopOutSymboltree lua require("packer.load")({'litee-symboltree.nvim'}, { cmd = "LTPopOutSymboltree", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSNodeUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSNodeUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NeorgStart lua require("packer.load")({'neorg'}, { cmd = "NeorgStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSCaptureUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSCaptureUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType norg ++once lua require("packer.load")({'neorg'}, { ft = "norg" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/duck/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], true)
vim.cmd [[source /home/duck/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]]
time([[Sourcing ftdetect script at: /home/duck/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

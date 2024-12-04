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
local should_profile = false
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
local package_path_str = "C:\\Users\\Ivan\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\share\\lua\\5.1\\?.lua;C:\\Users\\Ivan\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Ivan\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Ivan\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\Ivan\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1713484068\\lib\\lua\\5.1\\?.so"
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
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["brightburn.vim"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\brightburn.vim",
    url = "https://github.com/erikbackman/brightburn.vim"
  },
  ["cloak.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cloak.nvim",
    url = "https://github.com/laytan/cloak.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\t\0\27\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\v\0005\4\t\0005\5\a\0006\6\3\0009\6\4\0069\6\5\6'\b\6\0B\6\2\2=\6\b\5=\5\n\4=\4\f\3=\3\14\0025\3\16\0005\4\15\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3=\3\26\2B\0\2\1K\0\1\0\21formatters_by_ft\fgraphql\1\2\0\0\14prettierd\20typescriptreact\1\2\0\0\14prettierd\15typescript\1\2\0\0\14prettierd\20javascriptreact\1\2\0\0\14prettierd\15javascript\1\0\5\20typescriptreact\0\fgraphql\0\15javascript\0\20javascriptreact\0\15typescript\0\1\2\0\0\14prettierd\15formatters\1\0\2\15formatters\0\21formatters_by_ft\0\14prettierd\1\0\1\14prettierd\0\benv\1\0\1\benv\0\29PRETTIERD_DEFAULT_CONFIG\1\0\1\29PRETTIERD_DEFAULT_CONFIG\0>~/AppData/Local/nvim/utils/linter-config/.prettierrc.json\vexpand\afn\bvim\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  harpoon = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["lsp-format.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["telescope-live-grep-args.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\19live_grep_args\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\Ivan\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\19live_grep_args\19load_extension\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\t\0\27\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\v\0005\4\t\0005\5\a\0006\6\3\0009\6\4\0069\6\5\6'\b\6\0B\6\2\2=\6\b\5=\5\n\4=\4\f\3=\3\14\0025\3\16\0005\4\15\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3=\3\26\2B\0\2\1K\0\1\0\21formatters_by_ft\fgraphql\1\2\0\0\14prettierd\20typescriptreact\1\2\0\0\14prettierd\15typescript\1\2\0\0\14prettierd\20javascriptreact\1\2\0\0\14prettierd\15javascript\1\0\5\20typescriptreact\0\fgraphql\0\15javascript\0\20javascriptreact\0\15typescript\0\1\2\0\0\14prettierd\15formatters\1\0\2\15formatters\0\21formatters_by_ft\0\14prettierd\1\0\1\14prettierd\0\benv\1\0\1\benv\0\29PRETTIERD_DEFAULT_CONFIG\1\0\1\29PRETTIERD_DEFAULT_CONFIG\0>~/AppData/Local/nvim/utils/linter-config/.prettierrc.json\vexpand\afn\bvim\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)

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

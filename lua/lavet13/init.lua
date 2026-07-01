require("lavet13.remap")
require("lavet13.set")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
  require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = ThePrimeagenGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Force UTF-8 on .anki buffers so pasted em dashes / curly quotes (Windows-1252
-- bytes like 0x97) get converted, not passed raw to AnkiConnect (which rejects
-- non-UTF-8 with a "codec can't decode byte" error).
autocmd({ "BufNewFile", "BufReadPre", "FileType" }, {
  pattern = { "*.anki", "anki" }, -- extension AND the filetype anki.nvim sets
  callback = function()
    vim.bo.fileencoding = "utf-8"
  end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

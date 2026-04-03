local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function ()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

vim.keymap.set('n', '<leader>pb', builtin.buffers, {}) -- switch between open buffers
vim.keymap.set('n', '<leader>pr', builtin.oldfiles, {}) -- recently opened files
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {}) -- all diagnostics across project
vim.keymap.set('n', '<leader>pk', builtin.keymaps, {}) -- search all keymaps (super handy when you forget something)

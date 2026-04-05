vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "Search TODOs" })
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next TODO" })
vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Prev TODO" })

-- TODO: this needs refactoring
-- FIXME: broken on windows
-- NOTE: important context here
-- HACK: temporary workaround
-- WARN: be careful here
-- PERF: Performance concern

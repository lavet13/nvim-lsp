local gs = require("gitsigns")

gs.setup()

-- Navigation
vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next hunk" })
vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })

-- Actions
vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hb", gs.blame_line, { desc = "Blame line" })
vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })

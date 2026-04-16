require("rose-pine").setup({
	styles = {
		transparency = true,
	},
	disable_italics = true,
	highlight_groups = {
		Comment = { italic = true },
		-- Cursor = { fg = "#191724", bg = "#e0def4" },
		Cursor = {
			fg = "#191724", -- dark text
			bg = "#f6c177", -- gold background
		},
		-- Optional: also make the cursor line number stand out a bit
		CursorLineNr = { fg = "#f6c177" },
	},
})

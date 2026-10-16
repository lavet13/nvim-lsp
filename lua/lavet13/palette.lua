-- Naysayer palette: the single source of truth for every colour.
-- Read by Neovim (require("lavet13.palette")) AND WezTerm (dofile).
-- RULE: this file is a PURE TABLE. No vim.*, no wezterm.* — each program's Lua
-- lacks the other's API, so the first call to either breaks the other side.
--
-- Two layers:
--   1. raw     — every hex written exactly once, named after the Emacs
--                naysayer-theme.el variables (values from naysayer.nvim).
--   2. roles   — what a colour is FOR. Consumers read only roles, so moving
--                "borders" to another shade is one edit here, nowhere else.

-- == 1. Raw colours ==========================================================
local raw = {
	-- base (naysayer-theme.el names, naysayer.nvim values)
	background = "#062625",
	highlight_line = "#0b3335",
	line_fg = "#126367",
	selection = "#0000ff",
	text = "#d0b892",
	comments = "#53d549",
	punctuation = "#8cde94",
	keywords = "#ffffff",
	strings = "#3ad0b5",
	constants = "#87ffde",

	-- Monokai accents (naysayer-theme-<name> in the .el)
	yellow = "#E6DB74",
	orange = "#FD971F",
	red = "#F92672",
	magenta = "#FD5FF0",
	blue = "#66D9EF",
	green = "#A6E22E",
	cyan = "#A1EFE4",
	violet = "#AE81FF",

	-- not in the .el — carried over from naysayer.nvim / your WezTerm theme
	mode_line_fg = "#12251b",
	mode_line_bg = "#d3b58e",
	cursor = "#90EE90", -- WezTerm draws the cursor (guicursor="")

	-- derived: accent blended into background (18% add/delete, 14%/30% change)
	diff_add = "#234827",
	diff_delete = "#322633",
	diff_change = "#133f41",
	diff_text = "#235c62",
	reference = "#294444", -- white 14% into background: hover (word under cursor)
	search_dim = "#335b28", -- Monokai green 28% into background: other search matches
}

-- == 2. Roles ================================================================
-- In the .el several roles share one value (variables = functions = macros
-- …); they stay separate keys here so you can split them later in one line.
return {
	raw = raw, -- escape hatch; prefer roles below

	-- editor surface
	bg = raw.background,
	fg = raw.text,
	highlight_line = raw.highlight_line, -- CursorLine, ColorColumn, float/menu bg
	line_fg = raw.line_fg, -- line numbers, borders, separators
	selection = raw.selection, -- Visual ONLY (what you are selecting)
	hover_bg = raw.reference, -- MatchParen, LSP references; words keep their own colour
	cursor = raw.cursor,

	-- syntax
	comments = raw.comments,
	punctuation = raw.punctuation, -- also Type, like the .el
	delimiters = raw.text, -- () {} [] , ; and operators: raw.text (tan) or raw.keywords (white)
	keywords = raw.keywords,
	variables = raw.text,
	functions = raw.text,
	strings = raw.strings,
	constants = raw.constants,
	numbers = raw.constants,
	macros = raw.punctuation,
	special = raw.keywords, -- escapes (\n), SpecialChar

	-- feedback
	error = raw.red, -- Monokai red everywhere (was pure #ff0000)
	warning = raw.yellow, -- Monokai yellow (was orange #ffaa00)
	info = raw.blue,
	hint = raw.cyan,
	ok = raw.green,

	-- search
	search_fg = raw.keywords, -- other matches: white on dim green (7.9:1)
	search_bg = raw.search_dim,
	cur_search_fg = raw.background, -- current match: dark text on Monokai green (10.3:1)
	cur_search_bg = raw.green,
	todo_bg = raw.yellow,

	-- git / diff
	added = raw.green,
	changed = raw.violet, -- naysayer-theme-violet: used nowhere else, so never mistaken for a diagnostic
	removed = raw.red,
	diff_add = raw.diff_add,
	diff_delete = raw.diff_delete,
	diff_change = raw.diff_change,
	diff_text = raw.diff_text,

	-- statusline (Emacs mode-line)
	mode_line_fg = raw.mode_line_fg,
	mode_line_bg = raw.mode_line_bg,

	-- terminal's 16 ANSI slots (same mapping your WezTerm theme already uses)
	ansi = {
		raw.background,
		raw.red,
		raw.comments,
		raw.yellow,
		raw.blue,
		raw.magenta,
		raw.strings,
		raw.text,
	},
	brights = {
		raw.highlight_line,
		raw.orange,
		raw.green,
		raw.constants,
		raw.cyan,
		raw.violet,
		raw.punctuation,
		raw.keywords,
	},
}

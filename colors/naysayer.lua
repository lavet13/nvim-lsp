-- colors/naysayer.lua — `:colorscheme naysayer` loads this file.
-- Colours come ONLY from lua/lavet13/palette.lua; no hex literals here.

-- Drop the cached module so re-running `:colorscheme naysayer` picks up
-- palette edits (require() otherwise returns the table from the first load).
package.loaded["lavet13.palette"] = nil
local p = require("lavet13.palette")

vim.cmd("highlight clear") -- reset every group to Neovim's defaults first
vim.o.background = "dark"
vim.g.colors_name = "naysayer" -- what :colorscheme with no args reports

--- Set one highlight group in the global namespace (0).
--- Thin alias so the table below reads as data, not API calls.
local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- == Editor UI ===============================================================
hl("Normal", { fg = p.fg, bg = p.bg })
hl("NormalFloat", { fg = p.fg, bg = p.bg })
hl("FloatBorder", { fg = p.line_fg })
hl("FloatTitle", { fg = p.keywords, bold = true })
hl("FloatShadow", { bg = p.highlight_line, blend = 80 })
hl("FloatShadowThrough", { bg = p.highlight_line, blend = 100 })
hl("Cursor", { fg = p.bg, bg = p.cursor })
hl("CursorLine", { bg = p.highlight_line })
hl("CursorColumn", { bg = p.highlight_line })
hl("ColorColumn", { bg = p.highlight_line })
hl("LineNr", { fg = p.line_fg })
hl("CursorLineNr", { fg = p.keywords })
hl("SignColumn", { fg = p.line_fg })
hl("FoldColumn", { fg = p.line_fg })
hl("Folded", { fg = p.line_fg, bg = p.highlight_line })
hl("WinSeparator", { fg = p.line_fg }) -- 0.10+ draws separators with THIS
hl("VertSplit", { link = "WinSeparator" }) -- legacy name
hl("Visual", { bg = p.selection })
hl("MatchParen", { fg = p.match_fg, bg = p.match_bg })
-- LSP document highlight (other uses of the word under the cursor): default
-- links to Visual, which made "pointing at" look like "selected".
hl("LspReferenceText", { fg = p.match_fg, bg = p.match_bg })
hl("LspReferenceRead", { fg = p.match_fg, bg = p.match_bg })
hl("LspReferenceWrite", { fg = p.match_fg, bg = p.match_bg })
hl("LspReferenceTarget", { link = "LspReferenceText" })
hl("LspSignatureActiveParameter", { fg = p.keywords, bold = true, underline = true })
hl("SnippetTabstop", { fg = p.match_fg, bg = p.match_bg })
hl("NonText", { fg = p.line_fg }) -- ~ after EOF, showbreak
hl("Whitespace", { fg = p.line_fg }) -- 'list' chars
hl("SpecialKey", { fg = p.line_fg })
hl("Conceal", { fg = p.line_fg })
hl("EndOfBuffer", { link = "NonText" })
hl("Directory", { fg = p.punctuation }) -- netrw folders
hl("Title", { fg = p.keywords, bold = true })
hl("QuickFixLine", { bg = p.highlight_line, bold = true })

-- statusline / winbar / tabline (Emacs mode-line)
hl("StatusLine", { fg = p.mode_line_fg, bg = p.mode_line_bg })
hl("StatusLineNC", { fg = p.line_fg, bg = p.bg })
hl("WinBar", { fg = p.fg, bold = true })
hl("WinBarNC", { fg = p.line_fg })
hl("TabLine", { fg = p.line_fg, bg = p.bg })
hl("TabLineFill", { bg = p.bg })
hl("TabLineSel", { fg = p.mode_line_fg, bg = p.mode_line_bg })

-- popup menu (completion)
hl("Pmenu", { fg = p.fg, bg = p.highlight_line })
hl("PmenuSel", { fg = p.keywords, bg = p.selection }) -- the picked item IS a selection
hl("PmenuSbar", { bg = p.highlight_line })
hl("PmenuThumb", { bg = p.fg }) -- tan, like the statusline
hl("PmenuMatch", { link = "CurSearch" })
hl("PmenuMatchSel", { fg = p.keywords, bold = true })

-- search
hl("Search", { fg = p.search_fg, bg = p.search_bg })
hl("CurSearch", { fg = p.cur_search_fg, bg = p.cur_search_bg })
hl("IncSearch", { link = "CurSearch" })
hl("Substitute", { link = "CurSearch" })

-- messages
hl("ErrorMsg", { fg = p.error })
hl("WarningMsg", { fg = p.warning })
hl("MoreMsg", { fg = p.ok })
hl("Question", { fg = p.ok })
hl("ModeMsg", { fg = p.fg, bold = true })
hl("MsgArea", { fg = p.fg })

-- spell: undercurl coloured by sp ("special" = underline colour)
hl("SpellBad", { undercurl = true, sp = p.error })
hl("SpellCap", { undercurl = true, sp = p.warning })
hl("SpellLocal", { undercurl = true, sp = p.info })
hl("SpellRare", { undercurl = true, sp = p.hint })

-- == Syntax (legacy groups; treesitter links into these) =====================
hl("Comment", { fg = p.comments })
hl("String", { fg = p.strings })
hl("Character", { link = "String" })
hl("Number", { fg = p.numbers })
hl("Float", { link = "Number" })
hl("Boolean", { fg = p.constants })
hl("Constant", { fg = p.constants })
hl("Identifier", { fg = p.variables })
hl("Function", { fg = p.functions })
hl("Statement", { fg = p.keywords })
hl("Keyword", { fg = p.keywords })
hl("Operator", { fg = p.delimiters })
hl("Type", { fg = p.punctuation })
hl("PreProc", { fg = p.macros })
hl("Special", { fg = p.special })
hl("Delimiter", { fg = p.delimiters })
hl("Underlined", { underline = true })
hl("Error", { fg = p.error })
hl("Todo", { fg = p.bg, bg = p.todo_bg, bold = true })

-- == Legacy regex syntax (filetypes with no treesitter parser) ===============
-- Vim's html.vim does `hi def link javaScript Special`: inside <script> in
-- .php/.html files every plain identifier is the javaScript REGION itself,
-- so it inherits Special. Point the region at ordinary text instead.
hl("javaScript", { link = "Identifier" })
hl("javaScriptExpression", { link = "Identifier" })

-- == Diagnostics =============================================================
hl("DiagnosticError", { fg = p.error })
hl("DiagnosticWarn", { fg = p.warning })
hl("DiagnosticInfo", { fg = p.info })
hl("DiagnosticHint", { fg = p.hint })
hl("DiagnosticOk", { fg = p.ok })
hl("DiagnosticUnderlineError", { undercurl = true, sp = p.error })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.warning })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.info })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.hint })
hl("DiagnosticUnderlineOk", { undercurl = true, sp = p.ok })
hl("DiagnosticDeprecated", { strikethrough = true, sp = p.line_fg })
hl("DiagnosticUnnecessary", { fg = p.line_fg })

-- == Git / diff ==============================================================
-- Added/Changed/Removed are the 0.10+ shared groups: gitsigns and diff
-- syntax link to them, so these three drive the sign column too.
hl("Added", { fg = p.added })
hl("Changed", { fg = p.changed })
hl("Removed", { fg = p.removed })
hl("DiffAdd", { bg = p.diff_add })
hl("DiffDelete", { fg = p.removed, bg = p.diff_delete })
hl("DiffChange", { bg = p.diff_change })
hl("DiffText", { bg = p.diff_text, bold = true })

-- == Treesitter (current capture names) ======================================
-- Unlisted captures fall back along the dot (e.g. @variable.member →
-- @variable), so only captures whose colour DIFFERS from the fallback need a
-- line. Kept sparse on purpose — closest to the treesitter-off look.
hl("@variable", { link = "Identifier" })
hl("@variable.builtin", { link = "Keyword" })
hl("@property", { link = "Identifier" })
hl("@function.builtin", { link = "Function" })
-- *.builtin captures default-link to Special (orange). Send each back to its
-- own family so `nil` looks like `true` and `package` like any other module.
hl("@constant.builtin", { link = "Constant" }) -- nil, _VERSION
hl("@module.builtin", { link = "@module" }) -- package, string, table, os
hl("@type.builtin", { link = "Type" }) -- int, char (C/TS)
hl("@tag.builtin", { link = "@tag" })
hl("@attribute.builtin", { link = "@attribute" })
hl("@variable.parameter.builtin", { link = "Identifier" }) -- Lua `...`
hl("@punctuation.special", { link = "Delimiter" }) -- ${ } in template strings
hl("@constructor", { link = "Function" }) -- default links to Special
hl("@module", { link = "Identifier" })
hl("@punctuation", { link = "Delimiter" })
hl("@tag", { link = "Keyword" })
hl("@tag.attribute", { link = "Identifier" })
hl("@tag.delimiter", { link = "Delimiter" })
hl("@markup.heading", { link = "Title" })
hl("@markup.link", { fg = p.strings, underline = true })
hl("@markup.raw", { link = "String" })

-- LSP semantic tokens: let treesitter colours win (no extra palette).
hl("@lsp.type.variable", {})
hl("@lsp.type.parameter", {})
hl("@lsp.type.property", {})

-- == Plugins =================================================================
-- nvim-cmp: rows use Pmenu/PmenuSel via winhighlight, but matched characters
-- use cmp's OWN groups (CmpItemAbbrMatch -> inherits Pmenu, i.e. invisible).
hl("CmpItemAbbrMatch", { link = "CurSearch" })
hl("CmpItemAbbrMatchFuzzy", { link = "CurSearch" })

-- telescope: borders + selection on the same tokens as floats/menus
hl("TelescopeBorder", { link = "FloatBorder" })
hl("TelescopeSelection", { link = "PmenuSel" })
hl("TelescopeMatching", { link = "CurSearch" }) -- fuzzy-matched chars: isearch pink
hl("TelescopePreviewMatch", { link = "Search" }) -- grep hits in preview: lazy-highlight
hl("TelescopePromptPrefix", { fg = p.punctuation })

-- treesitter-context: sticky header reads as a slightly raised strip
hl("TreesitterContext", { bg = p.highlight_line })
hl("TreesitterContextLineNumber", { fg = p.line_fg, bg = p.highlight_line })

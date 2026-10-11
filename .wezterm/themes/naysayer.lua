-- WezTerm side of the naysayer theme. No colours live here: every value
-- comes from the shared palette (nvim-lsp/lua/lavet13/palette.lua), which
-- wezterm.lua loads and passes in as `p`.
local naysayer = {}

--- WezTerm `colors` table built from the shared palette.
--- Tabs reuse the editor tokens: active = cursor-line strip, inactive = gutter.
function naysayer.colors(p)
	local active_tab = { bg_color = p.highlight_line, fg_color = p.fg }
	local inactive_tab = { bg_color = p.bg, fg_color = p.line_fg }
	return {
		foreground = p.fg,
		background = p.bg,
		cursor_bg = p.cursor,
		cursor_fg = p.bg,
		cursor_border = p.cursor,
		selection_fg = p.fg,
		selection_bg = p.selection,
		ansi = p.ansi,
		brights = p.brights,
		tab_bar = {
			background = p.bg,
			active_tab = active_tab,
			inactive_tab = inactive_tab,
			inactive_tab_hover = active_tab,
			new_tab = inactive_tab,
			new_tab_hover = active_tab,
			inactive_tab_edge = p.line_fg,
		},
	}
end

--- Title bar matches the editor background.
function naysayer.window_frame(p)
	return { active_titlebar_bg = p.bg, inactive_titlebar_bg = p.bg }
end

return naysayer

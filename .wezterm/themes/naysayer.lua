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

		-- chrome: same roles as Neovim's separators and completion scrollbar
		split = p.line_fg, -- lines between panes (Neovim: WinSeparator)
		scrollbar_thumb = p.fg, -- tan (Neovim: PmenuThumb)

		-- search mode (Ctrl+Shift+F) and copy mode: Monokai green, like Neovim's
		-- CurSearch (current hit) and Search (every other hit)
		copy_mode_active_highlight_bg = { Color = p.cur_search_bg },
		copy_mode_active_highlight_fg = { Color = p.cur_search_fg },
		copy_mode_inactive_highlight_bg = { Color = p.search_bg },
		copy_mode_inactive_highlight_fg = { Color = p.search_fg },

		-- quick select (Ctrl+Shift+Space): matches like search hits, the label you
		-- type like the current hit, so the eye goes to the label
		quick_select_match_bg = { Color = p.search_bg },
		quick_select_match_fg = { Color = p.search_fg },
		quick_select_label_bg = { Color = p.cur_search_bg },
		quick_select_label_fg = { Color = p.cur_search_fg },

		-- cursor while a leader key / dead key waits for the next key
		compose_cursor = p.pending, -- violet: clearly not the normal green cursor (2.0:1)
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

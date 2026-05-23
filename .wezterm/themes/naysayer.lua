local naysayer = {}

local palette = {
	bg = "#062625",
	overlay = "#0b3335", -- highlight from theme
	muted = "#126367", -- line_fg from theme
	text = "#d0b892", -- main text
	red = "#F92672", -- actual red from theme
	green = "#53d549", -- comment green
	teal = "#3ad0b5", -- string teal
	cyan = "#87ffde", -- constant/number
	white = "#ffffff", -- keyword white
	cursor = "#90EE90",
	selection = "#0000ff",
}

local active_tab = {
	bg_color = palette.overlay,
	fg_color = palette.text,
}

local inactive_tab = {
	bg_color = palette.bg,
	fg_color = palette.muted,
}

function naysayer.colors()
	return {
		foreground = palette.text,
		background = palette.bg,
		cursor_bg = palette.cursor,
		cursor_fg = palette.bg,
		cursor_border = palette.cursor,
		selection_fg = palette.text,
		selection_bg = palette.selection,

		ansi = {
			palette.bg, -- black
			palette.red, -- red
			palette.green, -- green
			palette.text, -- yellow
			palette.teal, -- blue
			palette.teal, -- magenta (no purple in naysayer)
			palette.cyan, -- cyan
			palette.white, -- white
		},
		brights = {
			palette.overlay, -- bright black
			"#f44747", -- bright red
			"#6ad668", -- bright green
			"#d0b892", -- bright yellow
			"#3ad0b5", -- bright blue
			"#87ffde", -- bright magenta
			"#87ffde", -- bright cyan
			"#ffffff", -- bright white
		},

		tab_bar = {
			background = palette.bg,
			active_tab = active_tab,
			inactive_tab = inactive_tab,
			inactive_tab_hover = active_tab,
			new_tab = inactive_tab,
			new_tab_hover = active_tab,
			inactive_tab_edge = palette.muted,
		},
	}
end

function naysayer.window_frame()
	return {
		active_titlebar_bg = palette.bg,
		inactive_titlebar_bg = palette.bg,
	}
end

return naysayer

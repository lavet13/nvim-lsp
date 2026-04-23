local main = {}

local main_palette = {
	base = "#191724",
	overlay = "#26233a",
	muted = "#6e6a86",
	text = "#e0def4",
	love = "#eb6f92",
	gold = "#f6c177",
	rose = "#ebbcba",
	pine = "#31748f",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	highlight_high = "#524f67",
}

local main_active_tab = {
	bg_color = main_palette.overlay,
	fg_color = main_palette.text,
}

local main_inactive_tab = {
	bg_color = main_palette.base,
	fg_color = main_palette.muted,
}

function main.colors()
	return {
		foreground = main_palette.text,
		background = main_palette.base,
		cursor_bg = main_palette.highlight_high,
		cursor_border = main_palette.highlight_high,
		cursor_fg = main_palette.text,
		selection_bg = "#2a283e",
		selection_fg = main_palette.text,

		ansi = {
			main_palette.overlay, -- black
			main_palette.love, -- red
			main_palette.pine, -- green
			main_palette.gold, -- yellow
			main_palette.foam, -- blue
			main_palette.iris, -- magenta
			main_palette.rose, -- cyan
			main_palette.text, -- white
		},

		brights = {
			main_palette.muted,
			main_palette.love,
			main_palette.pine,
			main_palette.gold,
			main_palette.foam,
			main_palette.iris,
			main_palette.rose,
			main_palette.text,
		},

		tab_bar = {
			background = main_palette.base,
			active_tab = main_active_tab,
			inactive_tab = main_inactive_tab,
			inactive_tab_hover = main_active_tab,
			new_tab = main_inactive_tab,
			new_tab_hover = main_active_tab,
			inactive_tab_edge = main_palette.muted, -- (Fancy tab bar only)
		},
	}
end

function main.window_frame()
	return {
		active_titlebar_bg = main_palette.base,
		inactive_titlebar_bg = main_palette.base,
	}
end

local moon = {}

local moon_palette = {
	base = "#232136",
	overlay = "#393552",
	muted = "#6e6a86",
	text = "#e0def4",
	love = "#eb6f92",
	gold = "#f6c177",
	-- rose = '#ea9a97',
	pine = "#3e8fb0",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	-- highlight_high = '#56526e',
}

local moon_active_tab = {
	bg_color = moon_palette.overlay,
	fg_color = moon_palette.text,
}

local moon_inactive_tab = {
	bg_color = moon_palette.base,
	fg_color = moon_palette.muted,
}

function moon.colors()
	return {
		foreground = moon_palette.text,
		background = moon_palette.base,
		cursor_bg = moon_palette.text,
		cursor_border = moon_palette.text,
		cursor_fg = moon_palette.base,
		selection_bg = moon_palette.overlay,
		selection_fg = moon_palette.text,

		ansi = {
			moon_palette.overlay,
			moon_palette.love,
			moon_palette.pine,
			moon_palette.gold,
			moon_palette.foam,
			moon_palette.iris,
			"#ebbcba", -- replacement for rose,
			moon_palette.text,
		},

		brights = {
			"#817c9c", -- replacement for muted,
			moon_palette.love,
			moon_palette.pine,
			moon_palette.gold,
			moon_palette.foam,
			moon_palette.iris,
			"#ebbcba", -- replacement for rose,
			moon_palette.text,
		},

		tab_bar = {
			background = moon_palette.base,
			active_tab = moon_active_tab,
			inactive_tab = moon_inactive_tab,
			inactive_tab_hover = moon_active_tab,
			new_tab = moon_inactive_tab,
			new_tab_hover = moon_active_tab,
			inactive_tab_edge = moon_palette.muted, -- (Fancy tab bar only)
		},
	}
end

function moon.window_frame() -- (Fancy tab bar only)
	return {
		active_titlebar_bg = moon_palette.base,
		inactive_titlebar_bg = moon_palette.base,
	}
end

return { main = main, moon = moon }

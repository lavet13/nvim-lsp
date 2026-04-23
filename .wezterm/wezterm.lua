local wezterm = require("wezterm")

-- Load the themes
local rose_pine_theme = dofile(wezterm.home_dir .. "/.wezterm/themes/rose-pine.lua")
local rose_pine_theme_main, rose_pine_theme_moon = rose_pine_theme.main, rose_pine_theme.moon

return {
	-- General appearance
	font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "Regular" }),
	font_size = 14.0,
	window_decorations = "RESIZE",
	-- window_background_image = "C:/Users/Ivan/Pictures/cyberpunk-2077-video-game-yorha-2b-wallpaper-2000x1333_39.jpg",
	-- Image adjustments
	-- window_background_image_hsb = {
	--   brightness = 0.01,
	--   hue = 1.0,
	--   saturation = 0.2,
	-- },
	initial_rows = 30,
	initial_cols = 120,
	enable_tab_bar = true,
  colors = rose_pine_theme_main.colors(),
  window_frame = rose_pine_theme_main.window_frame(),

	default_cursor_style = "SteadyBlock",

	-- Shell
	default_prog = { "G:/Programs/Git/bin/bash.exe" },

	-- Key bindings
	keys = {
		-- Split panes
		{
			key = "|",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = " ",
			mods = "CTRL",
			action = wezterm.action.SendKey({ key = " ", mods = "CTRL" }),
		},
		{
			key = "Minus",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},

		-- Navigating panes
		{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },

		-- Resizing panes
		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }) },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }) },
		{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }) },
		{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }) },

		-- Create new window
		{ key = "N", mods = "CTRL|SHIFT", action = wezterm.action.SpawnWindow },
	},
}

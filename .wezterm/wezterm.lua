local wezterm = require("wezterm")

-- Load the themes
local rose_pine_theme = dofile(wezterm.home_dir .. "/.wezterm/themes/rose-pine.lua")
local rose_pine_theme_main, rose_pine_theme_moon = rose_pine_theme.main, rose_pine_theme.moon
local naysayer_theme = dofile(wezterm.home_dir .. "/.wezterm/themes/naysayer.lua")

return {
	-- General appearance
	font = wezterm.font("Cascadia Mono", { weight = "Regular" }),
	font_size = 14.5,
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
	colors = naysayer_theme.colors(),
	window_frame = naysayer_theme.window_frame(),

	default_cursor_style = "SteadyBlock",

	-- Shell
	default_prog = { "G:/Programs/Git/bin/bash.exe" },
	launch_menu = {
    { label = "Debian (tmux)", args = { "wsl.exe", "-d", "Debian", "--cd", "~" } },
		{
			label = "Debian (no tmux)",
			-- env sets NO_TMUX for the interactive login zsh it launches → guard skips
			args = { "wsl.exe", "-d", "Debian", "--cd", "~", "--", "env", "NO_TMUX=1", "zsh", "-li" },
		},
	},

	scrollback_lines = 10000,

	-- useful when you change font size at runtime with Ctrl+Shift+=/-.
	-- Without it the window resizes instead of reflowing:
	adjust_window_size_when_changing_font_size = false,

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

		-- -- Resizing panes — ALT+h/j/k/l, amount 3 cols/rows per press
		{ key = "h", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Left", 3 } }) },
		{ key = "l", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Right", 3 } }) },
		{ key = "k", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Up", 3 } }) },
		{ key = "j", mods = "ALT", action = wezterm.action({ AdjustPaneSize = { "Down", 3 } }) },

		-- Create new window
		{ key = "N", mods = "CTRL|SHIFT", action = wezterm.action.SpawnWindow },

		-- Scroll with Ctrl+Shift+u/d (half page, vim-like)
		-- Ctrl+Shift+K        scroll up one line
		-- Ctrl+Shift+J        scroll down one line
		-- Ctrl+Shift+PageUp   scroll up one page
		-- Ctrl+Shift+PageDown scroll down one page
		{
			key = "u",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ScrollByPage(-0.5),
		},
		{
			key = "d",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ScrollByPage(0.5),
		},

		-- Ctrl+Shift+L opens the launcher; arrow keys / typing to filter, Enter to pick.
		{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncher },
	},
}

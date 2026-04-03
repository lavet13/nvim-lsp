return {
  foreground = "#bcbcbc", -- Main text color (gray13 from `yin.vim`)
  background = "#1c1c1c", -- Background color (black from `yin.vim`)

  cursor_bg = "#c6c6c6", -- Cursor background (gray14)
  cursor_fg = "#1c1c1c", -- Cursor foreground (background color)
  cursor_border = "#c6c6c6", -- Cursor border (gray14)

  selection_fg = "#1c1c1c", -- Selection foreground (background color)
  selection_bg = "#808080", -- Selection background (gray07)

  scrollbar_thumb = "#4e4e4e", -- Scrollbar thumb (gray03)
  split = "#4e4e4e", -- Split line color (gray03)

  ansi = {
    "#262626", -- Black (gray01)
    "#666666", -- Red (gray05)
    "#4e4e4e", -- Green (gray03)
    "#a8a8a8", -- Yellow (gray11)
    "#444444", -- Blue (gray02)
    "#8a8a8a", -- Magenta (gray08)
    "#949494", -- Cyan (gray09)
    "#bcbcbc", -- White (gray13)
  },

  brights = {
    "#4e4e4e", -- Bright black (gray03)
    "#9e9e9e", -- Bright red (gray10)
    "#808080", -- Bright green (gray07)
    "#eeeeee", -- Bright yellow (white)
    "#666666", -- Bright blue (gray05)
    "#b2b2b2", -- Bright magenta (gray12)
    "#c6c6c6", -- Bright cyan (gray14)
    "#eeeeee", -- Bright white (white)
  },

  tab_bar = {
    background = "#1c1c1c", -- Tab bar background (black)
    active_tab = {
      bg_color = "#4e4e4e", -- Active tab background (gray03)
      fg_color = "#eeeeee", -- Active tab foreground (white)
    },
    inactive_tab = {
      bg_color = "#262626", -- Inactive tab background (gray01)
      fg_color = "#808080", -- Inactive tab foreground (gray07)
    },
    inactive_tab_hover = {
      bg_color = "#444444", -- Inactive tab hover background (gray02)
      fg_color = "#bcbcbc", -- Inactive tab hover foreground (gray13)
    },
    new_tab = {
      bg_color = "#262626", -- New tab button background (gray01)
      fg_color = "#808080", -- New tab button foreground (gray07)
    },
    new_tab_hover = {
      bg_color = "#4e4e4e", -- New tab hover background (gray03)
      fg_color = "#eeeeee", -- New tab hover foreground (white)
    },
  },

  visual_bell = "#4e4e4e", -- Visual bell color (gray03)

  indexed = {
    [16] = "#767676", -- Gray06
    [17] = "#585858", -- Gray04
  },
}


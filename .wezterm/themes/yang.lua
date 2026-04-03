return {
  foreground = "#606060", -- Main text color (gray05)
  background = "#f7f7f7", -- Background color (white)

  cursor_bg = "#a8a8a8", -- Cursor background (gray12)
  cursor_fg = "#f7f7f7", -- Cursor foreground (background color)
  cursor_border = "#a8a8a8", -- Cursor border (gray12)

  selection_fg = "#f7f7f7", -- Selection foreground (background color)
  selection_bg = "#606060", -- Selection background (gray05)

  scrollbar_thumb = "#e4e4e4", -- Scrollbar thumb (gray15)
  split = "#e4e4e4", -- Split line color (gray15)

  ansi = {
    "#262626", -- Black (gray01)
    "#666666", -- Red (gray06)
    "#4e4e4e", -- Green (gray03)
    "#9e9e9e", -- Yellow (gray11)
    "#444444", -- Blue (gray02)
    "#808080", -- Magenta (gray08)
    "#8a8a8a", -- Cyan (gray09)
    "#b2b2b2", -- White (gray13)
  },

  brights = {
    "#4e4e4e", -- Bright black (gray03)
    "#949494", -- Bright red (gray10)
    "#767676", -- Bright green (gray07)
    "#eeeeee", -- Bright yellow (white)
    "#606060", -- Bright blue (gray05)
    "#a8a8a8", -- Bright magenta (gray12)
    "#bcbcbc", -- Bright cyan (gray14)
    "#f7f7f7", -- Bright white (white)
  },

  tab_bar = {
    background = "#f7f7f7", -- Tab bar background (white)
    active_tab = {
      bg_color = "#e4e4e4", -- Active tab background (gray15)
      fg_color = "#606060", -- Active tab foreground (gray05)
    },
    inactive_tab = {
      bg_color = "#f7f7f7", -- Inactive tab background (white)
      fg_color = "#a8a8a8", -- Inactive tab foreground (gray12)
    },
    inactive_tab_hover = {
      bg_color = "#e4e4e4", -- Inactive tab hover background (gray15)
      fg_color = "#606060", -- Inactive tab hover foreground (gray05)
    },
    new_tab = {
      bg_color = "#f7f7f7", -- New tab button background (white)
      fg_color = "#a8a8a8", -- New tab button foreground (gray12)
    },
    new_tab_hover = {
      bg_color = "#e4e4e4", -- New tab hover background (gray15)
      fg_color = "#606060", -- New tab hover foreground (gray05)
    },
  },

  visual_bell = "#e4e4e4", -- Visual bell color (gray15)

  indexed = {
    [16] = "#767676", -- Gray07
    [17] = "#585858", -- Gray04
  },
}

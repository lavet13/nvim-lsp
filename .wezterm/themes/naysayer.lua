local naysayer = {}

local palette = {
  bg = "#062626",
  overlay = "#0d3d3d",
  muted = "#4a8a8a",
  text = "#d3b58d",
  red = "#cd3131",
  green = "#3eac3e",
  teal = "#4ec9b0",
  magenta = "#c586c0",
  blue = "#9cdcfe",
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
    cursor_bg = palette.text,
    cursor_fg = palette.bg,
    cursor_border = palette.text,
    selection_fg = palette.bg,
    selection_bg = palette.overlay,

    ansi = {
      palette.bg,       -- black
      palette.red,      -- red
      palette.green,    -- green
      palette.text,     -- yellow
      palette.teal,     -- blue
      palette.magenta,  -- magenta
      palette.teal,     -- cyan
      palette.text,     -- white
    },
    brights = {
      palette.overlay,  -- bright black
      "#f44747",        -- bright red
      "#6ad668",        -- bright green
      "#ddd0a3",        -- bright yellow
      palette.blue,     -- bright blue
      "#da8ee7",        -- bright magenta
      palette.blue,     -- bright cyan
      "#ffffff",        -- bright white
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

local naysayer = {}

-- Exact palette from RostislavArts/naysayer.nvim
local palette = {
  bg         = "#062625",
  text       = "#d0b892",
  comment    = "#53d549",
  punctuation= "#8cde94",
  keyword    = "#ffffff",
  variable   = "#d0b892",
  string     = "#3ad0b5",
  constant   = "#87ffde",
  macro      = "#8cde94",
  number     = "#87ffde",
  highlight  = "#0b3335",
  line_fg    = "#126367",
  selection  = "#0000ff",
  yellow     = "#E6DB74",
  orange     = "#FD971F",
  red        = "#F92672",
  magenta    = "#FD5FF0",
  blue       = "#66D9EF",
  green      = "#A6E22E",
  cyan       = "#A1EFE4",
  violet     = "#AE81FF",
  white      = "#ffffff",
  cursor     = "#90EE90",
}

local active_tab = {
  bg_color = palette.highlight,
  fg_color = palette.text,
}

local inactive_tab = {
  bg_color = palette.bg,
  fg_color = palette.line_fg,
}

function naysayer.colors()
  return {
    foreground    = palette.text,
    background    = palette.bg,
    cursor_bg     = palette.cursor,
    cursor_fg     = palette.bg,
    cursor_border = palette.cursor,
    selection_fg  = palette.text,
    selection_bg  = palette.selection,

    ansi = {
      palette.bg,          -- black
      palette.red,         -- red        #F92672
      palette.comment,     -- green      #53d549
      palette.yellow,      -- yellow     #E6DB74
      palette.blue,        -- blue       #66D9EF
      palette.magenta,     -- magenta    #FD5FF0
      palette.string,      -- cyan       #3ad0b5
      palette.text,        -- white      #d0b892
    },
    brights = {
      palette.highlight,   -- bright black  #0b3335
      palette.orange,      -- bright red    #FD971F
      palette.green,       -- bright green  #A6E22E
      palette.constant,    -- bright yellow #87ffde
      palette.cyan,        -- bright blue   #A1EFE4
      palette.violet,      -- bright magenta #AE81FF
      palette.punctuation, -- bright cyan   #8cde94
      palette.white,       -- bright white  #ffffff
    },

    tab_bar = {
      background         = palette.bg,
      active_tab         = active_tab,
      inactive_tab       = inactive_tab,
      inactive_tab_hover = active_tab,
      new_tab            = inactive_tab,
      new_tab_hover      = active_tab,
      inactive_tab_edge  = palette.line_fg,
    },
  }
end

function naysayer.window_frame()
  return {
    active_titlebar_bg   = palette.bg,
    inactive_titlebar_bg = palette.bg,
  }
end

return naysayer

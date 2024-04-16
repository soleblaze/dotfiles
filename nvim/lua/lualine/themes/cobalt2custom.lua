-- =============================================================================
-- Genarated by lightline to lualine theme converter
--   https://gist.github.com/shadmansaleh/000871c9a608a012721c6acc6d7a19b9
-- License: MIT License
-- =============================================================================

local colors = {
  color0  = "#FFFFFF",
  color1  = "#7F7F7F",
  color2  = "#275D84",
  color3  = "#1f4461",
  color4  = "#193549",
  color5  = "#FF9D00",
  color8  = "#77929e",
  color9  = "#00384d",
  color10 = "#517f8d",
  color13 = "#EE80E1",
  color14 = "#902020",
  color17 = "#70b950",
}

local cobalt2 = {
  normal = {
    a = { fg = colors.color0, bg = colors.color1 },
    b = { fg = colors.color0, bg = colors.color2 },
    c = { fg = colors.color0, bg = colors.color3 },
  },
  visual = {
    a = { fg = colors.color4, bg = colors.color5 },
    b = { fg = colors.color0, bg = colors.color1 },
  },
  inactive = {
    a = { fg = colors.color9, bg = colors.color10 },
    b = { fg = colors.color8, bg = colors.color9 },
  },
  replace = {
    a = { fg = colors.color13, bg = colors.color14 },
    b = { fg = colors.color0, bg = colors.color1 },
  },
  insert = {
    a = { fg = colors.color4, bg = colors.color17 },
    b = { fg = colors.color0, bg = colors.color1 },
  },
}

return cobalt2

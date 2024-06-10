local colors = {
  normal = {
    a = { fg = "#FFFFFF", bg = "#7F7F7F" },
    b = { fg = "#FFFFFF", bg = "#275D84" },
    c = { fg = "#FFFFFF", bg = "#1F4461" },
  },
  visual = {
    a = { fg = "#193549", bg = "#FF9D00" },
    b = { fg = "#FFFFFF", bg = "#7F7F7F" },
  },
  inactive = {
    a = { fg = "#00384D", bg = "#517F8D" },
    b = { fg = "#77929E", bg = "#00384D" },
  },
  replace = {
    a = { fg = "#EE80E1", bg = "#902020" },
    b = { fg = "#FFFFFF", bg = "#7F7F7F" },
  },
  insert = {
    a = { fg = "#193549", bg = "#70B950" },
    b = { fg = "#FFFFFF", bg = "#7F7F7F" },
  }
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = colors,
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
        },
      },
      lualine_c = { 'filename', 'diff', },
      lualine_x = { 'diagnostics', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  },
}

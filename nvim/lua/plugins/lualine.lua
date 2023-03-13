return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 
      "kyazdani42/nvim-web-devicons",
      "SmiteshP/nvim-navic" 
    },
    config = function()

      local cobalt2 = require("lualine.themes.cobalt2custom")

      vim.g.bufferline = {
        closable = true,
        clickable = false,
        maximum_padding = 1,
      }
      
      local navic = require("nvim-navic")
      
      require("lualine").setup({
        options = {
          theme = cobalt2,
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            {
              "branch",
              "b:gitsigns_head",
              icon = " ",
            },
          },
          lualine_c = {
            {
              "diff",
              symbols = { added = "  ", modified = "柳", removed = " " },
              color_added = "#ffc600",
              color_modified = "#ffc600",
              color_removed = "#ff2600",
              color = {},
            },
            "filename",
            { navic.get_location, cond = navic.is_available },
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              color = {},
            },
            "filetype",
          },
          lualine_y = { "progress" },
        },
      })
  end,
}

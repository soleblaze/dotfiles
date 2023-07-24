return {
  {
    "lalitmee/cobalt2.nvim",
    event = { "ColorSchemePre" },
    dependencies = { "tjdevries/colorbuddy.nvim" },
    init = function()
      require("colorbuddy").colorscheme("cobalt2")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function() end, -- Loaded from cobalt2 above
    },
  },
}

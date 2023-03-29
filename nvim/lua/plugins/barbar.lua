return {
  "romgrk/barbar.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require("bufferline").setup {
      icons = "numbers",
      closable = true,
      clickable = false,
      maximum_padding = 1,
    }
  end
}

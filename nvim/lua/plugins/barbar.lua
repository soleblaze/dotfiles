return {
  "romgrk/barbar.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup {
      icons = {
        button = ' ',
        buffer_index = true,
        filetype = { enabled = false },
      },
      clickable = false,
      maximum_padding = 1,
    }
  end
}

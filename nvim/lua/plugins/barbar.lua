return {
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      icons = {
        button = " ",
        buffer_index = false,
        filetype = { enabled = false },
        separator_at_end = false,
      },
      clickable = false,
      maximum_padding = 1,
    },
  },
}

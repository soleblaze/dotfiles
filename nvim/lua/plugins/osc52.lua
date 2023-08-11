return {
  {
    "ojroques/vim-oscyank",
    config = function()
      vim.g.oscyank_trim = true
    end,
    keys = {
      {
        "<leader>y",
        "<Plug>OSCYankOperator",
        desc = "Yank to System Clipboard",
      },
      {
        "<leader>y",
        "<Plug>OSCYankVisual",
        desc = "Yank to System Clipboard",
        mode = "v"
      },
      {
        "<leader>p",
        "\"+p",
        desc = "Paste from System Clipboard"
      },
    }
  }
}

return {
  {
    "gbprod/yanky.nvim",
    keys = {
      {
        "<leader>h",
        function() require("telescope").extensions.yank_history.yank_history({}) end,
        desc =
        "Open Yank History"
      },
      {
        "<leader>p",
        false
      },
    },
  }
}

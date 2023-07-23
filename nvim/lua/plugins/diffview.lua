return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      use_icons = true,
      enhanced_diff_hl = false,
      signs = {
        fold_closed = "",
        fold_open = "",
      },
      file_history_panel = {
        win_config = {
          position = "bottom",
          width = 35,
          height = 16,
        },
      },
    })
  end,
}

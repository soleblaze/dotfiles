return {
  "numToStr/Navigator.nvim",
  config = function()
    require("Navigator").setup()
  end,
  keys = {
    { "<C-h>", "<cmd>NavigatorLeft<cr>", desc = "Navigator Left" },
    { "<C-l>", "<cmd>NavigatorRight<cr>", desc = "Navigator Right" },
    { "<C-j>", "<cmd>NavigatorDown<cr>", desc = "Navigator Down" },
    { "<C-k>", "<cmd>NavigatorUp<cr>", desc = "Navigator Up" },
  },
}

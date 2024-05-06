return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "kkharji/sqlite.lua", module = "sqlite" },
  },
  config = function()
    require("neoclip").setup({
      history = 20,
      enable_persistent_history = true,
    })
  end,
  keys = {
    { "<leader>fR", "<cmd>Telescope neoclip<cr>", desc = "Registers" },
    { "<leader>fM", "<cmd>Telescope macroscope<cr>", desc = "Macros" },
  },
}

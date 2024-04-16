return {
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        max_width = { 40, 0.5 },
        width = 25,
        min_width = 20,
      },
    },
    keys = {
      { "<leader>cS", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
      { "<leader>cs", "<cmd>Telescope aerial<cr>", desc = "Aerial (Telescope)" },
    },
  },
}

return {
  {
    "folke/twilight.nvim",
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {

      window = {
        width = 0.9,
        options = {
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
        },
      },
      plugins = {
        options = {
          laststatus = 0,
        },
        gitsigns = true,
        tmux = false,
      },

      on_open = function()
        vim.cmd("IBLDisable")
      end,
      on_close = function()
        vim.cmd("IBLEnable")
      end,
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}

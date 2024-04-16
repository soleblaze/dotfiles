return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    dependencies = {
      "lewis6991/gitsigns.nvim",
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
    keys = {
      { "<C-n>", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
      { "<C-p>", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer" },
      { "<leader>bP", "<cmd>BufferPin<CR>", desc = "Pin Buffer" },
      { "<leader>bp", "<cmd>BufferPick<CR>", desc = "Pick Buffer" },
      { "<leader>br", "<cmd>BufferRestore<CR>", desc = "Restore Buffer" },

      { "<leader>bb", "<cmd>BufferOrderByBufferNumber<CR>", desc = "Order By Buffer" },
      { "<leader>bn", "<cmd>BufferOrderByName<CR>", desc = "Order By Name" },
      { "<leader>bd", "<cmd>BufferOrderByDirectory<CR>", desc = "Order By Directory" },
      { "<leader>bl", "<cmd>BufferOrderByLanguage<CR>", desc = "Order By Language" },
      { "<leader>bw", "<cmd>BufferOrderByWindowNumber<CR>", desc = "Order By Window" },
    },
  },
}

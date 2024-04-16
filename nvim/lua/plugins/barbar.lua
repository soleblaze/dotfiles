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
        buffer_index = true,
        filetype = { enabled = false },
        separator_at_end = false,
      },
      clickable = false,
      maximum_padding = 1,
    },
    keys = {
      { "<C-n>", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
      { "<C-p>", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer" },
      { "<leader>d", "<cmd>BufferClose<CR>", desc = "Delete Buffer" },
      { "<leader>1", "<cmd>BufferGoto 1<CR>", desc = "GoTo Buffer 1" },
      { "<leader>2", "<cmd>BufferGoto 2<CR>", desc = "GoTo Buffer 2" },
      { "<leader>3", "<cmd>BufferGoto 3<CR>", desc = "GoTo Buffer 3" },
      { "<leader>4", "<cmd>BufferGoto 4<CR>", desc = "GoTo Buffer 4" },
      { "<leader>5", "<cmd>BufferGoto 5<CR>", desc = "GoTo Buffer 5" },
      { "<leader>6", "<cmd>BufferGoto 6<CR>", desc = "GoTo Buffer 6" },
      { "<leader>7", "<cmd>BufferGoto 7<CR>", desc = "GoTo Buffer 7" },
      { "<leader>8", "<cmd>BufferGoto 8<CR>", desc = "GoTo Buffer 8" },
      { "<leader>9", "<cmd>BufferGoto 9<CR>", desc = "GoTo Buffer 9" },
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

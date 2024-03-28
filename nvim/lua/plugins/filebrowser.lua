return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup {}
    require("telescope").load_extension "file_browser"
  end,
  keys = {
    {
      "<leader>fB",
      function()
        require 'telescope'.extensions.file_browser.file_browser()
      end,
      desc = "File Browser",
    },
    {
      "<leader>fc",
      function()
        require 'telescope'.extensions.file_browser.file_browser({ cwd = vim.env.HOME .. "/Nextcloud/Notes" })
      end,
      desc = "Notes File Browser",
    }
  }
}

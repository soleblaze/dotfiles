return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    opts = {
      snippetDir = vim.fn.stdpath("config"),
    },
    keys = {
      {
        "<leader>cE",
        function()
          require("scissors").editSnippet()
        end,
        desc = "Edit Snippets",
      },
      {
        "<leader>cS",
        function()
          require("scissors").addNewSnippet()
        end,
        desc = "Add Snippet",
      },
      {
        "<leader>cS",
        function()
          require("scissors").addNewSnippet()
        end,
        desc = "Add Snippet",
        mode = "x",
      },
    },
  },
}

local Util = require("lazyvim.util")
return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  opts = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = {
        preview_cutoff = 10,
      },
    },
  },
  keys = {
    { "<leader>fg", Util.telescope("live_grep"),      desc = "Grep (root dir)" },
    { "<leader>/",  false },
    { "<leader>gc", false },
    { "<leader>gC", "<cmd>Telescope git_commits<CR>", desc = "commits" },
  }
}

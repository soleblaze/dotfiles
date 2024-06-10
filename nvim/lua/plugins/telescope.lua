return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          preview_cutoff = 10,
        },
      },
      extensions = {
        advanced_git_search = {
          diff_plugin = "diffview",
        },
        rooter = {
          enable = true,
          patterns = { ".git" },
          debug = false
        }
      },
    }
  },
}

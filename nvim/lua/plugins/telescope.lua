return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "aaronhallaert/advanced-git-search.nvim" },
    { "benfowler/telescope-luasnip.nvim" },
    { "debugloop/telescope-undo.nvim" },
    { "desdic/telescope-rooter.nvim" },
    { "jemag/telescope-diff.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-dap.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },

    { "nvim-telescope/telescope-symbols.nvim" },
  },
  config = function()
    require("telescope").setup({
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
    })

    require("telescope").load_extension("advanced_git_search")
    require("telescope").load_extension("diff")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("notify")
    require("telescope").load_extension("undo")
    require('telescope').load_extension('luasnip')
    require('telescope').load_extension('rooter')

    vim.cmd("command! -bang Keymap Telescope keymaps")
  end,
}

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "cljoly/telescope-repo.nvim" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "ElPiloto/telescope-vimwiki.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("repo")
    require('telescope').load_extension('vimwiki')
    require('telescope').load_extension('neoclip')
    require("telescope").load_extension("refactoring")

    vim.cmd("command! -bang Keymap Telescope keymaps")
  end,
}

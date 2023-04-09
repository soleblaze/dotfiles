return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "ElPiloto/telescope-vimwiki.nvim" },
    { "cljoly/telescope-repo.nvim" },
    { "debugloop/telescope-undo.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "someone-stole-my-name/yaml-companion.nvim" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        undo = {
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.8,
          },
        },
      },
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("refactoring")
    require("telescope").load_extension("repo")
    require("telescope").load_extension("undo")
    require("telescope").load_extension("yaml_schema")
    require('telescope').load_extension('neoclip')
    require('telescope').load_extension('vimwiki')

    vim.cmd("command! -bang Keymap Telescope keymaps")
  end,
}

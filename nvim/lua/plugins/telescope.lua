return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "aaronhallaert/advanced-git-search.nvim" },
    { "ElPiloto/telescope-vimwiki.nvim" },
    { "debugloop/telescope-undo.nvim" },
    { "jemag/telescope-diff.nvim" },
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
        advanced_git_search = {
          diff_plugin = "diffview",
        },
      },
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("refactoring")
    require("telescope").load_extension("undo")
    require("telescope").load_extension("yaml_schema")
    require('telescope').load_extension('neoclip')
    require('telescope').load_extension('vimwiki')
    require("telescope").load_extension("diff")
    require("telescope").load_extension("advanced_git_search")

    vim.cmd("command! -bang Keymap Telescope keymaps")

    -- Open find_files if nvim isn't opened using a file
    vim.cmd [[
      augroup TelescopeOnStart
        autocmd!
        autocmd VimEnter * if argc() == 0 | silent! execute "Telescope find_files" | endif
      augroup END
    ]]
  end,
}

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "p00f/nvim-ts-rainbow" },
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = "all",
      sync_install = false,
      ignore_install = { "phpdoc" },
      context_commentstring = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      autopairs = { enable = true },
      autotag = { enable = false },
      incremental_selection = { enable = true },
      textobjects = {
        enable = true,
        lsp_interop = {
          enable = true,
          peek_definition_code = {
            ["DF"] = "@function.outer",
          },
        },
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    })
  end,
}

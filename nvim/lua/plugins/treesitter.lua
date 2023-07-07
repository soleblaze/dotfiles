return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "diff",
        "dockerfile",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "html",
        "jq",
        "json",
        "json5",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "ruby",
        "rust",
        "sql",
        "terraform",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      },
      sync_install = true,
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
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@comment.outer",
            ["ic"] = { query = "@comment.inner", desc = "Select inner part of a comment" },
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          include_surrounding_whitespace = true,
        },
      },
      endwise = {
        enable = true,
      },
    })
  end,
}

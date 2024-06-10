return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-endwise",
    {
      'nvim-treesitter/nvim-treesitter-context',
      config = function()
        require 'treesitter-context'.setup({})
      end
    },
    {
      "RRethy/nvim-treesitter-textsubjects",
      config = function()
        require("nvim-treesitter.configs").setup {
          textsubjects = {
            enable = true,
            keymaps = {
              ["."] = "textsubjects-smart",
              [";"] = "textsubjects-container-outer",
              ["i;"] = "textsubjects-container-inner",
            },
          },
        }
      end,
    },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "asm",
        "bash",
        "c",
        "cmake",
        "cpp",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "hcl",
        "helm",
        "html",
        "ini",
        "jq",
        "json",
        "json5",
        "jsonc",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "ruby",
        "rust",
        "ssh_config",
        "sql",
        "strace",
        "terraform",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      sync_install = true,
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
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
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

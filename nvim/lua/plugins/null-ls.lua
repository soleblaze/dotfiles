return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    require("mason-null-ls").setup({
      ensure_installed = {
        "ansiblelint",
        "beautysh",
        "black",
        "cbfmt",
        "fixjson",
        "golangci_lint",
        "jsonlint",
        "prettier",
        "shellcheck",
        "shfmt",
        "yamllint",
      },
      automatic_setup = true
    })

    require("null-ls").setup({
      sources = {
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.golangci_lint.with({
          args = {
            "run",
            "--fix=false",
            "--out-format=json",
            "$DIRNAME",
            "--path-prefix",
            "$ROOT",
          },
        }),
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.markdownlint.with({
          args = { "-c", "~/.markdownlint.yaml", "--stdin" },
        }),
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.zsh,
        null_ls.builtins.formatting.beautysh.with({
          filetypes = { "zsh" },
          args = { "-i", "2", "$FILENAME" },
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.cbfmt.with({
          extra_args = { "--config", "/home/neovim/.cbfmt.toml" }
        }),
        null_ls.builtins.formatting.fixjson,
        null_ls.builtins.formatting.prettier.with({
          disabled_filetypes = { "go", "yaml" },
          extra_args = { "--prose-wrap", "always" }
        }),
        null_ls.builtins.formatting.shfmt.with({
          args = { "-ci", "-s", "-i", "2", "-bn", "-sr", "-filename", "$FILENAME" }
        }),
        null_ls.builtins.formatting.trim_whitespace.with({
          disabled_filetypes = { "go" },
        }),
      },
    })
  end,
}

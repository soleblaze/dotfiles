return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  config = function()
    local nls = require("null-ls")
    nls.setup({
      sources = {
        require("none-ls.formatting.beautysh").with({
          filetypes = { "zsh" }
        }),
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.diagnostics.actionlint,
        nls.builtins.diagnostics.hadolint,
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.opacheck,
        nls.builtins.diagnostics.rpmspec,
        nls.builtins.diagnostics.saltlint,
        nls.builtins.diagnostics.terraform_validate,
        nls.builtins.diagnostics.tfsec,
        nls.builtins.diagnostics.zsh,
        nls.builtins.formatting.cbfmt,
        nls.builtins.formatting.gofumpt,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.markdownlint,
        nls.builtins.formatting.packer,
        nls.builtins.formatting.prettier.with({
          disabled_filetypes = { "go", "yaml" },
          extra_args = { "--prose-wrap", "always" },
        }),
        nls.builtins.formatting.rego,
        nls.builtins.formatting.terraform_fmt,
        nls.builtins.formatting.yamlfmt,
      },
    })
  end,
}

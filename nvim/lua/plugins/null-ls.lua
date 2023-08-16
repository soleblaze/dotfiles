return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function(_, opts)
    local nls = require("null-ls")
    return {
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.zsh,
        nls.builtins.formatting.fixjson,
        nls.builtins.formatting.shfmt.with({
          args = { "-ci", "-s", "-i", "2", "-bn", "-sr", "-filename", "$FILENAME" },
        }),
        nls.builtins.formatting.trim_whitespace.with({
          disabled_filetypes = { "go" },
        }),
        nls.builtins.formatting.prettierd.with({
          disabled_filetypes = { "go", "yaml" },
          extra_args = { "--prose-wrap", "always" },
        }),
        nls.builtins.formatting.trim_whitespace.with({
          disabled_filetypes = { "go" },
        }),
      }),
    }
  end,
}

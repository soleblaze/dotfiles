return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.diagnostics.zsh,
          nls.builtins.formatting.fixjson,
          nls.builtins.formatting.shfmt.with({
            args = { "-ci", "-s", "-i", "2", "-bn", "-sr", "-filename", "$FILENAME" },
          }),
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.trim_whitespace.with({
            disabled_filetypes = { "go" },
          }),
        },
      }
    end,
  },
}

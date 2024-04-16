return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["*"] = { "trim_whitespace" },
      ["json"] = { "fixjson" },
      markdown = { "prettierd", "markdownlint-cli2" },
      ["sh"] = { "shfmt" },
      python = { "isort", "black" },
      packer = { "packer_fmt" },
      yaml = { "yamlfmt" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-ci", "-s", "-i", "2", "-bn", "-sr" },
      },
    },
    format = {
      async = false,
      lsp_fallback = true,
      quiet = false,
      timeout_ms = 3000,
    },
  },
}

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["*"] = { "trim_whitespace" },
      ["json"] = { "fixjson" },
      ["markdown"] = { "mdformat" },
      ["sh"] = { "shfmt" },
      python = { "isort", "black" },
      packer = { "packer_fmt" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-ci", "-s", "-i", "2", "-bn", "-sr" },
      },
      mdformat = {
        prepend_args = { "--wrap", "80" },
      },
      fixjson = {
        prepend_args = { "-i 4" },
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

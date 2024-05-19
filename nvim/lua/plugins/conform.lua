return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["*"] = { "trim_whitespace" },
      json = { "fixjson" },
      markdown = { "prettierd", "markdownlint-cli2" },
      packer = { "packer_fmt" },
      yaml = { "yamlfmt" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-ci", "-s", "-i", "2", "-bn", "-sr" },
      },
    },
  },
}

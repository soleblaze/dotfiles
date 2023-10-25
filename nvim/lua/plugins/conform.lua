return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      json = { "fixjson" },
      ["*"] = { "trim_whitespace" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-ci", "-s", "-i", "2", "-bn", "-sr" },
      },
    },
  },
}

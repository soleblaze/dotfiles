return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      ansible = { "ansible_lint" },
      bash = { "shellcheck" },
      commit = { "commitlint" },
      sh = { "shellcheck" },
      zsh = { "zsh" },
    },
  },
}

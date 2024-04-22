return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      ansible = { "ansible_lint" },
      commit = { "commitlint" },
      zsh = { "zsh" },
    },
  },
}

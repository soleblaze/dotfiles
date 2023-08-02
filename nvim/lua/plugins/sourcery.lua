return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "sourcery" })
      end,
    },
    opts = {
      servers = {
        sourcery = {},
      },
    },
    setup = {
      sourcery = function(_, opts)
      end,
    },
  },
}

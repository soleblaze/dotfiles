return {
  "glepnir/lspsaga.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = { enable = false },
    })
  end,
}

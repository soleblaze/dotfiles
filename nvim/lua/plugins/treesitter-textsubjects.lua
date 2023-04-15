return {
  "RRethy/nvim-treesitter-textsubjects",
  config = function()
    require("nvim-treesitter.configs").setup {
      textsubjects = {
        enable = true,
        keymaps = {
          ["."] = "textsubjects-smart",
          [";"] = "textsubjects-container-outer",
          ["i;"] = "textsubjects-container-inner",
        },
      },
    }
  end
}

return {
  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      virtcolumn = "+1,80,100",
      highlight = "VirtColumn",
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "ColorColumn", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#204563", bg = "NONE" })
      require("virt-column").setup(opts)
    end
  },
}

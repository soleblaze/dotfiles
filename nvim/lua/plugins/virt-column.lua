vim.api.nvim_set_hl(0, "ColorColumn", { fg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#204563", bg = "NONE" })

return {
  { "lukas-reineke/virt-column.nvim", opts = {
    char = "│",
    virtcolumn = "+1,100",
  } },
}

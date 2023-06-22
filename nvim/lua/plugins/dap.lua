return {
  "mfussenegger/nvim-dap",
  "ray-x/guihua.lua",
  "theHamsta/nvim-dap-virtual-text",
  config = function()
    require("nvim-dap-virtual-text").setup()
  end
}

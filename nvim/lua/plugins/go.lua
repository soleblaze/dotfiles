return {
  "ray-x/go.nvim",
  dependencies = { "ray-x/guihua.lua" },
  config = function()
    require("go").setup({
      fillstruct = "gopls",
      lsp_gofumpt = true,
      dap_debug = true,
      dap_debug_gui = true,
    })
  end
}

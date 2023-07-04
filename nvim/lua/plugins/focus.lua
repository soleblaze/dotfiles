return {
  "beauwilliams/focus.nvim",
  config = function()
    require("focus").setup({
      cursorline = false,
      hybridnumber = true
    })
  end,
}

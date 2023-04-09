return {
  "j-hui/fidget.nvim",
  config = function()
    require "fidget".setup({
      text = {
        spinner = "dots"
      },
      sources = {
        ["null-ls"] = {
          ignore = true,
        },
      },
    })
  end
}

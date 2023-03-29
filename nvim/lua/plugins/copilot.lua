return {
  "zbirenbaum/copilot.lua",
  config = function()
    require("copilot").setup({
      suggestion = { enable = false },
      panel = { enabled = false },
    })
  end
}

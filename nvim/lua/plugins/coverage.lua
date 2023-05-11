return {
  "andythigpen/nvim-coverage",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("coverage").setup({
      highlights = {
        covered = { fg = "#3ad900" },
        uncovered = { fg = "#ffc600" },
      },
      summary = {
        min_coverage = 60.0,
      },
    })
  end,
}

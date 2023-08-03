return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "sindrets/diffview.nvim"
  },
  config = function()
    local neogit = require('neogit')
    neogit.setup({
      integrations = { diffview = true },
      disable_commit_confirmation = true
    })
  end,
  keys = {
    { "<leader>gp", "<cmd>lua require('neogit').open({'push'})<cr>",   desc = "Neogit Push" },
    { "<leader>gc", "<cmd>lua require('neogit').open({'commit'})<cr>", desc = "Neogit Commit" },
    { "<leader>gn", "<cmd>lua require('neogit').open()<cr>",           desc = "Neogit" },
  }
}

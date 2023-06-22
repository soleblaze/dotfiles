return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      icons = {
        button = ' ',
        buffer_index = true,
        filetype = { enabled = false },
      },
      clickable = false,
      maximum_padding = 1,
    }
  },
}

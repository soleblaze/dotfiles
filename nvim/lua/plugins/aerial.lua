return {
  'stevearc/aerial.nvim',
  config = function()
    require('aerial').setup()
    require('telescope').load_extension('aerial')
  end
}

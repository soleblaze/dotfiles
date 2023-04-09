return {
  'phaazon/hop.nvim',
  branch = 'v2',
  config = function()
    require 'hop'.setup {
      create_hl_autocmd = false,
      multi_windows = true,
    }
  end
}

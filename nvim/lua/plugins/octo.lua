return {
  -- 'pwntester/octo.nvim',
  -- Using my own branch until https://github.com/pwntester/octo.nvim/pull/349
  -- is merged
  'soleblaze/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    require("octo").setup({
      use_local_fs = true,
      mappings = {},
    })
  end
}

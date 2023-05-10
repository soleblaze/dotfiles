return {
  "ggandor/leap-spooky.nvim",
  dependencies = { "tpope/vim-repeat" },
  config = function()
    require('leap-spooky').setup {
      paste_on_remote_yank = true
    }
  end,
}

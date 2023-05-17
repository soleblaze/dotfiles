local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("settings")
require("toggle-autoformat")
require("toggle-cmp")
require("lazy").setup(
  "plugins",
  {
    checker = {
      enabled = true,
      frequency = 86400,
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    }
  }
)
require("map")
require("title")

vim.cmd("source ~/.config/nvim/vim/toggle.vim")
vim.cmd("source ~/.config/nvim/vim/colors.vim")

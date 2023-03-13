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
require("lazy").setup("plugins")
require("map")

vim.cmd("source ~/.config/nvim/vim/git.vim")
vim.cmd("source ~/.config/nvim/vim/toggle.vim")
vim.cmd("source ~/.config/nvim/vim/colors.vim")

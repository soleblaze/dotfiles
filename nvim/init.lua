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

if vim.g.vscode then
  require("vscode.settings")
  require("lazy").setup("vscode.plugins")
  require("vscode.map")
else
  require("settings")
  require("toggle-autoformat")
  require("toggle-cmp")
  require("lazy").setup("plugins")
  require("map")
  require("title")

  vim.cmd("source ~/.config/nvim/vim/toggle.vim")
  vim.cmd("source ~/.config/nvim/vim/colors.vim")
end

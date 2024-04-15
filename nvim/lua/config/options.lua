-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.cursorline = false
vim.opt.wrap = true
vim.opt.clipboard = ""
vim.opt.mouse = ""
vim.opt.linebreak = true
vim.g.loaded_perl_provider = 0
vim.g.autoformat = true

package.cpath = package.cpath .. ";~/.luarocks/lib/lua/5.1/?.so"

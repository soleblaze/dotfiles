local vscode = require("vscode-neovim")
vim.notify = vscode.notify

-- Settings
vim.g.mapleader = " "
vim.opt.grepprg = "rg"
vim.opt.wildmode = { "list", "longest" }

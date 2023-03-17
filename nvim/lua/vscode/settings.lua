vim.g.mapleader = " "
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.grepprg = "rg --vimgrep" -- Use rg for grep
vim.opt.hidden = true -- Enable background buffers
vim.opt.hlsearch = false
vim.opt.ignorecase = true -- Ignore case
vim.opt.incsearch = true
vim.opt.joinspaces = false -- No double spaces with join
vim.opt.linebreak = true -- Use line breaks
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.showmatch = true
vim.opt.smartcase = true -- Do not ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.updatetime = 50

local lazypath = vim.fn.stdpath("data") .. "/lazy-vscode/lazy.nvim"
-- Set backup options
vim.opt.backup = false
vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup"
vim.opt.writebackup = false
vim.opt.spellfile = vim.fn.stdpath("data") .. "/spell/en.utf-8.add"

-- Undo settings
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Speed up nvim
vim.g.matchparen_insert_timeout = 20
vim.g.matchparen_timeout = 20
vim.opt.cursorline = false

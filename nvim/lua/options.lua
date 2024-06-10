vim.g.autoformat = true
vim.g.mapleader = " "

vim.opt.autoindent = true
vim.opt.autowrite = true
vim.opt.clipboard = ""
vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.grepprg = "rg --vimgrep"
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.joinspaces = false
vim.opt.linebreak = true
vim.opt.linebreak = true
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(expand('%:p'), ':~')} - NVIM"
vim.opt.wrap = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.spelllang = "en_us"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.title = true
vim.opt.updatetime = 50
vim.opt.wildmode = { "list", "longest" }
vim.opt.wrap = true

-- Set backup options
vim.opt.backup = false
vim.opt.backupdir = vim.fn.stdpath("config") .. "/.backup"
vim.opt.backupdir = vim.fn.expand("~/.cache/nvim/backup")
vim.opt.writebackup = false

-- Undo settings
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undo")
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Speed up nvim
vim.g.matchparen_insert_timeout = 20
vim.g.matchparen_timeout = 20
vim.opt.cursorline = false

-- Setup folds
vim.wo.conceallevel = 2
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- disable unused providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.markdown_recommended_style = 0

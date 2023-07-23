vim.g.mapleader = " "

vim.opt.autoindent = true
vim.opt.autowrite = true
vim.opt.autowrite = true
vim.opt.completeopt = { "menuone", "noinsert", "noselect" } -- Completion options (for deoplete)
vim.opt.expandtab = true                                    -- Use spaces instead of tabs
vim.opt.grepprg = "rg --vimgrep"                            -- Use rg for grep
vim.opt.hidden = true                                       -- Enable background buffers
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true                                   -- Ignore case
vim.opt.joinspaces = false                                  -- No double spaces with join
vim.opt.linebreak = true                                    -- Use line breaks
vim.opt.mouse = ""                                          -- Disable mouse
vim.opt.number = true                                       -- Show line numbers
vim.opt.relativenumber = true
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/snippets") -- add snippet directory to rtp
vim.opt.scrolloff = 5                                       -- Lines of context
vim.opt.shiftround = true                                   -- Round indent
vim.opt.shiftwidth = 2                                      -- Size of an indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmatch = true
vim.opt.showmode = false                 -- We don't need to see things like -- INSERT -- anymore
vim.opt.sidescrolloff = 10               -- Columns of context
vim.opt.signcolumn = "yes"               -- always show sign column
vim.opt.smartcase = true                 -- Do not ignore case with capitals
vim.opt.smartindent = true               -- Insert indents automatically
vim.opt.spelllang = "en_us"              -- Set spellcheck language
vim.opt.splitbelow = true                -- Put new windows below current
vim.opt.splitright = true                -- Put new windows right of current
vim.opt.tabstop = 2                      -- Number of spaces tabs count for
vim.opt.termguicolors = true             -- True color support
vim.opt.title = true                     -- Enable title
vim.opt.updatetime = 50
vim.opt.wildmode = { "list", "longest" } -- Command-line completion mode
vim.opt.wrap = true                      -- Use word wrapping

-- Set backup options
vim.opt.backup = false
vim.opt.backupdir = vim.fn.stdpath("config") .. "/.backup"
vim.opt.writebackup = false

-- Undo settings
vim.opt.undodir = vim.fn.stdpath("config") .. "/.undo"
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Speed up nvim
vim.g.matchparen_insert_timeout = 20
vim.g.matchparen_timeout = 20
vim.opt.cursorline = false

-- Setup folds for ufo
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Setup colorcolumn
vim.cmd("highlight VirtColumn guifg=#204563 guibg=NONE gui=NONE")
vim.cmd("highlight ColorColumn guifg=NONE guibg=NONE gui=NONE")

-- disable unused providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.markdown_recommended_style = 0

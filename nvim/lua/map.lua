-- map functions
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Resize windows
map("n", "<Left>", "<cmd>5winc <<cr>")
map("n", "<Right>", "<cmd>5winc ><cr>")

-- barbar
map("n", "<C-n>", "<cmd>BufferNext<cr>")
map("n", "<C-p>", "<cmd>BufferPrevious<cr>")
map("n", "<leader>a", "<cmd>BufferPick<cr>")
map("n", "<leader>1", "<cmd>BufferGoto 1<CR>")
map("n", "<leader>2", "<cmd>BufferGoto 2<CR>")
map("n", "<leader>3", "<cmd>BufferGoto 3<CR>")
map("n", "<leader>4", "<cmd>BufferGoto 4<CR>")
map("n", "<leader>5", "<cmd>BufferGoto 5<CR>")
map("n", "<leader>6", "<cmd>BufferGoto 6<CR>")
map("n", "<leader>7", "<cmd>BufferGoto 7<CR>")
map("n", "<leader>8", "<cmd>BufferGoto 8<CR>")
map("n", "<leader>9", "<cmd>BufferGoto 9<CR>")

-- other
map("i", "<F7>", "<C-o><cmd>set spell!<cr>")
map("i", "<F8>", "<C-o><cmd>set list!<cr>")
map("i", "<F9>", '<C-o><cmd>lua require"toggle-cmp".toggle_completion()<cr>')
map("n", "<C-s>", "<cmd>w<cr>")
map("n", "<F7>", "<cmd>set spell!<cr>")
map("n", "<F8>", "<cmd>set list!<cr>")
map("n", "<F9>", '<cmd>lua require"toggle-cmp".toggle_completion()<cr>')
map("n", "<leader>'", "<C-w>s")
map("n", "<leader>;", "<C-w>v")
map("n", "<leader>P", '"+P')
map("n", "<leader>d", "<cmd>bdelete!<cr>")
map("n", "<leader>p", '"+p')
map("n", "<leader>rv", "<cmd>source $MYVIMRC<cr>")
map("n", "<leader>y", '"+y', { noremap = false })
map("n", "ZZ", "<cmd>wqa!<cr>")
map("v", "<C-s>", "<Esc><cmd>w<cr>")
map("v", "<leader>y", '"+y')

-- window movement
map("n", "<C-h>", "<cmd>wincmd h<cr>")
map("n", "<C-j>", "<cmd>wincmd j<cr>")
map("n", "<C-k>", "<cmd>wincmd k<cr>")
map("n", "<C-l>", "<cmd>wincmd l<cr>")

map("n", "<C-w>z", "<C-w>|<C-w>_")

-- vimwiki
map("n", "<leader>wf", "<cmd>lua require('telescope').extensions.vimwiki.vimwiki()<cr>")
map("n", "<leader>wg", "<cmd>lua require('telescope').extensions.vw.live_grep()<cr>")
map("n", "<leader>wn", "<cmd>lua require('telescope').extensions.vw.link()<cr>")

-- Which Key Mappings
local wk = require("which-key")
wk.register({
  f = {
    name = "+Telescope",
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    c = { "<cmd>Telescope quickfix<cr>", "QuickFix" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diags" },
    f = { "<cmd>Telescope find_files<cr>", "FindFiles" },
    g = { "<cmd>Telescope live_grep<cr>", "LiveGrep" },
    h = { "<cmd>Telescope help_tags<cr>", "HelpTags" },
    i = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "FindInBuffer" },
    j = { "<cmd>Telescope jumplist<cr>", "JumpList" },
    l = { "<cmd>Telescope loclist<cr>", "LocList" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    r = {
      '<cmd>lua require"telescope".extensions.repo.list{file_ignore_patterns={"/%.cache/", "/%.cargo/", "/%.local/", "/%.zinit/", "/%.tmux/", "/%.config/", ".fzf", "/%Library/", "/%Documents/"}}<cr>',
      "RepoList",
    },
  },
  w = {
    name = "+Window",
    p = { "<cmd>pclose<cr>", "ClosePreview" },
    x = { "<cmd>close<cr>", "Close" }
  },
}, { prefix = "<leader>" })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<C-n>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<C-p>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "<leader>D", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show Diagnostics" })

map("n", "<leader>fn", function()
  require("telescope.builtin").live_grep({ cwd = vim.env.HOME .. "/Nextcloud/Notes/" })
end, { desc = "Find in Notes" })
map("n", "<leader>fN", function()
  require("telescope.builtin").find_files({ cwd = vim.env.HOME .. "/Nextcloud/Notes/" })
end, { desc = "Find in Notes" })

-- Remove gj/gk lazyvim mapping override
vim.keymap.del({ "n", "x" }, "j")
vim.keymap.del({ "n", "x" }, "k")

-- Remove Move Line Up/Down mappings
vim.keymap.del({ "i", "n", "x" }, "<M-j>")
vim.keymap.del({ "i", "n", "x" }, "<M-k>")
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to System Clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from System Clipboard" })
map("n", "<leader>P", '"+{', { desc = "Paste from System Clipboard" })

map({ "n", "v", "i" }, "<F3>", function()
  require("toggle").diagnostic()
end, { desc = "Toggle Diagnostics" })
map({ "n", "v", "i" }, "<F4>", function()
  require("toggle").cmp()
end, { desc = "Toggle cmp" })
map({ "n", "v", "i" }, "<F5>", function()
  require("toggle").relativenumber()
end, { desc = "Toggle Relative Number" })
map({ "n", "v", "i" }, "<F6>", function()
  require("toggle").autoFormat()
end, { desc = "Toggle Auto Format" })
map({ "n", "v", "i" }, "<F7>", "<cmd>set spell!<cr>", { desc = "Toggle Spell" })
map({ "n", "v", "i" }, "<F8>", "<cmd>set list!<cr>", { desc = "Toggle List" })

map("n", "<leader>wc", function()
  require("toggle").quickfix()
end, { desc = "Toggle Quickfix" })
map("n", "<leader>wl", function()
  require("toggle").location()
end, { desc = "Toggle Location List" })

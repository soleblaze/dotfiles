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
map("n", "<leader>d", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<leader>fn",
  function()
    require('telescope.builtin').live_grep({ cwd = vim.env.HOME .. "/Nextcloud/Notes/" })
  end,
  { desc = "Find in Notes" })
map("n", "<leader>fN",
  function()
    require('telescope.builtin').find_files({ cwd = vim.env.HOME .. "/Nextcloud/Notes/" })
  end,
  { desc = "Find in Notes" })


-- Remove gj/gk lazyvim mapping override
vim.keymap.del({ "n", "x" }, "j")
vim.keymap.del({ "n", "x" }, "k")

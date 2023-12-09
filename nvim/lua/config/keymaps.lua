-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
if not vim.g.vscode then
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
else
  local keymap = vim.api.nvim_set_keymap

  local function notify(cmd)
    return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
  end

  keymap("n", "<leader>D", notify("editor.action.revealDefinitionAside"), { silent = true })
  keymap("n", "<leader>F", notify("editor.action.formatDocument"), { silent = true })
  keymap("n", "<leader>P", '"+P', { silent = true })
  keymap("n", "<leader>b", notify("workbench.action.toggleSidebarVisibility"), { silent = true })
  keymap("n", "<leader>d", notify("editor.action.showDefinitionPreviewHover"), { silent = true })
  keymap("n", "<leader>e", notify("problems.action.open"), { silent = true })
  keymap("n", "<leader>ff", notify("workbench.action.quickOpen"), { silent = true })
  keymap("n", "<leader>fg", notify("workbench.action.findInFiles"), { silent = true })
  keymap("n", "<leader>fp", notify("projectManager.listProjects"), { silent = true })
  keymap("n", "<leader>fr", notify("references-view.findReferences"), { silent = true })
  keymap("n", "<leader>gb", notify("gitlens.toggleFileBlame"), { silent = true })
  keymap("n", "<leader>gd", notify("editor.action.revealDefinition"), { silent = true })
  keymap("n", "<leader>gi", notify("editor.action.goToImplementation"), { silent = true })
  keymap("n", "<leader>gl", notify("extension.copyGitHubLinkToClipboard"), { silent = true })
  keymap("n", "<leader>gr", notify("editor.action.goToReferences"), { silent = true })
  keymap("n", "<leader>gs", notify("workbench.action.showAllSymbols"), { silent = true })
  keymap("n", "<leader>gt", notify("editor.action.goToTypeDefinition"), { silent = true })
  keymap("n", "<leader>k", notify("extension.dash.specific"), { silent = true })
  keymap("n", "<leader>p", '"+p', { silent = true })
  keymap("n", "<leader>rf", notify("editor.action.refactor"), { silent = true })
  keymap("n", "<leader>rn", notify("editor.action.rename"), { silent = true })
  keymap("n", "<leader>y", '"+y', { silent = true })
  keymap("n", "[D", notify("editor.action.marker.prevInFiles"), { silent = true })
  keymap("n", "[d", notify("editor.action.marker.prev"), { silent = true })
  keymap("n", "]D", notify("editor.action.marker.nextInFiles"), { silent = true })
  keymap("n", "]d", notify("editor.action.marker.next"), { silent = true })
  keymap("v", "<leader>y", '"+y', { silent = true })
end

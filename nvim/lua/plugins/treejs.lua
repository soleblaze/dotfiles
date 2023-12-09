return {
  "Wansmer/treesj",
  vscode = true,
  keys = {
    { "gJ", "<cmd>TSJToggle<cr>", desc = "Join Line" },
    { "gS", "<cmd>TSJSplit<cr>", desc = "Split Line" },
    { "gM", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
  },
  opts = { use_default_keymaps = false, max_join_length = 100 },
}

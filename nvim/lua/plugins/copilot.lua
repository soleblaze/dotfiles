return {
  {
    "zbirenbaum/copilot.lua",
    keys = {
      { "<leader>acd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
      { "<leader>acd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot", mode = "v" },
      { "<leader>ace", "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
      { "<leader>ace", "<cmd>Copilot enable<cr>", desc = "Enable Copilot", mode = "v" },
      { "<leader>acp", "<cmd>Copilot panel<cr>", desc = "Copilot Panel" },
      { "<leader>acp", "<cmd>Copilot panel<cr>", desc = "Copilot Panel", mode = "v" },
      { "<leader>acs", "<cmd>Copilot status<cr>", desc = "Copilot Status" },
      { "<leader>acs", "<cmd>Copilot status<cr>", desc = "Copilot Status", mode = "v" },
      { "<leader>act", "<cmd>CopilotToggle<cr>", desc = "Toggle Copilot" },
      { "<leader>act", "<cmd>CopilotToggle<cr>", desc = "Toggle Copilot", mode = "v" },
    },
  },
  {
    "jellydn/CopilotChat.nvim",
    opts = {
      mode = "split", -- newbuffer or split  , default: newbuffer
      debug = false, -- Enable or disable debug mode
    },
    build = function()
      vim.defer_fn(function()
        vim.cmd("UpdateRemotePlugins")
        vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
      end, 3000)
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
    },
  },
}

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
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false,
      mode = "split",
      prompts = {
        Explain = "Explain how it works.",
        Review = "Review the following code and provide concise suggestions.",
        Tests = "Briefly explain how the selected code works, then generate unit tests.",
        Refactor = "Refactor the code to improve clarity and readability.",
      },
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
      { "<leader>ab", "<cmd>CopilotChatBuffer<cr>", desc = "CopilotChat - Chat with current buffer" },
      { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>as", "<cmd>CopilotChatVsplitToggle<cr>", desc = "CopilotChat - Toggle Vsplit" },
      { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      { "<leader>av", "<cmd>CopilotChatVisual<cr>", desc = "CopilotChat - Visual", mode = "v" },
      { "<leader>ai", "<cmd>CopilotChatInPlace<cr>", desc = "CopilotChat - In-place", mode = { "n", "v" } },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            vim.cmd("CopilotChatBuffer " .. input)
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      {
        "<leader>ah",
        function()
          require("CopilotChat.code_actions").show_help_actions()
        end,
        desc = "CopilotChat - Help actions",
      },
      {
        "<leader>ap",
        function()
          require("CopilotChat.code_actions").show_prompt_actions()
        end,
        desc = "CopilotChat - Help actions",
      },
      {
        "<leader>ap",
        ":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
        mode = "x",
        desc = "CopilotChat - Prompt actions",
      },
    },
  },
}

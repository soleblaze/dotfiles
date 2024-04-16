return {
  {
    "zbirenbaum/copilot.lua",
    keys = {
      { "<leader>aCd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
      { "<leader>aCd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot", mode = "v" },
      { "<leader>aCe", "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
      { "<leader>aCe", "<cmd>Copilot enable<cr>", desc = "Enable Copilot", mode = "v" },
      { "<leader>aCp", "<cmd>Copilot panel<cr>", desc = "Copilot Panel" },
      { "<leader>aCp", "<cmd>Copilot panel<cr>", desc = "Copilot Panel", mode = "v" },
      { "<leader>aCs", "<cmd>Copilot status<cr>", desc = "Copilot Status" },
      { "<leader>aCs", "<cmd>Copilot status<cr>", desc = "Copilot Status", mode = "v" },
      { "<leader>aCt", "<cmd>CopilotToggle<cr>", desc = "Toggle Copilot" },
      { "<leader>aCt", "<cmd>CopilotToggle<cr>", desc = "Toggle Copilot", mode = "v" },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {},
    build = function()
      vim.defer_fn(function()
        vim.cmd("UpdateRemotePlugins")
        vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
      end, 3000)
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
      {
        "<leader>ab",
        function(args)
          require("CopilotChat").ask(args.args, { selection = require("CopilotChat.select").buffer })
        end,
        desc = "CopilotChat - Chat with current buffer",
      },
      { "<leader>ac", "<cmd>CopilotChat<cr>", desc = "CopilotChat - Chat" },
      { "<leader>ad", "<cmd>CopilotChatDocs<cr>", desc = "CopilotChat - Add Docs" },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>aw", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
      { "<leader>aw", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle", mode = "v" },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      {
        "<leader>ah",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
      -- Show prompts actions with telescope
      {
        "<leader>ap",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
    },
  },
}

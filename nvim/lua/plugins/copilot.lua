package.cpath = package.cpath .. ";" .. vim.fn.expand("~") .. "/.luarocks/lib/lua/5.1/?.so"
return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      filetypes = {
        yaml = true,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
    },
    keys = {
      { "<leader>acd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
      { "<leader>acd", "<cmd>Copilot disable<cr>", desc = "Disable Copilot", mode = "v" },
      { "<leader>ace", "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
      { "<leader>ace", "<cmd>Copilot enable<cr>", desc = "Enable Copilot", mode = "v" },
      { "<leader>acp", "<cmd>Copilot panel<cr>", desc = "Copilot Panel" },
      { "<leader>acp", "<cmd>Copilot panel<cr>", desc = "Copilot Panel", mode = "v" },
      { "<leader>acs", "<cmd>Copilot status<cr>", desc = "Copilot Status" },
      { "<leader>acs", "<cmd>Copilot status<cr>", desc = "Copilot Status", mode = "v" },
      { "<leader>act", "<cmd>Copilot toggle<cr>", desc = "Toggle Copilot" },
      { "<leader>act", "<cmd>Copilot toggle<cr>", desc = "Toggle Copilot", mode = "v" },
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
      { "<leader>aC", "<cmd>CopilotChatCommit<cr>", desc = "CopilotChat - Write Commit Message" },
      { "<leader>aS", "<cmd>CopilotChatCommitStaged<cr>", desc = "CopilotChat - Write Commit Message for Staged" },
      { "<leader>ad", "<cmd>CopilotChatDocs<cr>", desc = "CopilotChat - Add Docs", mode = "v" },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code", mode = "v" },
      { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
      { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic", mode = "v" },
      { "<leader>ai", "<cmd>CopilotChat<cr>", desc = "CopilotChat - Chat" },
      { "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "CopilotChat - Optimize Code", mode = "v" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code", mode = "v" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests", mode = "v" },
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
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
        mode = "v",
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

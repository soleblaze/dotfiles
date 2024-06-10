return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    opts = {
      sugestion = { enabled = false, },
      panel = { enabled = false },
      filetypes = {
        yaml = true,
      },
    }
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      model = "gpt-4",
      auto_insert_mode = true,
      show_help = true,
      highlight_selection = true,
      window = {
        width = 0.4,
      },
    },
    build = function()
      vim.defer_fn(function()
        vim.cmd("UpdateRemotePlugins")
        vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
      end, 3000)
    end,
    event = "VeryLazy",
    config = function(_, opts)
      require("CopilotChat.integrations.cmp").setup()
      require("CopilotChat").setup(opts)
    end,
  },
}

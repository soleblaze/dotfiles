return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.defaults, { ["<leader>ao"] = { name = "+ChatGPT" } })
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        openai_params = {
          model = "gpt-4o",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 2048,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        },
        openai_edit_params = {
          model = "gpt-4o",
          frequency_penalty = 0,
          presence_penalty = 0,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>aoc", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
      { "<leader>aoR", "<cmd>ChatGPTRun roxygen_edit<cr>", desc = "Roxygen Edit", mode = "v" },
      { "<leader>aoR", "<cmd>ChatGPTRun roxygen_edit<cr>", desc = "Roxygen Edit" },
      { "<leader>aoT", "<cmd>ChatGPTRun translate<cr>", desc = "Translate", mode = "v" },
      { "<leader>aoT", "<cmd>ChatGPTRun translate<cr>", desc = "Translate" },
      { "<leader>aod", "<cmd>CHatGPTRun docstring<cr>", desc = "DocString", mode = "v" },
      { "<leader>aod", "<cmd>CHatGPTRun docstring<cr>", desc = "DocString" },
      { "<leader>aoe", "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain Code", mode = "v" },
      { "<leader>aoe", "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain Code" },
      { "<leader>aof", "<cmd>ChatGPTRun fix_bugs<cr>", desc = "Fix Bugs", mode = "v" },
      { "<leader>aof", "<cmd>ChatGPTRun fix_bugs<cr>", desc = "Fix Bugs" },
      { "<leader>aog", "<cmd>ChatGPTRun grammer_correction<cr>", desc = "Grammer Correction", mode = "v" },
      { "<leader>aog", "<cmd>ChatGPTRun grammer_correction<cr>", desc = "Grammer Correction" },
      {
        "<leader>aoi",
        "<cmd>lua require('chatgpt').edit_with_instructions()<cr>",
        desc = "Edit with Instructions",
        mode = "v",
      },
      { "<leader>aoi", "<cmd>lua require('chatgpt').edit_with_instructions()<cr>", desc = "Edit with Instructions" },
      { "<leader>aok", "<cmd>ChatGPTRun keywords<cr>", desc = "Keywords" },
      {
        "<leader>aok",
        "<cmd>ChatGPTRun keywords<cr>",
        desc = "Keywords",
        mode = "v",
      },
      { "<leader>aoo", "<cmd>ChatGPTRun optimize_code<cr>", desc = "Optimize Code" },
      {
        "<leader>aoo",
        "<cmd>ChatGPTRun optimize_code<cr>",
        desc = "Optimize Code",
        mode = "v",
      },
      { "<leader>aor", "<cmd>ChatGPTRun code_readability_analysis<cr>", desc = "Code Readability Analysis" },
      {
        "<leader>aor",
        "<cmd>ChatGPTRun code_readability_analysis<cr>",
        desc = "Code Readability Analysis",
        mode = "v",
      },
      { "<leader>aos", "<cmd>ChatGPTRun summarize<cr>", desc = "Summarize" },
      {
        "<leader>aos",
        "<cmd>ChatGPTRun summarize<cr>",
        desc = "Summarize",
        mode = "v",
      },
      { "<leader>aot", "<cmd>ChatGPTRun add_tests<cr>", desc = "Add Tests" },
      {
        "<leader>aot",
        "<cmd>ChatGPTRun add_tests<cr>",
        desc = "Add Tests",
        mode = "v",
      },
    },
    cond = function()
      return os.getenv("OPENAI_API_KEY") ~= nil
    end,
  },
}

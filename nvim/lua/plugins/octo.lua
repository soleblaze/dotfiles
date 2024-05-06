return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.defaults, { ["<leader>o"] = { name = "+octo" } })
      table.insert(opts.defaults, { ["<leader>oc"] = { name = "+comment" } })
      table.insert(opts.defaults, { ["<leader>op"] = { name = "+pr" } })
      table.insert(opts.defaults, { ["<leader>or"] = { name = "+review" } })
      table.insert(opts.defaults, { ["<leader>or"] = { name = "+review" } })
    end,
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        enable_builtin = true,
        use_local_fs = true,
      })
      vim.treesitter.language.register("markdown", "octo")
    end,
    keys = {
      { "<leader>oa", "<cmd>Octo actions<cr>", desc = "Actions" },
      { "<leader>ob", "<cmd>Octo browser<cr>", desc = "Open PR in Browser" },
      { "<leader>oo", "<cmd>Octo<cr>", desc = "Octo" },
      { "<leader>opa", "<cmd>Octo pr comment add<cr>", desc = "Add Comment" },
      { "<leader>opc", "<cmd>Octo pr checks<cr>", desc = "Show Check Status" },
      { "<leader>opd", "<cmd>Octo pr comment delete<cr>", desc = "Delete Comment" },
      { "<leader>opd", "<cmd>Octo pr diff<cr>", desc = "Show PR Diff" },
      { "<leader>opl", "<cmd>Octo pr list<cr>", desc = "List PRs" },
      { "<leader>opn", "<cmd>Octo pr create<cr>", desc = "Create PR" },
      { "<leader>orC", "<cmd>Octo review commit<cr>", desc = "Review Commit" },
      { "<leader>orc", "<cmd>Octo review close<cr>", desc = "Close Review" },
      { "<leader>ord", "<cmd>Octo review discard<cr>", desc = "Discard Review" },
      { "<leader>orn", "<cmd>Octo review start<cr>", desc = "Start Review" },
      { "<leader>orr", "<cmd>Octo review resume<cr>", desc = "Resume Review" },
      { "<leader>ors", "<cmd>Octo review submit<cr>", desc = "Submit Review" },
      { "<leader>ort", "<cmd>Octo review comments<cr>", desc = "Review Comments" },
      { "<leader>otr", "<cmd>Octo thread resolve<cr>", desc = "Resolve Thread" },
      { "<leader>otu", "<cmd>Octo thread unresolve<cr>", desc = "Unresolve Thread" },
    },
  },
}

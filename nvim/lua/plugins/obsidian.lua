return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand("~/.local/share/obsidian/**.md"),
    "BufNewFile " .. vim.fn.expand("~/.local/share/obsidian/**.md"),
  },
  cmd = {
    "ObsidianOpen",
    "ObsidianQuickSwitch",
    "ObsidianNew",
    "ObsidianSearch",
    "ObsidianTemplate",
    "ObsidianToday",
    "ObsidianTomorrow",
    "ObsidianYesterday",
    "ObsidianWorkspace",
  },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "main",
        path = "~/.local/share/obsidian/main",
      },
      {
        name = "tech",
        path = "~/.local/share/obsidian/tech",
      },
    },
    daily_notes = {
      folder = "daily/",
      template = "daily.md",
    },
    disable_frontmatter = true,
    use_advanced_uri = true,
    note_id_func = function(title)
      return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    end,
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      ["<leader>ob"] = {
        action = function()
          vim.cmd("ObsidianBacklinks")
        end,
        opts = { buffer = true, expr = true, desc = "Link Backlinks" },
      },
      ["<leader>oc"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true, desc = "Toggle Checkbox" },
      },
      ["<leader>oi"] = {
        action = function()
          return "<cmd>ObsidianPasteImg<cr>"
        end,
        opts = { buffer = true, expr = true, desc = "Paste Image" },
      },
      ["<leader>oL"] = {
        action = function()
          return "<cmd>ObsidianLinks<cr>"
        end,
        opts = { buffer = true, expr = true, desc = "List Links" },
      },
      ["<leader>on"] = {
        action = function()
          return "<cmd>ObsidianNew<cr>"
        end,
        opts = { buffer = true, expr = true, desc = "New Note and Link" },
      },
      ["<leader>or"] = {
        action = function()
          return "<cmd>ObsidianRename<cr>"
        end,
        opts = { buffer = true, expr = true, desc = "Rename Note" },
      },
    },
  },
}

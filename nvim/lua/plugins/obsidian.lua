return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.defaults, { ["<leader>o"] = { name = "+obsidian" } })
      table.insert(opts.defaults, { ["<leader>ot"] = { name = "tech vault" } })
      table.insert(opts.defaults, { ["<leader>om"] = { name = "main vault" } })
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand("~/obsidian/**.md"),
      "BufNewFile " .. vim.fn.expand("~/obsidian/**.md"),
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
          path = "~/obsidian/main",
        },
        {
          name = "tech",
          path = "~/obsidian/tech",
        },
      },
      daily_notes = {
        folder = "daily/",
        template = "daily.md",
      },
      new_notes_location = "current_dir",
      use_advanced_uri = true,
      note_id_func = function(title)
        return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      end,
      substitutions = {
        time24 = function()
          return os.date("%H:%M:%S")
        end,
        time12 = function()
          -- Conversion to 12-hour format with AM/PM
          local hour = tonumber(os.date("%H"))
          local ampm = hour >= 12 and "PM" or "AM"
          hour = hour % 12
          hour = hour == 0 and 12 or hour
          return string.format("%02d:%s %s", hour, os.date("%M:%S"), ampm)
        end,
        year = function()
          return os.date("%Y", os.time())
        end,
        month = function()
          return os.date("%B", os.time())
        end,
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        nextday = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,
        hdate = function()
          return os.date("%A, %B %d, %Y")
        end,
        rfc3339 = function()
          return os.date("!%Y-%m-%dT%H:%M:%SZ")
        end,
        week = function()
          return os.date("%V", os.time())
        end,
        isoweek = function()
          return os.date("%G-W%V", os.time())
        end,
        isoprevweek = function()
          local adjustment = -7 * 24 * 60 * 60 -- One week in seconds
          return os.date("%G-W%V", os.time() + adjustment)
        end,
        isonextweek = function()
          local adjustment = 7 * 24 * 60 * 60 -- One week in seconds
          return os.date("%G-W%V", os.time() + adjustment)
        end,
        day_of_month = function()
          return os.date("%d", os.time())
        end,
        month_numeric = function()
          return os.date("%m", os.time())
        end,
        weekday = function()
          return os.date("%A", os.time())
        end,
      },
      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url }) -- Mac OS
      end,
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
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
    config = function(_, opts)
      vim.keymap.set(
        "v",
        "<leader>oe",
        "<cmd>ObsidianExtractNote<cr>",
        { noremap = true, silent = true, desc = "Extract Note" }
      )
      vim.keymap.set("v", "<leader>ol", "<cmd>ObsidianLink<cr>", { noremap = true, silent = true, desc = "Link Note" })
      require("obsidian").setup(opts)
    end,
    keys = {
      { "<leader>oD", "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianDailies<cr>", desc = "Select Daily Note" },
      { "<leader>od", "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianToday<cr>", desc = "Open Daily Note" },
      { "<leader>omn", "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianNew<cr>", desc = "Create Note" },
      { "<leader>oms", "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianSearch<cr>", desc = "Search" },
      { "<leader>omt", "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianTemplate<cr>", desc = "Template Note" },
      {
        "<leader>omq",
        "<cmd>ObsidianWorkspace main<cr><cmd>ObsidianQuickSwitch<cr>",
        desc = "Quick Switch",
      },
      { "<leader>otn", "<cmd>ObsidianWorkspace tech<cr><cmd>ObsidianNew<cr>", desc = "Create Note" },
      { "<leader>ots", "<cmd>ObsidianWorkspace tech<cr><cmd>ObsidianSearch<cr>", desc = "Search" },
      { "<leader>ott", "<cmd>ObsidianWorkspace tech<cr><cmd>ObsidianTemplate<cr>", desc = "Template Note" },
      {
        "<leader>otq",
        "<cmd>ObsidianWorkspace tech<cr><cmd>ObsidianQuickSwitch<cr>",
        desc = "Quick Switch",
      },
      { "<leader>ov", "<cmd>ObsidianWorkspace<cr>", desc = "Change Obsidian Vault" },
    },
  },
}

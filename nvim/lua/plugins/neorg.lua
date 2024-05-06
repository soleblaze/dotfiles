local function search_workspace()
  local dm = require("neorg").modules.get_module("core.dirman")
  local ws = dm.get_current_workspace()
  local dir = tostring(ws[2])
  require("telescope.builtin").live_grep({ cwd = dir })
end

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "neorg",
        group_index = 1,
        priority = 10,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "norg" })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.defaults, { ["<leader>n"] = { name = "+neorg" } })
    end,
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = {
      { "luarocks.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-neorg/neorg-telescope" },
    },
    lazy = false,
    version = "*",
    config = true,
    opts = {
      load = {
        ["core.concealer"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.integrations.nvim-cmp"] = {},
        ["core.integrations.telescope"] = {},
        ["core.keybinds"] = {
          config = {
            hook = function(keybinds)
              keybinds.remap_key("norg", "n", "<C-Space>", "<Leader>t")
            end,
          },
        },
      },
    },
    keys = {
      { "<leader>ni", "<cmd>Neorg index<CR>", desc = "Index" },
      { "<leader>nj", "<cmd>Neorg journal today<CR>", desc = "Today's Journal" },
      { "<leader>nr", "<cmd>Neorg return<CR>", desc = "Return" },
      {
        "<leader>ns",
        function()
          search_workspace()
        end,
        desc = "Search Workspace",
      },
    },
  },
}

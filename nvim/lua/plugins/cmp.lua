return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    {
      "petertriho/cmp-git",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      opts = {},
    },
    {
      "saadparwaiz1/cmp_luasnip",
      config = function()
        local luasnip = require('luasnip')
        luasnip.config.set_config({
          region_check_events = 'InsertEnter',
          delete_check_events = 'InsertLeave'
        })
        require('luasnip.loaders.from_vscode').lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end
    },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = {
        "zbirenbaum/copilot.lua",
      },
      opts = {},
      config = function(_, opts)
        require("copilot_cmp").setup(opts)
      end
    }
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')
    return {
      auto_brackets = {},
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      formatting = {
        fields = { "kind", "abbr" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 50,
            symbol_map = { Copilot = ""
            }
          })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      },
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif cmp and cmp.visible(fallback) then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<C-p>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          elseif cmp and cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif cmp.visible() then
            cmp.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          elseif cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "copilot" },
        { name = "git" },
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
      }),
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end

    local cmp = require("cmp")
    cmp.setup(opts)
  end,
}

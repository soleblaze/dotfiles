return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    local luasnip = require('luasnip')

    luasnip.config.set_config({
      region_check_events = 'InsertEnter',
      delete_check_events = 'InsertLeave'
    })

    require('luasnip.loaders.from_vscode').lazy_load()

    local cmp = require("cmp")
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')

    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )

    cmp.setup({
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      completion = {
        get_trigger_characters = function(trigger_characters)
          return vim.tbl_filter(function(char)
            return char ~= " "
          end, trigger_characters)
        end,
        keyword_length = 2,
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            luasnip = "(Snippet)",
            nvim_lsp = "(LSP)",
            path = "(Path)",
            buffer = "(Buffer)",
          })[entry.source.name]
          vim_item.dup = ({
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
            luasnip = 1,
          })[entry.source.name] or 0
          return vim_item
        end,
        duplicates_default = 0,
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif cmp and cmp.visible() then
            cmp.confirm()
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<C-n>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif cmp and cmp.visible() then
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
        ["<Down>"] = cmp.mapping(function(fallback)
          if cmp and cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<Up>"] = cmp.mapping(function(fallback)
          if cmp and cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<CR>"] = cmp.mapping(function()
          cmp.autopairs.on_confirm_done({ map_char = { tex = "" } })
        end, {}),
      },
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "treesitter" },
        { name = "buffer" },
      },
    })
  end
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "petertriho/cmp-git" },
    { "saadparwaiz1/cmp_luasnip" },
    { "onsails/lspkind.nvim" },

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

    require("cmp_git").setup()

    local lspkind = require('lspkind')

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
        format = lspkind.cmp_format({
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          before = function(entry, vim_item)
            vim_item.dup = ({
                  buffer = 1,
                  path = 1,
                  nvim_lsp = 0,
                  luasnip = 1,
                })[entry.source.name] or 0
            return vim_item
          end
        })
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
        }),
      },
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping(function()
          if cmp and cmp.visible() then
            cmp.abort()
          else
            vim.api.nvim_feedkeys(vim.fn['copilot#Dismiss'](), 'i', true)
          end
        end, { "i", "s", }),
        ["<Tab>"] = cmp.mapping(function()
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            cmp.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            })
          end
        end, { "i", "s", }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<C-n>"] = cmp.mapping(function()
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif cmp and cmp.visible() then
            cmp.select_next_item()
          else
            vim.api.nvim_feedkeys(vim.fn['copilot#Next'](), 'i', true)
          end
        end, { "i", "s", }),
        ["<C-p>"] = cmp.mapping(function()
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          elseif cmp and cmp.visible() then
            cmp.select_prev_item()
          else
            vim.api.nvim_feedkeys(vim.fn['copilot#Previous'](), 'i', true)
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
        { name = "luasnip",    group_index = 2 },
        { name = "git",        group_index = 2 },
        { name = "nvim_lsp",   group_index = 2 },
        { name = "path",       group_index = 2 },
        { name = "treesitter", group_index = 2 },
        { name = "buffer",     group_index = 2 },
      },
      experimental = {
        ghost_text = false -- this feature conflict with copilot.vim's preview.
      }
    })
    cmp.event:on("menu_opened", function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
      vim.b.copilot_suggestion_hidden = false
    end)

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })
  end
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
  },
  opts = function(_, opts)
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    opts.sources = cmp.config.sources(vim.tbl_filter(function(source)
      if source.name == "buffer" then
        return false
      end
      return true
    end, opts.sources))

    opts.mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping(function(fallback)
        if cmp and cmp.visible() then
          cmp.abort()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<Tab>"] = cmp.mapping(function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          })
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-n>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        elseif cmp and cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-p>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif cmp and cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<Down>"] = cmp.mapping(function(fallback)
        if cmp and cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<Up>"] = cmp.mapping(function(fallback)
        if cmp and cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<CR>"] = cmp.mapping(function()
        cmp.autopairs.on_confirm_done({ map_char = { tex = "" } })
      end, {}),
    }
  end,
}

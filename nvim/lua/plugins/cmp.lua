return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

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
    }
  end,
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.sources = cmp.config.sources(vim.tbl_filter(function(source)
      if source.name == "buffer" then
        return false
      end
      return true
    end, opts.sources))

    opts.mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          })
        elseif vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
    }
  end,
}

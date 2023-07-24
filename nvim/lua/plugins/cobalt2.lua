return {
  {
    "lalitmee/cobalt2.nvim",
    event = { "ColorSchemePre" },
    dependencies = { "tjdevries/colorbuddy.nvim" },
    init = function()
      require("colorbuddy").colorscheme("cobalt2")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("colorbuddy").colorscheme("cobalt2")
        vim.api.nvim_set_hl(0, "BufferCurrent", { fg = "#FFFFFF", bg = "#275D84" })
        vim.api.nvim_set_hl(0, "BufferCurrentIndex", { fg = "#ffffff", bg = "#275D84" })
        vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = "#f8f8f8", bg = "#275D84" })
        vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = "#193549", bg = "#275D84" })
        vim.api.nvim_set_hl(0, "BufferCurrentTarget", { bold = true, fg = "red", bg = "#275D84" })
        vim.api.nvim_set_hl(0, "BufferVisible", { fg = "#ffffff", bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "BufferVisibleIndex", { fg = "#ffffff", bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "BufferVisibleMod", { fg = "#f8f8f8", bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "BufferVisibleSign", { fg = "#193549", bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "BufferVisibleTarget", { bold = true, fg = "red", bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "BufferInactive", { fg = "#c7c7c7", bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "BufferInactiveIndex", { fg = "#ffc600", bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "BufferInactiveMod", { fg = "#f8f8f8", bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "BufferInactiveSign", { fg = "#193549", bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "BufferInactiveTarget", { bold = true, fg = "red", bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "BufferTabpages", { bold = true, fg = "#ffffff", bg = "#193549" })
        vim.api.nvim_set_hl(0, "BufferTabpageFill", { fg = "#193549", bg = "#193549" })
        vim.api.nvim_set_hl(0, "PMenu", { fg = "#9E9E9E", bg = "#193549" })
        vim.api.nvim_set_hl(0, "PMenuSBar", { bg = "#626262" })
        vim.api.nvim_set_hl(0, "PMenuSel", { fg = "#1C1C1C", bg = "#FFC600" })
        vim.api.nvim_set_hl(0, "PMenuThumb", { bg = "#BCBCBC" })
        vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#1f4461" })
        vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#C7C7C7" })
        vim.api.nvim_set_hl(0, "FlashCurrent", { link = "IncSearch" })
        vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#3ad900", fg = "#000000" })
        vim.api.nvim_set_hl(0, "FlashMatch", { bg = "#00c5c7", fg = "#000000" })
        vim.api.nvim_set_hl(0, "FlashPrompt", { link = "MsgArea" })
        vim.api.nvim_set_hl(0, "FlashPromptIcon", { link = "Special" })
      end,
    },
  },
}

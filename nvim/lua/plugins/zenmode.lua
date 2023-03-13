return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      window = {
        backdrop = 1,
        width = 80,
        options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      on_open = function()
        vim.cmd("IndentBlanklineDisable")
        local _, cmp = pcall(require, "cmp")
        cmp.setup({ enabled = false })
      end,
      on_close = function()
        vim.cmd("IndentBlanklineEnable")
        local _, cmp = pcall(require, "cmp")
        cmp.setup({ enabled = true })
      end,
    }
  end
}

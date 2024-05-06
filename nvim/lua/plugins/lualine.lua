local icons = require("lazyvim.config").icons
local cobalt2 = require("lualine.themes.cobalt2custom")

local colors = {
  [""] = LazyVim.ui.fg("Special"),
  ["Normal"] = LazyVim.ui.fg("Special"),
  ["Warning"] = LazyVim.ui.fg("DiagnosticError"),
  ["InProgress"] = LazyVim.ui.fg("DiagnosticWarn"),
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = cobalt2,
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
        },
      },
      lualine_c = {
        { LazyVim.lualine.pretty_path() },
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
          source = function()
            local summary = vim.b.minidiff_summary
            return summary
              and {
                added = summary.add,
                modified = summary.change,
                removed = summary.delete,
              }
          end,
        },
        {
          "aerial",
          sep = " ",
          sep_icon = "",
          depth = 5,
          dense = false,
          dense_sep = ".",
          colored = true,
        },
      },
      lualine_x = {
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
        },
        {
          function()
            return "  " .. require("dap").status()
          end,
          cond = function()
            return package.loaded["dap"] and require("dap").status() ~= ""
          end,
          color = LazyVim.ui.fg("Debug"),
        },
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        {
          function()
            local icon = require("lazyvim.config").icons.kinds.Copilot
            local status = require("copilot.api").status.data
            return icon .. (status.message or "")
          end,
          cond = function()
            if not package.loaded["copilot"] then
              return
            end
            local ok, clients = pcall(LazyVim.lsp.get_clients, { name = "copilot", bufnr = 0 })
            if not ok then
              return false
            end
            return ok and #clients > 0
          end,
          color = function()
            if not package.loaded["copilot"] then
              return
            end
            local status = require("copilot.api").status.data
            return colors[status.status] or colors[""]
          end,
        },
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}

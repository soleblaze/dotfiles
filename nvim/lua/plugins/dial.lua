return {
  "monaqa/dial.nvim",
  vscode = true,
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group {
      default = {
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.new {
          elements = { "and", "or" },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { "&&", "||" },
          word = false,
          cyclic = true,
        },
        augend.constant.new {
          elements = { ">", "<" },
          word = false,
          cyclic = true,
        },
        augend.constant.new {
          elements = { "else", "elif" },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { ">", "<" },
          word = false,
          cyclic = true,
        },
        augend.constant.new {
          elements = { "on", "off" },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { "yes", "no" },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { ">", "<" },
          word = false,
          cyclic = true,
        },
        augend.constant.new {
          elements = { "first", "last" },
          word = true,
          cyclic = true,
        },
        augend.constant.alias.bool,
        augend.semver.alias.semver
      },
      visual = {
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
        augend.semver.alias.semver,
        augend.constant.new {
          elements = { "-", "_" },
          word = false,
          cyclic = true,
        }
      },
    }

    -- change augends in VISUAL mode
    vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
    vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
    vim.keymap.set("n", "g<C-a>", require("dial.map").inc_gnormal(), { noremap = true })
    vim.keymap.set("n", "g<C-x>", require("dial.map").dec_gnormal(), { noremap = true })
    vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
    vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
    vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
    vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
  end,
}

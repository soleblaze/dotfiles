return {
  "monaqa/dial.nvim",
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group {
      default = {
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.constant.new {
          elements = { "and", "or" },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { "on", "off" },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { "next", "prev" },
          word = true,
          cyclic = true,
        },
        augend.constant.new {
          elements = { "yes", "no" },
          word = true,
          cyclic = true,
        },
        augend.constant.alias.bool,
        augend.semver.alias.semver
      },
      visual = {
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
        augend.semver.alias.semver,
        augend.constant.new {
          elements = { "-", "_" },
          word = true,
          cyclic = true,
        }
      },
    }

    vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
    vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
    vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
    vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
  end,
}

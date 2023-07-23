return {
  "Vigemus/iron.nvim",
  config = function()
    local view = require("iron.view")
    local iron = require("iron.core")

    iron.setup {
      config = {
        scratch_repl = true,
        repl_open_cmd = view.split("40%"),
        repl_definition = {
          python = {
            command = { "ipython" },
          },
          sh = {
            command = { "zsh" }
          }
        },
      },
      keymaps = {
        send_motion = "<space>rs",
        visual_send = "<space>rs",
        send_file = "<space>rf",
        send_line = "<space>rl",
        send_until_cursor = "<space>ru",
        send_mark = "<space>rM",
        mark_motion = "<space>rm",
        mark_visual = "<space>rm",
        remove_mark = "<space>rd",
        cr = "<space>r<cr>",
        interrupt = "<space>r<space>",
        exit = "<space>rq",
        clear = "<space>rC",
      },
      ignore_blank_lines = true
    }
  end
}

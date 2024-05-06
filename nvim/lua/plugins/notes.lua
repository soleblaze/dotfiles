local base_dir = vim.fn.expand("~/notes")
local local_notes = base_dir .. "/local"
local shared_notes = base_dir .. "/shared"

local function search_notes()
  require("telescope.builtin").live_grep({ cwd = base_dir })
end

vim.keymap.set("n", "<leader>nf", function()
  search_notes()
end, { desc = "Search Notes" })

vim.keymap.set("n", "<space>nl", function()
  NOTE_DIR = local_notes
  require("telescope.builtin").find_files({ cwd = local_notes })
end, { desc = "Local Notes" })

vim.keymap.set("n", "<space>ns", function()
  NOTE_DIR = shared_notes
  require("telescope.builtin").find_files({ cwd = shared_notes })
end, { desc = "Shared Notes" })

return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      table.insert(opts.defaults, { ["<leader>n"] = { name = "+notes" } })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-E>"] = function(prompt_bufnr)
              local actions = require("telescope.actions")
              local action_state = require("telescope.actions.state")
              local prompt = action_state.get_current_line()
              actions.close(prompt_bufnr)
              vim.cmd.tabedit(NOTE_DIR .. "/" .. prompt)
            end,
          },
        },
      },
    },
  },
}

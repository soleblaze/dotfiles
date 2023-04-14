return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<Plug>(vimrc:copilot-dummy-map)', 'copilot#Accept("<Tab>")')

    local copilot_on = true
    vim.api.nvim_create_user_command("CopilotToggle", function()
      if copilot_on then
        vim.cmd("Copilot disable")
        print("Copilot OFF")
      else
        vim.cmd("Copilot enable")
        print("Copilot ON")
      end
      copilot_on = not copilot_on
    end, { nargs = 0 })
  end
}

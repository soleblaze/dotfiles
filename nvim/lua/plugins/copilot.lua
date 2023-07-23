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

    vim.api.nvim_create_autocmd({ 'BufEnter' }, {
      pattern = vim.fn.expand('~') .. '/Exercism/*',
      command = "Copilot disable"
    })

    vim.g.copilot_filetypes = {
      yaml = true
    }
  end,
  cond = function()
    local filepath = vim.fn.expand('~') .. '/.config/nvim/copilot.enable'
    local exists = vim.loop.fs_stat(filepath)
    return exists and exists.type == 'file'
  end

}

local function rename_tmux_window()
  local file_name = vim.fn.expand("%:t")
  if file_name ~= "" then
    local tmux_rename_cmd = "tmux rename-window " .. "n:" .. vim.fn.shellescape(file_name)
    vim.fn.system(tmux_rename_cmd)
  else
    local tmux_rename_cmd = "tmux rename-window " .. "nvim"
    vim.fn.system(tmux_rename_cmd)
  end
end

local function restore_tmux_window_name()
  local tmux_rename_cmd = "tmux setw automatic-rename"
  vim.fn.system(tmux_rename_cmd)
end

vim.api.nvim_create_augroup("tmux", {})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "FileReadPost" }, {
  group = "tmux",
  pattern = "*",
  callback = rename_tmux_window,
})

vim.api.nvim_create_autocmd("VimLeave", {
  group = "tmux",
  pattern = "*",
  callback = restore_tmux_window_name,
})

return {}

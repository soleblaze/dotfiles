if vim.env.TMUX then
  vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufNewFile",
    "BufReadPost",
    "BufWritePre",
    "FileReadPost",
  }, {
    command = 'call system("tmux rename-window " . expand("%:t"))',
    group = tmux,
  })
  vim.api.nvim_create_autocmd("VimLeave", {
    command = 'call system("tmux setw automatic-rename")',
    group = tmux,
  })
end

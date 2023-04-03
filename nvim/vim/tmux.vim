if exists('$TMUX')
  augroup tmux
    autocmd!
    autocmd BufEnter,BufNewFile,BufReadPost,FileReadPost * call system("tmux rename-window " . expand("%:t"))
    autocmd VimLeave * call system("tmux setw automatic-rename")
  augroup end
endif

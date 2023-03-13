function! Git_diff_windows(vertsplit, auto)
    if a:vertsplit
        rightbelow vnew
    else
        rightbelow new
    endif
    silent! setlocal ft=diff previewwindow bufhidden=delete nobackup noswf nobuflisted nowrap buftype=nofile
    exe "normal :r!LANG=C git diff --cached \no\<esc>1GddO\<esc>"
    setlocal nomodifiable
    noremap <buffer> q :bw<cr>
    if a:auto
        redraw!
        wincmd p
        redraw!
    endif
endfunction

autocmd FileType gitcommit call Git_diff_windows(0, 1)

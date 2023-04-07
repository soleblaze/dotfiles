vim.g.autoFormat = 1
vim.cmd("autocmd BufWritePre * if get(g:, 'autoFormat', 1) | exe 'lua vim.lsp.buf.format()' | endif")
vim.cmd("nnoremap <F6> :let g:autoFormat = !get(g:, 'autoFormat', 1)<cr>")

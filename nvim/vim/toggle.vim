" Toggle List windows
function! GetBufferList() abort
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx) abort

  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
    echohl ErrorMsg
    echo "Location List is Empty."
    return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nnoremap <silent> <leader>wc :call ToggleList("Quickfix List", 'c')<CR>
nnoremap <silent> <leader>wl :call ToggleList("Location List", 'l')<CR>

" Toggle relative line numbers
function! NumberToggle() abort
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

inoremap <F5> <C-o>:call NumberToggle()<cr>
nnoremap <F5> :call NumberToggle()<cr>

" Toggle relative line numbers
let s:diagnostictoggle = 1
function! DiagnosticToggle() abort
  if s:diagnostictoggle
    lua vim.diagnostic.disable()
    lua vim.diagnostic.config({ virtual_lines = false })
    let s:diagnostictoggle = 0
  else
    lua vim.diagnostic.enable()
    lua vim.diagnostic.config({ virtual_lines = true })
    let s:diagnostictoggle =1
  endif
endfunc

inoremap <F3> <C-o>:call DiagnosticToggle()<cr>
nnoremap <F3> :call DiagnosticToggle()<cr>

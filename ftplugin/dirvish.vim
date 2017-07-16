" reset this even if reloading
let b:show_hidden_files = 1

" finish here if reloading
if exists('b:loaded_user_ftplugin')
  finish
endif
let b:loaded_user_ftplugin = 1

setlocal nonumber

nmap <buffer> u  <Plug>(dirvish_up)
nmap <buffer> m  <CR>

" I should move the u mapping (dirvish_up) to a submode, then I could preserve
" u for undo in normal mode and won't need the below mapping
nnoremap <C-_> u

nnoremap <silent><buffer> h  :silent call <SID>ToggleHiddenFiles()<CR>

func! s:ToggleHiddenFiles()
  let save_cursor = getcurpos()

  if b:show_hidden_files
    keeppatterns g@\v/\.[^\/]+/?$@d
    let b:show_hidden_files = 0
  else
    Dirvish %
    let b:show_hidden_files = 1
  endif

  call setpos('.', save_cursor)
endf

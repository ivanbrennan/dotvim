set laststatus=2

set statusline=\                         " space
set statusline+=%1*                      " User1 highlight group (filename)
set statusline+=%f                       " relative path
set statusline+=%*                       " reset highlight group
set statusline+=\                        " space
set statusline+=%w                       " preview
set statusline+=%2*                      " User2 highlight group (filetype)
set statusline+=%y                       " filetype
set statusline+=%*                       " reset highlight group
set statusline+=%=                       " left/right separator
set statusline+=\                        " space
set statusline+=%{toupper(&fenc)}        " encoding
set statusline+=%(\ \ %{statusline#branch()}%)
set statusline+=\ \                      " spaces
set statusline+=%l:%v                    " line:column
set statusline+=\                        " space

augroup Statusline
  autocmd!
  autocmd VimEnter,ColorScheme * call statusline#update_highlight()
  autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter * call statusline#check_modified()
augroup END

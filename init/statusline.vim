set laststatus=2

set statusline=\                                 " space

set statusline+=%1*                              " User1 highlight group (filename)
set statusline+=%{statusline#bufname()}          " relative path
set statusline+=%*                               " reset highlight group
set statusline+=%{statusline#bufname_nc()}       " relative path (non-current)
set statusline+=\                                " space

set statusline+=%#StatusLineNC#                  " StatusLineNC highlight group
set statusline+=%{statusline#before_filetype()}  " dimmed '['
set statusline+=%2*                              " User2 highlight group (filetype)
set statusline+=%{statusline#filetype()}         " filetype (current)
set statusline+=%*                               " reset highlight group
set statusline+=%{statusline#filetype_nc()}      " filetype (non-current)
set statusline+=%#StatusLineNC#                  " StatusLineNC highlight group
set statusline+=%{statusline#after_filetype()}   " dimmed ']'
set statusline+=%*                               " reset highlight group
set statusline+=\                                " space

set statusline+=%w                               " preview
set statusline+=%M                               " modified

set statusline+=%=                               " left/right separator

set statusline+=%{toupper(&fenc)}                " encoding
set statusline+=%(\ \ %{statusline#branch()}%)   " branch
set statusline+=\ \                              " spaces

set statusline+=%l:                              " line:
set statusline+=%#StatusLineNC#                  " dim
set statusline+=%v                               " column
set statusline+=%*                               " reset highlight group
set statusline+=\                                " space

augroup Statusline
  autocmd!
  autocmd VimEnter,ColorScheme * call statusline#update_highlight()
  autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter * call statusline#check_modified()
augroup END

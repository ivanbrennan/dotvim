set laststatus=2

set statusline=\    " space

set statusline+=%(%1*%{statusline#bufname()}%*%{statusline#bufname_nc()}\ %)
" %(                          start item group
" %1*                         User1 highlight group (filename)
" %{statusline#bufname()}     relative path
" %*                          reset highlight group
" %{statusline#bufname_nc()}  relative path (non-current)
" \                           space
" %)                          end item group

set statusline+=%w  " preview

set statusline+=%(%2*%{statusline#before_filetype()}%3*%{statusline#filetype()}%*%{statusline#filetype_nc()}%2*%{statusline#after_filetype()}%*\ %)
" %(                               start item group
" %2*                              User2 highlight group (filetype delimiter)
" %{statusline#before_filetype()}  dimmed '[' if filetype set
" %3*                              User3 highlight group (filetype)
" %{statusline#filetype()}         filetype
" %*                               reset highlight group
" %{statusline#filetype_nc()}      filetype (non-current)
" %2*                              User2 highlight group (filetype delimiter)
" %{statusline#after_filetype()}   dimmed ']' if filetype set
" \                                space
" %)                               end item group

set statusline+=%M                             " modified
set statusline+=%=                             " left/right separator
set statusline+=%{toupper(&fenc)}              " encoding
set statusline+=%(\ \ %{statusline#branch()}%)
set statusline+=\ \                            " spaces
set statusline+=%l:                            " line:
set statusline+=%#StatusLineNC#                " dim
set statusline+=%v                             " column
set statusline+=%*                             " reset highlight group
set statusline+=\                              " space

augroup Statusline
  autocmd!
  autocmd VimEnter,ColorScheme * call statusline#update_highlight()
  autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter * call statusline#check_modified()
augroup END

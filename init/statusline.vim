setg statusline=\                                 " space

setg statusline+=%1*                              " User1 highlight group (filename)
setg statusline+=%{statusline#bufname()}          " relative path
setg statusline+=%*                               " reset highlight group
setg statusline+=%{statusline#bufname_nc()}       " relative path (non-current)
setg statusline+=\                                " space

setg statusline+=%#StatusLineNC#                  " StatusLineNC highlight group
setg statusline+=%{statusline#before_filetype()}  " dimmed '['
setg statusline+=%2*                              " User2 highlight group (filetype)
setg statusline+=%{statusline#filetype()}         " filetype (current)
setg statusline+=%*                               " reset highlight group
setg statusline+=%{statusline#filetype_nc()}      " filetype (non-current)
setg statusline+=%#StatusLineNC#                  " StatusLineNC highlight group
setg statusline+=%{statusline#after_filetype()}   " dimmed ']'
setg statusline+=%*                               " reset highlight group
setg statusline+=\                                " space

setg statusline+=%w                               " preview
setg statusline+=%M                               " modified

setg statusline+=%=                               " separator

setg statusline+=\                                " space
setg statusline+=%{toupper(&fenc)}                " encoding
setg statusline+=%(\ \ %{statusline#branch()}%)   " branch
setg statusline+=\ \                              " spaces

setg statusline+=%l:                              " line:
setg statusline+=%#StatusLineNC#                  " dim
setg statusline+=%v                               " column
setg statusline+=%*                               " reset highlight group
setg statusline+=\                                " space

augroup Statusline
  autocmd!
  autocmd VimEnter,ColorScheme * call statusline#update_highlight()
  autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter * call statusline#check_modified()
augroup END

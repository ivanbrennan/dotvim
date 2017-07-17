" vimrc
augroup VimrcGroup
  autocmd!
  autocmd BufWritePost $MYVIMRC,vimrc.local  source $MYVIMRC
  autocmd BufWritePost ~/*{.,}vim/init/*.vim source $MYVIMRC |
        \ call statusline#update_highlight()
augroup END

" git
augroup GitGroup
  autocmd!
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

" preview
augroup Preview
  autocmd!
  autocmd BufWinEnter * if &previewwindow | nnoremap <nowait><buffer> q <C-W>q| endif
augroup END

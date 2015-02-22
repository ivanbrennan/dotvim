" vimrc
augroup VimrcGroup
  autocmd!
  autocmd VimResized * :wincmd =
  autocmd BufWritePost $MYVIMRC,vimrc.local  source $MYVIMRC | :call RefreshUI()
  autocmd BufWritePost ~/*{.,}vim/init/*.vim source $MYVIMRC | :call RefreshUI()
augroup END

" git
augroup GitGroup
  autocmd!
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

" markdown
augroup MarkdownGroup
  autocmd!
  autocmd Bufread,BufNewFile *.md set filetype=markdown
augroup END


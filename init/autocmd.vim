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

" haskell
augroup HaskellIntero
  autocmd!
  au FileType haskell nnoremap K :InteroType<CR>
  autocmd BufWritePost *.hs InteroReload
augroup END

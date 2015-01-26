" vimrc
augroup VimrcGroup
  autocmd!
  autocmd BufWritePost $MYVIMRC,vimrc.local  source $MYVIMRC
  autocmd BufWritePost ~/*{.,}vim/init/*.vim source $MYVIMRC
augroup END

" git
augroup GitGroup
  autocmd!
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

" ruby
augroup RubyGroup
  autocmd!
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby set foldlevel=99
  autocmd FileType ruby,eruby let ruby_operators=1
  autocmd FileType ruby,eruby syn match parens /[(){}\[\]]/
  autocmd FileType ruby,eruby hi def link parens Delimiter
  " complete buffer loading can cause code execution
  " turn this off if it's a concern
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby :inoreabbrev <buffer> erb <% %><C-O>F<Space>
  autocmd FileType ruby,eruby :inoreabbrev <buffer> erp <%= %><C-O>F<Space>
  autocmd FileType ruby,eruby :inoreabbrev <buffer> erc <%# %><C-O>F<Space>
augroup END

" markdown
augroup MarkdownGroup
  autocmd!
  autocmd Bufread,BufNewFile *.md set filetype=markdown
augroup END


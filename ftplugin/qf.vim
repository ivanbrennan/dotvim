let b:is_quickfix = empty(getloclist(0))

if b:is_quickfix
  nnoremap <buffer><silent> q :cclose<CR>
else
  nnoremap <buffer><silent> q :lclose<CR>
endif

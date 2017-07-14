if expand('%:p') =~# '^fugitive:[\\/][\\/]'
  nnoremap <buffer> <silent> q  :<C-U>bdelete<CR>
endif

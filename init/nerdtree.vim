let g:NERDTreeCreatePrefix='silent keepalt keepjumps'
let g:NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=1

augroup IvanNERDTree
  autocmd!
  autocmd User NERDTreeInit call autocmds#attempt_select_last_file()
augroup END

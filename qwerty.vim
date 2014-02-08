" ::::::::: qwertyrc ::::::::::::::::::::::::::::::::::

" leaders
map <Space> <Leader>
let maplocalleader=','

" ::::::::: Mappings ::::::::::::::::::::::

function! QWERTYMaps() " {{{1
  " ··········· modes ····················
  " enter command mode
  noremap  ; :
  noremap q; q:

  " exit insert mode
  inoremap    kj <Esc>`^
  inoremap    jk <Esc>`^

  " ··········· splits & tabs ············
  " navigate
  noremap <C-J> <C-W>j
  noremap <C-K> <C-W>k
  noremap <C-H> <C-W>h
  noremap <C-L> <C-W>l

  " rearrange
  noremap <C-W><C-J> <C-W>J
  noremap <C-W><C-K> <C-W>K
  noremap <C-W><C-H> <C-W>H
  noremap <C-W><C-L> <C-W>L

  " tabs
  noremap <Leader>9 :tabprevious<CR>
  noremap <Leader>0 :tabnext<CR>

  echo "QWERTY mappings enabled"
endfunction

function! QWERTYUnmaps() " {{{1
  " ··········· modes ····················
  " enter command mode
  unmap  ;
  unmap q;

  " exit insert mode
  iunmap    kj
  iunmap    jk

  " ··········· splits & tabs ············
  " navigate
  unmap <C-J>
  unmap <C-K>
  unmap <C-H>
  unmap <C-L>

  " rearrange
  unmap <C-W><C-J>
  unmap <C-W><C-K>
  unmap <C-W><C-H>
  unmap <C-W><C-L>

  " tabs
  unmap <Leader>9
  unmap <Leader>0

endfunction

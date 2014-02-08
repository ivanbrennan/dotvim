" ::::::::: workvan :::::::::::::::::::::::::::::::::::

" leaders
map <Space> <Leader>
let maplocalleader=','

" ::::::::: Mappings ::::::::::::::::::::::

function! WorkVanMaps() " {{{1
  " (E)xit insert mode
  inoremap <C-E> <Esc>`^
  inoremap <C-K> <C-E>

  "(O)pen line -> (L)ine
  noremap l o
  noremap o l
  noremap L O
  noremap O L
  "Search (N)ext -> (J)ump
  noremap j n
  noremap n j
  noremap J N
  noremap N J
  "(E)nd of word -> brea(K) of word
  noremap k e
  noremap e k
  noremap K E
  noremap E K
  "(Y)ank -> (H)aul
  noremap h y
  noremap y h
  noremap H Y
  noremap Y H

  " navigate
  noremap <C-O> <C-W>l
  noremap <C-L> <C-O>
  noremap <C-N> <C-W>j
  noremap <C-J> <C-N>
  noremap <C-E> <C-W>k
  noremap <C-K> <C-E>
  noremap <C-Y> <C-W>h
  noremap <C-H> <C-Y>

  " tabs
  noremap <Leader>( :tabprevious<CR>
  noremap <Leader>) :tabnext<CR>

  echo "WorkVan mappings enabled"
endfunction

function! WorkVanUnmaps() " {{{1
  " (E)xit insert mode
  iunmap <C-E>
  iunmap <C-K>

  "(O)pen line -> (L)ine
  unmap l
  unmap o
  unmap L
  unmap O
  "Search (N)ext -> (J)ump
  unmap j
  unmap n
  unmap J
  unmap N
  "(E)nd of word -> brea(K) of word
  unmap k
  unmap e
  unmap K
  unmap E
  "(Y)ank -> (H)aul
  unmap h
  unmap y
  unmap H
  unmap Y

  " navigate
  unmap <C-O>
  unmap <C-L>
  unmap <C-N>
  unmap <C-J>
  unmap <C-E>
  unmap <C-K>
  unmap <C-Y>
  unmap <C-H>

  " tabs
  unmap <Leader>(
  unmap <Leader>)

endfunction

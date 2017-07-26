setl iskeyword-=#

nmap <buffer><silent>     <Plug>(ArticulateTag)  :tag     <C-R>=Vimcword()<CR><CR>
xmap <buffer><silent>     <Plug>(ArticulateTag)  :tag     <C-R>=Vimcword()<CR><CR>
nmap <buffer><silent>   <Plug>(ArticulateTjump)  :tjump   <C-R>=Vimcword()<CR><CR>
xmap <buffer><silent>   <Plug>(ArticulateTjump)  :tjump   <C-R>=Vimcword()<CR><CR>
nmap <buffer><silent> <Plug>(ArticulateTselect)  :tselect <C-R>=Vimcword()<CR><CR>
xmap <buffer><silent> <Plug>(ArticulateTselect)  :tselect <C-R>=Vimcword()<CR><CR>

func! Vimcword()
  let l:orig=&l:iskeyword
  setlocal iskeyword+=#

  let l:cword=expand('<cword>')

  let &l:iskeyword=l:orig
  return l:cword
endf

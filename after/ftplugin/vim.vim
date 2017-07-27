setl iskeyword-=#

nmap <buffer><silent> <Plug>(ArticulateTag)   :<C-U>exe v:count1."tag <C-R>=Vimcword()<CR>"<CR>
nmap <buffer><silent> <Plug>(ArticulateTjump) :<C-U>tjump <C-R>=Vimcword()<CR><CR>

func! Vimcword()
  let l:orig=&l:iskeyword
  setlocal iskeyword+=#

  let l:cword=expand('<cword>')

  let &l:iskeyword=l:orig
  return l:cword
endf

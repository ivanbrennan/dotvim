setl iskeyword-=#

nmap <buffer><silent> <Plug>(ArticulateTag)   :<C-U>exe v:count1."tag <C-R>=<SID>vimcword()<CR>"<CR>
nmap <buffer><silent> <Plug>(ArticulateTjump) :<C-U>tjump <C-R>=<SID>vimcword()<CR><CR>

func! s:vimcword()
  let l:orig=&l:iskeyword
  setlocal iskeyword+=#

  let l:cword=expand('<cword>')

  let &l:iskeyword=l:orig
  return l:cword
endf

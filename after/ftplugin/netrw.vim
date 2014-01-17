" easy file/dir selection
nmap <buffer> f <CR>
" refresh listing
nmap <buffer> <LocalLeader>l iiii
" set treetop to selected dir
nnoremap <silent> <buffer> <LocalLeader>t :call <SID>SetRoot()<CR>
" preview
nmap <buffer> p <CR>1<C-W>w

function! s:SetRoot()
  if match(bufname('%'), 'NetrwTreeListing') >= 0
    execute 'Ntree'
  else
    execute 'cd ' . fnameescape(expand('%'))
  endif
endfunc

setl foldmethod=indent
set cscopeprg=hscope
set cscopetag
" set csto=1 " search codex tags first

nmap <buffer><silent> <Plug>(ArticulateTag) :<C-U>cstag <C-R>=expand('<cword>')<CR><CR>

if exists(':InteroType')
  nnoremap K :InteroType<CR>
endif
if exists(':InteroKill')
  nnoremap gK :InteroKill<CR>
endif

func! LoadHscope()
  let db = findfile("hscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/hscope.out$"))
    exe "cs add " . db . " " . path
  endif
endfunction

augroup Hscope
  autocmd!
  autocmd BufEnter /*.hs call LoadHscope()
augroup END

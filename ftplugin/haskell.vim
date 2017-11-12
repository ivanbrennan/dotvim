setl foldmethod=indent
set cscopeprg=hscope
" set csto=1 " search codex tags first

nmap <buffer><silent> <Plug>(ArticulateTag) :<C-U>cstag <C-R>=expand('<cword>')<CR><CR>

if exists(':InteroType')
  nnoremap K :InteroType<CR>
endif
if exists(':InteroKill')
  nnoremap gK :InteroKill<CR>
endif

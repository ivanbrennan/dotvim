" CtrlP & Ag
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'max:18'

if executable('ag')
  let g:aghighlight = 1
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif


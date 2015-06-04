" CtrlP
let g:ctrlp_map             = '<Leader>o'
nnoremap   <Leader>p        :CtrlPBuffer<CR>
nnoremap   <Leader>i        :CtrlPQuickfix<CR>
nnoremap   <Leader>y        :CtrlPTag<CR>
nnoremap   <Leader>u        :CtrlPMRU<CR>
let g:ctrlp_match_window    = 'max:18'
let g:ctrlp_by_filename     = 1
let g:ctrlp_open_new_file   = 'r'
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<C-_>'] }
let g:ctrlp_extensions      = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                             \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

" Ag
if executable('ag')
  let g:aghighlight        = 1
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


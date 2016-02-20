" CtrlP
let g:ctrlp_map             = '<Leader>o'
nnoremap   <Leader>b        :CtrlPBuffer<CR>
nnoremap   <Leader>k        :CtrlPQuickfix<CR>
nnoremap   <Leader>m        :CtrlPMRU<CR>
let g:ctrlp_by_filename     = 1
let g:ctrlp_extensions      = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                             \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_match_window    = 'max:18'
let g:ctrlp_open_new_file   = 'r'
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<C-_>'] }
let g:ctrlp_switch_buffer   = 'e'

" Ag
if executable('ag')
  let g:ag_highlight       = 1
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


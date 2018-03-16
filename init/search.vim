" CtrlP
let g:ctrlp_map             = '<Leader>O'
nnoremap   <Leader>L        :CtrlPBuffer<CR>
nnoremap   <Leader>bk       :CtrlPQuickfix<CR>
nnoremap   <Leader>bm       :CtrlPMRU<CR>
let g:ctrlp_by_filename     = 1
let g:ctrlp_extensions      = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                             \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_match_window    = 'max:18'
let g:ctrlp_open_new_file   = 'r'
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<C-_>'] }
let g:ctrlp_switch_buffer   = 'e'

" Grepper/Ag
let g:grepper = { 'highlight': 1, 'next_tool': '<Leader><Bslash>' }
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .yardoc
        \ --ignore .github
        \ --ignore .bundle
        \ --ignore .DS_Store
        \ --ignore public
        \ --ignore images
        \ --ignore system
        \ --ignore data
        \ --ignore log
        \ --ignore vcr_cassettes
        \ --ignore "*.pyc"
        \ --ignore "*.exe"
        \ --ignore "*.so"
        \ --ignore "*.dll"
        \ --ignore "*.dat"'
endif

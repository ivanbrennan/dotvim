" CtrlP
let g:ctrlp_map             = '<Leader>o'
nnoremap   <Leader>b        :CtrlPBuffer<CR>
nnoremap   <Leader>bk       :CtrlPQuickfix<CR>
nnoremap   <Leader>bm       :CtrlPMRU<CR>
let g:ctrlp_by_filename     = 1
let g:ctrlp_extensions      = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                             \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_match_window    = 'max:18'
let g:ctrlp_open_new_file   = 'r'
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<C-_>'] }
let g:ctrlp_switch_buffer   = 'e'
let g:ctrlp_custom_ignore   = {
  \ 'dir':  '\v((\.(git|hg|svn|yardoc|github|bundle))|(public|images|system|data|log|tmp))$',
  \ 'file': '\v\.(exe|so|dll|dat)$'
  \ }

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
        \ --ignore "**/*.pyc"'
endif

" Loupe
let g:LoupeCenterResults = 0

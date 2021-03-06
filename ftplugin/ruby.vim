setl omnifunc=rubycomplete#Complete
setl foldmethod=indent
setl foldlevel=99

" complete buffer loading can cause code execution
" turn this off if it's a concern
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails = 1

let ruby_operators=1
syn match parens /[(){}\[\]]/
hi def link parens Delimiter

inoreabbrev <buffer> erb <% %><C-O>F<Space>
inoreabbrev <buffer> erp <%= %><C-O>F<Space>
inoreabbrev <buffer> erc <%# %><C-O>F<Space>

noremap <buffer><silent> <leader>R   :w !ruby<CR>

" realign
nmap <buffer>               co.  <Plug>(realign_toggle_electric_dot)
imap <buffer><silent>     <M-.>  <Plug>(realign_toggle_electric_dot)
nmap <buffer><silent> <leader>=  <Plug>(realign_method_chain)
xmap <buffer><silent> <leader>=  <Plug>(realign_method_chain)
imap <buffer><silent>     <M-=>  <Plug>(realign_method_chain)

" vim-ruby provides a command-line mapping for <Plug><cword> that
" intelligently identifies the current Ruby cursor identifier.
nmap <buffer><silent> <Plug>(ArticulateTag)   :<C-U>exe v:count1 "tag <Plug><cword>"<CR>
nmap <buffer><silent> <Plug>(ArticulateTjump) :<C-U>tjump <Plug><cword><CR>

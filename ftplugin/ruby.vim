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

" somehow, <C-R><C-W> correctly recognizes trailing ! and ? at the end of
" method names, despite those characters not being included in 'iskeyword'
nmap <buffer><silent>     <Plug>(ArticulateTag)  :tag     <C-R><C-W><CR>
xmap <buffer><silent>     <Plug>(ArticulateTag)  :tag     <C-R><C-W><CR>
nmap <buffer><silent>   <Plug>(ArticulateTjump)  :tjump   <C-R><C-W><CR>
xmap <buffer><silent>   <Plug>(ArticulateTjump)  :tjump   <C-R><C-W><CR>
nmap <buffer><silent> <Plug>(ArticulateTselect)  :tselect <C-R><C-W><CR>
xmap <buffer><silent> <Plug>(ArticulateTselect)  :tselect <C-R><C-W><CR>

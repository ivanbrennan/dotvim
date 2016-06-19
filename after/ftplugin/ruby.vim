set omnifunc=rubycomplete#Complete
set foldlevel=99

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

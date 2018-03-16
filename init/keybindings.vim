" a little emacs
inoremap <expr> <C-A> encoding#first_nonblankp(getline('.'), col('.')) ? "\<Home>" : "\<Esc>I"
inoremap <expr> <C-T> transposition#transpose('i')

" Ag
nnoremap <leader>a :Grepper<CR>

" tag, pop
nmap <C-.> <Plug>(ArticulateTag)
xmap <C-.> <Plug>(ArticulateTag)
nmap <C-,> <Plug>(ArticulatePop)
xmap <C-,> <Plug>(ArticulatePop)
nmap g.    <Plug>(ArticulateTjump)
xmap g.    <Plug>(ArticulateTjump)

" ZoomWin
nmap <C-W>.    <Plug>ZoomWin
nmap <leader>. <Plug>ZoomWin

" ··········· display ········· {{{1
noremap <silent> <leader>[ :call SynHighlights(-1)<CR>

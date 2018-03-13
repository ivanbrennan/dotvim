" Dirvish
nmap <leader>u <Plug>(dirvish_up)

" EasyAlign
nmap     ga  <Plug>(EasyAlign)
xmap     ga  <Plug>(EasyAlign)
nnoremap gA  ga
xnoremap gA  ga

" commentary
xmap <leader>;  <Plug>Commentary
nmap <leader>;  <Plug>Commentary
omap <leader>;  <Plug>Commentary
nmap <leader>;; <Plug>CommentaryLine

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
nmap    <silent> <leader>` <Plug>(optcycle_colorscheme)
noremap <silent> <leader>[ :call SynHighlights(-1)<CR>

" folding
nmap    <silent> <leader>z <Plug>(optcycle_foldmethod)
nmap    <silent> <leader>Z <Plug>(optcycle_foldcolumn)

nmap    <silent> <leader>fn <Plug>(optcycle_number)
nmap    <silent> <leader>fc <Plug>(optcycle_colorcolumn)

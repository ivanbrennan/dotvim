" ::::::::: Keybindings :::::::::::::::::::

" ··········· config ·········· {{{1
" Use Space as mapleader, but visible as '\'
map <Space> <Leader>

" Timeout mappings fast and key codes faster
set timeout timeoutlen=250 ttimeoutlen=100

" source / edit vimrc
noremap <C-.>   :source  $MYVIMRC<CR>
noremap <C-,>   :tabedit $MYVIMRC<CR>
noremap <C-,>k  :tabedit ~/.vim/init/keybindings.vim<CR>
noremap <C-,>o  :tabedit ~/.vim/init/options<CR>

" ··········· buffers ········· {{{1
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

nmap    <Leader>ee       :edit %%
noremap <Leader>et       :tabedit 
noremap <Leader>e`       :edit ~/
noremap <Leader>ec       :edit ~/Development/code/

nmap    <Leader>ww       :write %%
vmap    <Leader>ww       :write %%
noremap <C-S-CR>         :write<CR>

noremap <Leader>dd       :bdelete<CR>
noremap <Leader>d3       :bdelete#<CR>

" Buffer list
noremap <S-Space>        :buffers<CR>
noremap <Leader>p        :CtrlPBuffer<CR>
noremap <M-Tab>          :bnext<CR>
noremap <M-S-Tab>        :bprevious<CR>
noremap <Leader>3        <C-^>

" Quickfix list
map     <C-Space>        <Plug>QuickfixToggle
noremap <C-S-Down>       :cnext<CR>
noremap <C-S-Up>         :cprevious<CR>

noremap <Leader>/        :pwd<CR>
noremap <Leader>l        :call ReLoadBuffers()<CR>
noremap <C-S-Space>      <C-Z>

" ··········· ex commands ····· {{{1
noremap  <Leader>:       :!
noremap  <Leader>;       :<Up>
nnoremap <Leader>h       :help 
nnoremap <Leader>x       :x

cnoremap <C-P>           <Up>
cnoremap <C-N>           <Down>
cnoremap <C-A>           <Home>
cnoremap <C-Left>        <S-Left>
cnoremap <C-Right>       <S-Right>

" ··········· editing ········· {{{1
" above / below current line
inoremap <S-CR>     <C-O>O
inoremap <C-CR>     <C-O>o
noremap  <S-CR>  mzO<Esc>j`z
noremap  <C-CR>  mzo<Esc>k`z

" clear current line
nnoremap <Leader><Space> S<Esc>

" clipboard
noremap  <Leader>'  "+
noremap  <Leader>4  g_

" auto-indent whole file
nnoremap <Leader>=  gg=G``

" commentary
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
omap <Leader>c  <Plug>Commentary
nmap <Leader>C  <Plug>CommentaryLine

" bubble text
nnoremap <silent> <C-Up>    mZ:move .-2<CR>==`Z
vnoremap          <C-Up>    :move '<-2<CR>gv=gv
inoremap          <C-Up>    <Esc>:move .-2<CR>==gi
nnoremap <silent> <C-Down>  mZ:move .+1<CR>==`Z
vnoremap          <C-Down>  :move '>+1<CR>gv=gv
inoremap          <C-Down>  <Esc>:move .+1<CR>==gi

vnoremap <C-Left>  <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
vnoremap <C-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o

" whole line completion
inoremap <C-L>  <C-X><C-L>

" tab
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-P>"
    endif
endfunction
inoremap <expr> <silent> <TAB>   InsertTabWrapper()

inoremap <S-TAB> <C-N>

" jump around
inoremap <C-B>   <C-O>b
inoremap JK      <C-O>A

" paste toggle
noremap  <silent> <Leader>jp  <F4>
set pastetoggle=<F4>

" toggle case
inoremap ~~      <Esc>viwg~gi

" ··········· navigation ······ {{{1
" sensible marks
noremap `  '
noremap '  `

" ··········· searching ······· {{{1
" find word under cursor
noremap <silent> <Leader>f :set foldenable!<CR>
      \:let view=winsaveview()<CR>#*
      \:call winrestview(view)<CR>:set foldenable!<CR>

" search
noremap <Leader>ag  :Ag! 

" toggle search highlighting
noremap <silent> <C-L> :nohlsearch<CR><C-L>
noremap <Leader>,n :set hlsearch! hlsearch?<CR>

" substitute
nnoremap <leader>s  :%s/
vnoremap <leader>s  :s/

" fix & to preserve flags
nnoremap &  :&&<CR>
xnoremap &  :&&<CR>

" ··········· splits & tabs ··· {{{1
" splits
noremap <Leader>,s  :split<CR>
noremap <Leader>,v  :vsplit<CR>
noremap  <Leader>q  :quit<CR>

"resize
noremap     <C-W>\  <C-W><Bar>
noremap <C-W><C-\>  <C-W><Bar>

" ··········· appearance ······ {{{1
nnoremap <Leader>w   :setlocal wrap! linebreak! list! wrap?<CR>

noremap <Leader>,b  :call ToggleBG()<CR>:echo &background<CR>

" info
noremap <Leader>,x  :call HexHighlight()<CR>
noremap <Leader>,y  :call SynStack()<CR>

" line numbers
noremap <Leader>n  :call NumberToggle()<CR>
noremap <Leader>r  :set relativenumber! relativenumber?<CR>

" folding
noremap   <expr> <Leader>,m FoldMethToggle()
noremap <silent> <Leader>,z :call FoldColToggle(4)<CR>

" cursor
nnoremap <silent> <C-->      :call CursorLineToggle()<CR>
vnoremap <silent> <C-->      :<C-U>call CursorLineToggle()<CR>gv
nnoremap <silent> <C-Bslash> :set cursorcolumn!<CR>
vnoremap <silent> <C-Bslash> :<C-U>set cursorcolumn!<CR>gv
nnoremap <silent> <Leader>8  :call ColorColToggle()<CR>
vnoremap <silent> <Leader>8  :<C-U>call ColorColToggle()<CR>gv

" ··········· testing ········· {{{1
nmap    <Leader>tt          <Plug>RunCurrentSpecFile
nmap    <Leader>t<Space>    <Plug>RunFocusedSpec
nmap    <Leader>tl          <Plug>RunMostRecentSpec
noremap <Leader>k           :VtrKillRunner<CR>

noremap <Leader>,tt         :call RunCurrentSpecFile()<CR>
noremap <Leader>,t<Space>   :call RunNearestSpec()<CR>
noremap <Leader>,tl         :call RunLastSpec()<CR>
noremap <Leader>,ta         :call RunAllSpecs()<CR>

" Fugitive
noremap <silent> <Leader>g  :Gblame<CR>

" ··········· rails ··········· {{{1
noremap <silent> <Leader>ap :A<CR>


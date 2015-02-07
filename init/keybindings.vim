" ::::::::: Keybindings :::::::::::::::::::

" ··········· config ·········· {{{1
" Use Space as mapleader, visible as '\'
map <Space> <Leader>

" Timeout mappings fast and key codes faster
set timeout timeoutlen=250 ttimeoutlen=100

" source / edit vimrc
noremap <silent> <C-.>      :source  $MYVIMRC<CR>:call RefreshUI()<CR>
noremap          <C-,>      :tabedit $MYVIMRC<CR>
noremap          <C-,>k     :tabedit ~/.vim/init/keybindings.vim<CR>
noremap          <C-,><C-K> :tabedit ~/.vim/init/keybindings.vim<CR>
noremap          <C-,>o     :tabedit ~/.vim/init/options<CR>
noremap          <C-,><C-O> :tabedit ~/.vim/init/options<CR>

" ··········· buffers ········· {{{1
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

nmap     <Leader>e        :edit 
nmap     <Leader>ee       :edit %%
noremap  <Leader>et       :tabedit 
noremap  <Leader>e`       :edit ~/
noremap  <Leader>ec       :edit ~/Development/code/

nnoremap <Leader>w       :write
vnoremap <Leader>w       :write
nmap     <Leader>ww      :write %%
vmap     <Leader>ww      :write %%

noremap  <Leader>dd      :bdelete<CR>
noremap  <Leader>d3      :bdelete#<CR>

" Buffer list
noremap  <C-S-Space>     :buffers<CR>
noremap  <Leader>p       :CtrlPBuffer<CR>
noremap  <M-Tab>         :bnext<CR>
noremap  <M-S-Tab>       :bprevious<CR>
noremap  <Leader>3       <C-^>

" Quickfix list
map      <C-Space>       <Plug>QfxListical
map      <S-Space>       <Plug>LocListical
noremap  <C-J>           :cnext<CR>
noremap  <C-K>           :cprevious<CR>
noremap  <M-J>           :lnext<CR>
noremap  <M-K>           :lprevious<CR>

noremap  <Leader><Space> :pwd<CR>
noremap  <Leader>1       :call ReLoadBuffers()<CR>
noremap  <Leader><Tab>   <C-Z>

" ··········· ex commands ····· {{{1
noremap  <Leader>:       :!
noremap  <Leader>;       :<Up>
nnoremap <C-H>           :help 
nnoremap <Leader>x       :x

cnoremap <C-P>           <Up>
cnoremap <C-N>           <Down>
cnoremap <C-A>           <Home>
cnoremap <C-Left>        <S-Left>
cnoremap <C-Right>       <S-Right>

" ··········· positioning ····· {{{1
" auto-indent whole file
nnoremap <Leader>= gg=G``

" push newline
noremap  <S-CR>    mzO<Esc>j`z
noremap  <C-CR>    mzo<Esc>k`z

" bubble text
nnoremap <silent> <C-Up>    mZ:move .-2<CR>==`Z
vnoremap          <C-Up>    :move '<-2<CR>gv=gv
inoremap          <C-Up>    <Esc>:move .-2<CR>==gi
nnoremap <silent> <C-Down>  mZ:move .+1<CR>==`Z
vnoremap          <C-Down>  :move '>+1<CR>gv=gv
inoremap          <C-Down>  <Esc>:move .+1<CR>==gi
vnoremap          <C-Left>  <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
vnoremap          <C-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o

" ··········· editing ········· {{{1
" line completion
inoremap <C-L>      <C-X><C-L>

" spawn newline
inoremap <S-CR>     <C-O>O
inoremap <C-CR>     <C-O>o

" clear line
nnoremap <Leader>L  S<Esc>

" paste toggle
noremap  <silent> <Leader>P <F4>
set pastetoggle=<F4>

" clipboard
noremap  <Leader>c  "+
noremap  <Leader>C  "+yg_

" commentary
xmap     <Leader>m  <Plug>Commentary
nmap     <Leader>m  <Plug>Commentary
omap     <Leader>m  <Plug>Commentary
nmap     <Leader>M  <Plug>CommentaryLine

" jump around insert mode
inoremap <C-B>      <C-O>b
inoremap JK         <C-O>A

" toggle case
inoremap ~~         <Esc>viwg~gi

" ··········· search ·········· {{{1
" sensible marks
noremap  `  '
noremap  '  `

" last search
noremap  <Leader>/  /<Up>
noremap  <Leader>?  ?<Up>

" substitute
nnoremap <leader>s  :%s/
vnoremap <leader>s  :s/

" preserve flags
nnoremap &  :&&<CR>
xnoremap &  :&&<CR>

" Ag
noremap  <Leader>a  :Ag! 

" word under cursor
noremap <silent> <Leader>8 :set foldenable!<CR>
      \:let view=winsaveview()<CR>#*
      \:call winrestview(view)<CR>:set foldenable!<CR>

" toggle search highlighting
noremap <silent> <C-L>     :nohlsearch<CR><C-L>
noremap          <Leader>l :set hlsearch! hlsearch?<CR>

" ··········· splits ·········· {{{1
noremap  <C-W>\     <C-W><Bar>
noremap  <C-W><C-\> <C-W><Bar>
nnoremap <Leader>q  <C-W>q

" ··········· display ········· {{{1
nnoremap <Leader>,w  :setlocal wrap! linebreak! list! wrap?<CR>
noremap  <Leader>,b :call ToggleBG()<CR>:echo &background<CR>

noremap  <Leader>,x :call HexHighlight()<CR>
noremap  <Leader>,y :call SynStack()<CR>

" line numbers
noremap  <Leader>n  :call NumberToggle()<CR>
noremap  <Leader>r  :set relativenumber! relativenumber?<CR>

" folding
noremap  <expr>   <Leader>z  FoldMethToggle()
noremap  <silent> <Leader>,z :call FoldColToggle(4)<CR>

" cursor
nnoremap <silent> <C-_>      :call CursorLineToggle()<CR>
vnoremap <silent> <C-_>      :<C-U>call CursorLineToggle()<CR>gv
nnoremap <silent> <C-Bslash> :set cursorcolumn!<CR>
vnoremap <silent> <C-Bslash> :<C-U>set cursorcolumn!<CR>gv
nnoremap <silent> <Leader>0  :call ColorColToggle()<CR>
vnoremap <silent> <Leader>0  :<C-U>call ColorColToggle()<CR>gv

" ··········· tags ············ {{{1
nnoremap <F5> :!ctags -R<CR>

" ··········· testing ········· {{{1
nmap     <Leader>t           <Plug>RunFocusedSpec
nmap     <Leader>T           <Plug>RunCurrentSpecFile
nmap     <Leader>,r          <Plug>RunMostRecentSpec
noremap  <Leader><CR>        :VtrKillRunner<CR>

" noremap <Leader>,tt         :call RunCurrentSpecFile()<CR>
" noremap <Leader>,t<Space>   :call RunNearestSpec()<CR>
" noremap <Leader>,tl         :call RunLastSpec()<CR>
" noremap <Leader>,ta         :call RunAllSpecs()<CR>

" ··········· git ············· {{{1
noremap <silent> <Leader>b  :Gblame<CR>

" ··········· rails ··········· {{{1
noremap <silent> <Leader>R  :A<CR>


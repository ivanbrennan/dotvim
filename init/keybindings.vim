" ::::::::: Keybindings :::::::::::::::::::

" ··········· config ·········· {{{1
" Use Space as mapleader, visible as '\'
map <Space> <Leader>

" Timeout mappings fast and key codes faster
set timeout timeoutlen=250 ttimeoutlen=100

" source / edit vimrc
nnoremap <silent> <C-.>      :source  $MYVIMRC<CR>:call RefreshUI()<CR>
nnoremap          <C-,>      :tabedit $MYVIMRC<CR>
nnoremap          <C-,>k     :tabedit ~/.vim/init/keybindings.vim<CR>
nnoremap          <C-,><C-K> :tabedit ~/.vim/init/keybindings.vim<CR>
nnoremap          <C-,>o     :tabedit ~/.vim/init/options.vim<CR>
nnoremap          <C-,><C-O> :tabedit ~/.vim/init/options.vim<CR>
nnoremap          <C-,>f     :tabedit ~/.vim/init/functions.vim<CR>
nnoremap          <C-,><C-F> :tabedit ~/.vim/init/functions.vim<CR>

" ··········· buffers ········· {{{1
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

nmap     <Leader>e        :edit 
nmap     <Leader>ee       :edit %%
noremap  <Leader>et       :tabedit 
noremap  <Leader>e`       :edit ~/
noremap  <Leader>ed       :edit ~/Development/code/

nnoremap <Leader>w       :write
vnoremap <Leader>w       :write
nmap     <Leader>ww      :write %%
vmap     <Leader>ww      :write %%
nnoremap <Leader>wq      :wq 

noremap  <Leader>dd      :bdelete<CR>
noremap  <Leader>d3      :bdelete#<CR>

" Buffer list
noremap  <S-Space>       :buffers<CR>
noremap  <Leader>p       :CtrlPBuffer<CR>
noremap  <M-Tab>         :bnext<CR>
noremap  <M-S-Tab>       :bprevious<CR>
noremap  <Leader>l       <C-^>

" Quickfix list
map      <C-Space>       <Plug>QfxListical
noremap  <C-Down>        :cnext<CR>
noremap  <C-Up>          :cprevious<CR>
nnoremap <C-Left>        :colder<CR>
nnoremap <C-Right>       :cnewer<CR>

" Location List
map      <C-S-Space>     <Plug>LocListical
noremap  <S-Down>        :lnext<CR>
noremap  <S-Up>          :lprevious<CR>
nnoremap <S-Left>        :lolder<CR>
nnoremap <S-Right>       :lnewer<CR>

noremap  <Leader><Space> :pwd<CR>
noremap  <Leader>.       :call ReLoadBuffers()<CR>
noremap  <Leader>b       <C-Z>

" Vinegar
nnoremap - -
nmap     <Leader>-       <Plug>VinegarUp

" ··········· ex commands ····· {{{1
noremap  <Leader>1       :!
noremap  <Leader>:       :<Up>
nnoremap <Leader>H       :help 

cnoremap <C-P>           <Up>
cnoremap <C-N>           <Down>
cnoremap <C-A>           <Home>

" ··········· positioning ····· {{{1
" auto-indent whole file
nnoremap <Leader>= gg=G``

" push newline
nnoremap <S-CR>   mzO<Esc>j`z
nnoremap <C-CR>   mzo<Esc>k`z

" bubble text
nnoremap <silent> <C-S-Up>    mZ:move .-2<CR>==`Z
vnoremap          <C-S-Up>    :move '<-2<CR>gv=gv
inoremap          <C-S-Up>    <Esc>:move .-2<CR>==gi
nnoremap <silent> <C-S-Down>  mZ:move .+1<CR>==`Z
vnoremap          <C-S-Down>  :move '>+1<CR>gv=gv
inoremap          <C-S-Down>  <Esc>:move .+1<CR>==gi
vnoremap          <C-S-Left>  <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
vnoremap          <C-S-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o

" ··········· editing ········· {{{1
" spawn newline
inoremap <S-CR>     <C-O>O
inoremap <C-CR>     <C-O>o

" clear line
nnoremap <Leader>L  S<Esc>

" paste toggle
noremap  <silent> <Leader>P <F8>
set pastetoggle=<F8>

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
inoremap KJ         <C-O>I

" toggle case
inoremap ~~         <Esc>viwg~gi

" ··········· autocompletion ·· {{{1

inoremap <Tab>      <C-R>=CleverTab()<CR>
inoremap <C-L>      <C-X><C-L>
inoremap <C-]>      <C-X><C-]>

" ··········· search ·········· {{{1
" sensible marks
noremap  `  '
noremap  '  `

" matchit
map      <Leader>o  %

" last search
noremap  <Leader>/  /<Up>
noremap  <Leader>?  ?<Up>

" substitute
nnoremap <Leader>s  :%s/
vnoremap <Leader>s  :s/

" preserve flags
nnoremap &  :&&<CR>
xnoremap &  :&&<CR>

" Ag
noremap  <Leader>a  :Ag! 
noremap  <Leader>A  :LAg! 

" word under cursor
noremap <silent> <Leader>8 :set foldenable!<CR>
      \:let view=winsaveview()<CR>#*
      \:call winrestview(view)<CR>:set foldenable!<CR>

" toggle search highlighting
noremap <silent> <C-L>      :nohlsearch<CR><C-L>
noremap          <C-L><C-L> :set hlsearch! hlsearch?<CR>

" ··········· splits ·········· {{{1
nmap              <Leader>h  <Plug>ZoomWin
noremap           <C-W>\     <C-W><Bar>
noremap           <C-W><C-\> <C-W><Bar>
noremap  <silent> <C-W>n     :vnew<CR>
noremap  <silent> <C-W><C-N> :vnew<CR>
nnoremap          <Leader>q  <C-W>q

" ··········· display ········· {{{1
nnoremap <Leader>,w  :setlocal wrap! linebreak! list! wrap?<CR>
noremap  <silent> <Leader>,m :call ToggleColorscheme()<CR>

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
nnoremap <silent> <Leader>]  :call ColorColToggle()<CR>
vnoremap <silent> <Leader>]  :<C-U>call ColorColToggle()<CR>gv

" ··········· tags ············ {{{1
nnoremap <F5> :!ctags -R<CR>

" ··········· testing ········· {{{1
nmap     <Leader>t           <Plug>RunFocusedSpec
nmap     <Leader>T           <Plug>RunCurrentSpecFile
nmap     <Leader>,t          <Plug>RunMostRecentSpec
noremap  <silent> <Leader>;  :VtrFocusRunner<CR>
noremap  <silent> <Leader>'  :VtrKillRunner<CR>
nnoremap <silent> <Leader>`  :call Spatch()<CR>

" ··········· git ············· {{{1
noremap <silent> <Leader>gb  :Gblame<CR>

" ··········· rails ··········· {{{1
nnoremap <silent> <Leader>R  :A<CR>
nnoremap          <Leader>E  :Eschema 
nnoremap          <Leader>es :Espec 
nnoremap          <Leader>ec :Econtroller 
nnoremap          <Leader>em :Emodel 
nnoremap          <Leader>ev :Eview 
nnoremap          <Leader>eh :Ehelper 


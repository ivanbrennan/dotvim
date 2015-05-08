" ::::::::: Keybindings :::::::::::::::::::

" ··········· config ·········· {{{1
" Use Space as mapleader, visible as '\'
map <Space> <Leader>

" Timeout mappings fast and key codes faster
set timeout timeoutlen=300 ttimeoutlen=100

" source / edit vimrc
nnoremap <silent> <C-.>      :source $MYVIMRC \| call RefreshUI()<CR>
nnoremap          <C-,>      :edit   $MYVIMRC<CR>
nnoremap          <C-,>f     :edit   ~/.vim/init/functions.vim<CR>
nnoremap          <C-,><C-F> :edit   ~/.vim/init/functions.vim<CR>
nnoremap          <C-,>k     :edit   ~/.vim/init/keybindings.vim<CR>
nnoremap          <C-,><C-K> :edit   ~/.vim/init/keybindings.vim<CR>
nnoremap          <C-,>o     :edit   ~/.vim/init/options.vim<CR>
nnoremap          <C-,><C-O> :edit   ~/.vim/init/options.vim<CR>
nnoremap          <C-,>w     :edit   ~/.vim/init/wild.vim<CR>
nnoremap          <C-,><C-W> :edit   ~/.vim/init/wild.vim<CR>

" ··········· buffers ········· {{{1
cnoremap <expr>   %%      getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

nmap <silent> <Leader>-   :tabedit %%<cr>

nnoremap <Leader>e        :edit 
nmap     <Leader>ee       :edit %%
nnoremap <Leader>et       :tabedit 
nnoremap <Leader>eh       :edit ~/

nnoremap <Leader>w        :write 
vnoremap <Leader>w        :write 
nmap     <Leader>ww       :write %%
vmap     <Leader>ww       :write %%
nnoremap <Leader>wq       :wq 

nnoremap  <Leader>dd      :bdelete<CR>
nnoremap  <Leader>dl      :bdelete#<CR>

" Buffer list
nnoremap <Leader>b        :buffers<CR>
nnoremap <Leader>p        :CtrlPBuffer<CR>
nnoremap <M-Tab>          :bnext<CR>
nnoremap <M-S-Tab>        :bprevious<CR>
nnoremap <Leader>l        <C-^>

" Quickfix list (alt h/j/k/l)
nmap     <C-Space>        <Plug>QfxListical
nnoremap ∆                :cnext<CR>
nnoremap ˚                :cprevious<CR>
nnoremap ˙                :colder<CR>
nnoremap ¬                :cnewer<CR>

" Location List (alt H/J/K/L)
nmap     <C-S-Space>      <Plug>LocListical
nnoremap Ô                :lnext<CR>
nnoremap                 :lprevious<CR>
nnoremap Ó                :lolder<CR>
nnoremap Ò                :lnewer<CR>

noremap  <Leader><Space>    :pwd<CR>
noremap  <silent> <Leader>. :call ReloadBuffers()<CR>
noremap  <C-H>              <C-Z>

" Vinegar
nnoremap - -
nmap     _ <Plug>VinegarUp

" ··········· ex commands ····· {{{1
nnoremap <Leader>1        :!
noremap  <Leader>:        :<Up>
nnoremap <Leader>h        :help 

cnoremap <C-P>            <Up>
cnoremap <C-N>            <Down>
cnoremap <C-A>            <Home>
cnoremap <C-B>            <Left>

" ··········· positioning ····· {{{1
" auto-indent whole file
nnoremap <Leader>= gg=G``

" push newline
nnoremap <S-CR>   mzO<Esc>j`z
nnoremap <C-CR>   mzo<Esc>k`z

" bubble up
nnoremap <silent> <C-K>    mZ:silent! move .-2<CR>==`Z
vnoremap <silent> <C-K>    :<C-U>silent! '<,'>move '<-2<CR>gv=gv
inoremap <silent> <C-Up>   <Esc>:silent! move .-2<CR>==gi
" bubble down
nnoremap <silent> <C-J>    mZ:silent! move .+1<CR>==`Z
vnoremap <silent> <C-J>    :<C-U>silent! '<,'>move '>+1<CR>gv=gv
inoremap <silent> <C-Down> <Esc>:silent! move .+1<CR>==gi

" ··········· editing ········· {{{1
" spawn newline
inoremap <S-CR>     <C-O>O
inoremap <C-CR>     <C-O>o

" paste toggle
noremap  <silent> <Leader>P <F8>
set pastetoggle=<F8>

" clipboard
noremap  <Leader>c  "*
noremap  <Leader>cy "+yg_

" commentary
xmap     <Leader>3  <Plug>Commentary
nmap     <Leader>3  <Plug>Commentary
omap     <Leader>3  <Plug>Commentary
nmap     <Leader>33 <Plug>CommentaryLine

" jump around insert mode
inoremap <C-B>      <C-O>b
inoremap JK         <C-O>A
inoremap KJ         <C-O>I

" toggle case
inoremap <C-_>      <Esc>viwg~gi

" ··········· autocompletion ·· {{{1

inoremap        <C-L>  <C-X><C-L>
inoremap        <C-]>  <C-X><C-]>

inoremap <expr> <Tab>   SuperTab("\<C-N>", "\<Tab>")
inoremap <expr> <S-Tab> SuperTab("\<C-P>", "\<S-Tab>")

" ··········· search ·········· {{{1
" sensible marks
noremap  `  '
noremap  '  `

" matchit
map      <Leader>5  %

" last search
noremap  <Leader>/  /<Up>
noremap  <Leader>?  ?<Up>

" substitute
nnoremap <Leader>s  :%s/
nnoremap <Leader>,s :s/
vnoremap <Leader>s  :s/

" preserve flags
nnoremap &  :&&<CR>
xnoremap &  :&&<CR>

" Ag
nnoremap <Leader>f  :Ag! 
nnoremap <Leader>,g :LAg! 

" word under cursor
noremap <silent> <Leader>* :set foldenable!<CR>
      \:let view=winsaveview()<CR>#*
      \:call winrestview(view)<CR>:set foldenable!<CR>

" toggle search highlighting
noremap <silent> <C-L>      :nohlsearch<CR><C-L>
noremap          <C-L><C-L> :set hlsearch! hlsearch?<CR>

" ··········· splits ·········· {{{1
nmap              <Leader>o  <Plug>ZoomWin
noremap           <C-W>p     <C-W><Bar>
noremap           <C-W><C-P> <C-W><Bar>
noremap           <C-W>u     <C-W>_
noremap           <C-W><C-U> <C-W>_
noremap           <C-W>m     <C-W>=
noremap           <C-W><C-M> <C-W>=
noremap  <silent> <C-W>n     :vnew<CR>
noremap  <silent> <C-W><C-N> :vnew<CR>
noremap  <silent> <C-W>]     :vertical stag<CR>
noremap  <silent> <C-W><C-]> :vertical stag<CR>
nnoremap          <Leader>q  <C-W>q

" ··········· display ········· {{{1
noremap  <silent> <Leader>,m :call ToggleColorscheme()<CR>
noremap           <Leader>[  :call SynStack()<CR>

" folding
noremap  <silent> <Leader>Z  :call FoldMethToggle()<CR>
noremap  <silent> <Leader>,z :call FoldColToggle(4)<CR>

" cursor
nnoremap <silent> <C-_>      :call CursorLineToggle()<CR>
nnoremap <silent> <C-Bslash> :set cursorcolumn!<CR>
vnoremap <silent> <C-Bslash> :<C-U>set cursorcolumn!<CR>gv
nnoremap <silent> <Leader>]  :call ColorColToggle()<CR>

" ··········· tags ············ {{{1
nnoremap <F5> :!ctags -R<CR>

" ··········· testing ········· {{{1
nmap     <Leader>r           <Plug>RunFocusedSpec
nmap     <Leader>t           <Plug>RunCurrentSpecFile
nmap     <Leader>,r          <Plug>RunMostRecentSpec
noremap  <silent> <Leader>,f :VtrFocusRunner<CR>
noremap  <silent> <Leader>,k :VtrKillRunner<CR>
nnoremap <silent> <Leader>x  :call Vmux()<CR>
nnoremap <silent> <Leader>,x :call Vtux()<CR>

" ··········· git ············· {{{1
noremap <silent> <Leader>B   :Gblame<CR>

" ··········· rails ··········· {{{1
nnoremap <silent> <Leader><Tab> :A<CR>
nnoremap          <Leader>E     :Eschema 
nnoremap          <Leader>M     :Emigration 
nnoremap          <Leader>es    :Espec 
nnoremap          <Leader>ef    :edit spec/factories/
nnoremap          <Leader>ec    :Econtroller 
nnoremap          <Leader>em    :Emodel 
nnoremap          <Leader>ev    :Eview 
nnoremap          <Leader>eh    :Ehelper 


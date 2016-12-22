" ::::::::: Keybindings :::::::::::::::::::

" ··········· config ·········· {{{1
" Use Space as mapleader
let mapleader = ' '
nnoremap <Space> <Nop>

" Timeout mappings fast and key codes faster
set timeout timeoutlen=300 ttimeoutlen=100

" source / edit vimrc
nnoremap <silent> <C-.>      :source $MYVIMRC<CR>
nnoremap          <C-,>      :edit   $MYVIMRC<CR>
nnoremap          <C-,>f     :edit   ~/.vim/init/functions.vim<CR>
nnoremap          <C-,><C-F> :edit   ~/.vim/init/functions.vim<CR>
nnoremap          <C-,>k     :edit   ~/.vim/init/keybindings.vim<CR>
nnoremap          <C-,><C-K> :edit   ~/.vim/init/keybindings.vim<CR>
nnoremap          <C-,>o     :edit   ~/.vim/init/options.vim<CR>
nnoremap          <C-,><C-O> :edit   ~/.vim/init/options.vim<CR>
nnoremap          <C-,>t     :edit   ~/.vim/init/terminal.vim<CR>
nnoremap          <C-,><C-T> :edit   ~/.vim/init/terminal.vim<CR>
nnoremap          <C-,>w     :edit   ~/.vim/init/wild.vim<CR>
nnoremap          <C-,><C-W> :edit   ~/.vim/init/wild.vim<CR>

" ··········· buffers ········· {{{1
cnoremap <expr>   %%    getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

nmap <silent> <Leader>- :tabedit %%<CR>

nnoremap <Leader>e      :edit 
nmap     <Leader>ee     :edit %%
nnoremap <Leader>et     :tabedit 
nnoremap <Leader>eh     :edit ~/

nnoremap <Leader>fs     :write<CR>
nnoremap <Leader>wq     :wq 

nnoremap  <Leader>dd    :bdelete<CR>
nnoremap  <Leader>dl    :bdelete#<CR>

" Buffer list
nnoremap <S-Space>      :buffers<CR>
nnoremap <Leader>bn     :bnext<CR>
nnoremap <Leader>bp     :bprevious<CR>
nnoremap <Leader>l      <C-^>

" Quickfix list (alt h/j/k/l)
nmap     <C-@>          <Plug>QfxListical
nnoremap ∆              :cnext<CR>
nnoremap ˚              :cprevious<CR>
nnoremap ˙              :colder<CR>
nnoremap ¬              :cnewer<CR>

" Location List (alt H/J/K/L)
nmap     <C-S-Space>    <Plug>LocListical
nnoremap Ô              :lnext<CR>
nnoremap               :lprevious<CR>
nnoremap Ó              :lolder<CR>
nnoremap Ò              :lnewer<CR>

noremap  <Leader><Space>    :pwd<CR>
noremap  <silent> <Leader><Bslash> :call ReloadBuffers()<CR>

" Vinegar
nnoremap - -
nmap     <Leader>fj <Plug>VinegarUp

" ··········· ex commands ····· {{{1
nnoremap <Leader>1        :!
noremap  <Leader>:        :<Up>
nnoremap <Leader>h        :help 

cnoremap <C-P>            <Up>
cnoremap <C-N>            <Down>
cnoremap <C-A>            <Home>
cnoremap <C-B>            <Left>

" ··········· positioning ····· {{{1
" push newline
nnoremap <S-CR>   mzO<Esc>`z
nnoremap <C-CR>   mzo<Esc>`z

" bubble up
nnoremap <silent> <C-K>    mZ:silent! move .-2<CR>==`Z
vnoremap <silent> <C-K>    :<C-U>silent! '<,'>move '<-2<CR>gv=gv
inoremap <silent> <C-Up>   <Esc>:silent! move .-2<CR>==gi
" bubble down
nnoremap <silent> <C-J>    mZ:silent! move .+1<CR>==`Z
vnoremap <silent> <C-J>    :<C-U>silent! '<,'>move '>+1<CR>gv=gv
inoremap <silent> <C-Down> <Esc>:silent! move .+1<CR>==gi

" emacs-like indentation
vnoremap <Tab> =
vnoremap     < <gv
vnoremap     > >gv

" ··········· editing ········· {{{1
" spawn newline
inoremap <S-CR>     <C-O>O
inoremap <C-CR>     <C-O>o

" sensible Y
nnoremap Y y$

" paste toggle
set pastetoggle=<F8>

" select last changed/yanked text
nnoremap <Leader>V `[v`]

" registers
noremap           ' "
noremap  <Leader>y  "*y
noremap  <Leader>ye "*y$
noremap  <Leader>p  "*p

" commentary
xmap     <Leader>;  <Plug>Commentary
nmap     <Leader>;  <Plug>Commentary
omap     <Leader>;  <Plug>Commentary
nmap     <Leader>;; <Plug>CommentaryLine

" arg-wrap
nnoremap <silent> <Leader>) :ArgWrap<CR>
nnoremap <silent> <Leader>( :ArgWrap<CR>

" jump around insert mode
inoremap <C-B>      <C-O>b
inoremap JK         <C-O>A
inoremap KJ         <C-O>I

" toggle case
inoremap <C-_>      <Esc>viwg~gi

" end of line
noremap <Leader>4   $

" hash-rocket
inoremap <C-.> <Space>=><Space>

" ··········· autocompletion ·· {{{1

inoremap        <C-L>  <C-X><C-L>
inoremap        <C-]>  <C-X><C-]>
inoremap        <C-@>  <C-X><C-O>

inoremap <expr> <Tab>   SuperTab("\<C-N>", "\<Tab>")
inoremap <expr> <S-Tab> SuperTab("\<C-P>", "\<S-Tab>")

" ··········· search ·········· {{{1
" marks
noremap <Leader>g `

" emacs taking over my life
noremap  <C-S>  /
noremap  <C-R>  ?
nmap         U  <Plug>(RepeatRedo)

" :nohlsearch
nnoremap  <silent> <Leader><CR> :nohlsearch<CR>
" lazy matchit
map      <Leader>5  %

" sane regexes
nnoremap  <Leader>/  /\v
vnoremap  <Leader>/  /\v
nnoremap  <Leader>?  ?\v
vnoremap  <Leader>?  ?\v

" substitute
nnoremap <Leader>,s :%s/
nnoremap <Leader>s  :s/
vnoremap <Leader>s  :s/

" preserve flags
nnoremap &  :&&<CR>
xnoremap &  :&&<CR>

" fzf (reserved)
" nnoremap <Leader><C-G> some-fzf-command

" Ag
nnoremap <Leader>a  :Grepper<CR>

" word under cursor
noremap <silent> <Leader>* :set foldenable!<CR>
      \:let view=winsaveview()<CR>#*
      \:call winrestview(view)<CR>:set foldenable!<CR>

" ··········· splits ·········· {{{1
nmap              <C-W><Space> <Plug>ZoomWin
nmap              <C-W><C-@>   <Plug>ZoomWin
noremap           <C-W>u       <C-W>_
noremap           <C-W><C-U>   <C-W>_
noremap  <silent> <C-W>]       :vertical stag<CR>
noremap  <silent> <C-W><C-]>   :vertical stag<CR>
noremap           <Leader>q    <C-W><C-Q>

" ··········· tabs ············ {{{1
noremap           <C-W>n       gt
noremap           <C-W><C-N>   gt
noremap           <C-W>p       gT
noremap           <C-W><C-P>   gT

" ··········· display ········· {{{1
noremap  <silent> <Leader>,m :call ToggleColorscheme()<CR>
noremap  <silent> <Leader>[  :call SynHighlight()<CR>
noremap  <silent> <Leader>.  :call StatusToggle()<CR>

" folding
noremap  <silent> <Leader>Z  :call FoldMethToggle()<CR>
noremap  <silent> <Leader>,z :call FoldColToggle(4)<CR>

" colour column
nnoremap <silent> <Leader>]  :call ColorColToggle()<CR>

" emacs redraws
nnoremap <C-L>           zz<C-L>
nnoremap <Leader><C-L>   zt<C-L>

" reposition
noremap <silent> zz      :call Reposition()<CR>

" ··········· testing ········· {{{1
nmap     <Leader>r           <Plug>RunFocusedSpec
nmap     <Leader>t           <Plug>RunCurrentSpecFile
nmap     <Leader>,r          <Plug>RunMostRecentSpec
noremap  <silent> <Leader>,f :VtrFocusRunner<CR>
noremap  <silent> <Leader>,k :VtrKillRunner<CR>
nnoremap <silent> <Leader>x  :call Vmux()<CR>
nnoremap <silent> <Leader>,x :call Vtux()<CR>

" ··········· git ············· {{{1
noremap <silent> <Leader>vb   :Gblame<CR>

" ··········· ruby ············ {{{1
noremap  <silent> <Leader>R     :w !ruby<CR>
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

nnoremap <Leader>P Obinding.pry<Esc>0


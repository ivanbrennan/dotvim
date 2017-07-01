" ::::::::: Keybindings :::::::::::::::::::

" ··········· config ·········· {{{1
" Use Space as mapleader
let mapleader = ' '
nnoremap <Space> <Nop>

" Timeout mappings fast and key codes faster
set timeout timeoutlen=300 ttimeoutlen=100

" source / edit vimrc
nnoremap <silent> <leader>fr :source $MYVIMRC<CR>
nnoremap          <leader>f; :EditDotVim 

" ··········· buffers ········· {{{1
cnoremap <expr>   %%    getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

nmap <silent> <leader>- :tabedit %%<CR>

nnoremap <leader>e      :edit 
nmap     <leader>ee     :edit %%
nnoremap <leader>et     :tabedit 
nnoremap <leader>eh     :edit ~/

nnoremap <leader>fs     :write<CR>
nnoremap <leader>wq     :wq 

nnoremap  <leader>dd    :bdelete<CR>
nnoremap  <leader>dl    :bdelete#<CR>

" Buffer list
noremap  <leader><Space> :buffers<CR>
nnoremap <leader>bn      :bnext<CR>
nnoremap <leader>bp      :bprevious<CR>
nnoremap <leader>l       <C-^>

" Quickfix list (alt h/j/k/l)
nmap     <C-@>          <Plug>QfxListical
nmap     <C-Space>      <Plug>QfxListical
nnoremap <M-j>          :cnext<CR>
nnoremap <M-k>          :cprevious<CR>
nnoremap <M-h>          :colder<CR>
nnoremap <M-l>          :cnewer<CR>

" Location List (alt H/J/K/L)
nmap     <C-S-Space>    <Plug>LocListical
nnoremap <M-J>          :lnext<CR>
nnoremap <M-K>          :lprevious<CR>
nnoremap <M-H>          :lolder<CR>
nnoremap <M-L>          :lnewer<CR>

noremap  <silent> <leader><Bslash> :call ReloadBuffers()<CR>

" Vinegar
nnoremap - -
nmap     <leader>h  <Plug>VinegarUp

" ··········· ex commands ····· {{{1
noremap  <S-Space>        :
nnoremap <leader>1        :!
noremap  <leader>:        :<Up>
nnoremap <leader>H        :help 

cnoremap <C-P>            <Up>
cnoremap <C-N>            <Down>
cnoremap <C-A>            <Home>
cnoremap <C-B>            <Left>

" ··········· positioning ····· {{{1
" push newline
nnoremap <S-CR>   mzO<Esc>`z
nnoremap <C-CR>   mzo<Esc>`z

" bubble up
nnoremap <silent> <C-Up>   mZ:silent! move .-2<CR>==`Z
vnoremap <silent> <C-Up>   :<C-U>silent! '<,'>move '<-2<CR>gv=gv
inoremap <silent> <C-Up>   <Esc>:silent! move .-2<CR>==gi
" bubble down
nnoremap <silent> <C-Down> mZ:silent! move .+1<CR>==`Z
vnoremap <silent> <C-Down> :<C-U>silent! '<,'>move '>+1<CR>gv=gv
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
nnoremap <leader>V `[v`]

" registers
noremap           ' "
noremap  <leader>y  "*y
noremap  <leader>ye "*y$
noremap  <leader>p  "*p

" the abyss
vnoremap <BS> "_d

" commentary
xmap     <leader>;  <Plug>Commentary
nmap     <leader>;  <Plug>Commentary
omap     <leader>;  <Plug>Commentary
nmap     <leader>;; <Plug>CommentaryLine

" arg-wrap
nnoremap <silent> <leader>) :ArgWrap<CR>
nnoremap <silent> <leader>( :ArgWrap<CR>

" jump around insert mode
inoremap <C-B>      <C-G>U<Left>
inoremap <C-F>      <C-G>U<Right>
inoremap JK         <End>
inoremap KJ         <Home>

" edit like you're emacs
inoremap <C-D>      <Del>

" toggle case
inoremap <C-_>      <Esc>viwg~gi

" end of line
noremap <leader>4   $

" hash-rocket
inoremap <C-.> <Space>=><Space>

" ··········· autocompletion ·· {{{1

inoremap        <C-L>  <C-X><C-L>
inoremap        <C-]>  <C-X><C-]>
inoremap        <C-@>  <C-X><C-O>
inoremap    <C-Space>  <C-X><C-O>

inoremap <expr> <Tab>   SuperTab("\<C-N>", "\<C-F>")
inoremap <expr> <S-Tab> SuperTab("\<C-P>", "\<C-D>")

" ··········· search ·········· {{{1
" marks
noremap <leader>g `

" emacs taking over my life
noremap  <C-S>  /
inoremap <C-S>  <C-O>/
noremap  <C-R>  ?
nnoremap     U  <C-R>
nmap <C-Bslash> <Plug>(RepeatRedo)

" :nohlsearch
nnoremap  <silent> <leader><CR> :nohlsearch<CR>
" lazy matchit
map      <leader>5  %

" sane regexes
nnoremap  /  /\v
vnoremap  /  /\v
nnoremap  ?  ?\v
vnoremap  ?  ?\v
nnoremap  <leader>/  /
nnoremap  <leader>?  ?

" substitute
nnoremap <leader>S  :%s/
nnoremap <leader>s  :s/
vnoremap <leader>s  :s/
nnoremap        c.  *Ncgn

" preserve flags
nnoremap &  :&&<CR>
xnoremap &  :&&<CR>

" fzf (reserved)
" nnoremap <leader><C-G> some-fzf-command

" Ag
nnoremap <leader>a  :Grepper<CR>

" word under cursor
noremap <silent> <leader>* :set foldenable!<CR>
      \:let view=winsaveview()<CR>#*
      \:call winrestview(view)<CR>:set foldenable!<CR>

" ··········· movement ········ {{{1
" first non-blank on previous line
nnoremap <C-P> -
noremap <expr> 0 MoveToBol()

" scroll
noremap <C-J> <C-E>
noremap <C-K> <C-Y>

" ··········· splits ·········· {{{1
nmap              <C-W><Space>   <Plug>ZoomWin
nmap              <C-W><C-@>     <Plug>ZoomWin
nmap              <C-W><C-Space> <Plug>ZoomWin
noremap           <C-W>u         <C-W>_
noremap           <C-W><C-U>     <C-W>_
noremap  <silent> <C-W>]         :vertical stag<CR>
noremap  <silent> <C-W><C-]>     :vertical stag<CR>
noremap           <leader>q      <C-W><C-Q>
nnoremap          <C-D>          <C-W><C-Q>

noremap           <leader>,      <C-W>p

" ··········· tabs ············ {{{1
noremap           <C-W>n       gt
noremap           <C-W><C-N>   gt
noremap           <C-W>p       gT
noremap           <C-W><C-P>   gT

" ··········· display ········· {{{1
noremap  <silent> <leader>`  :call ToggleColorscheme()<CR>
noremap  <silent> <leader>[  :call SynHighlights(-1)<CR>
noremap  <silent> <leader>.  :call StatusToggle()<CR>

" folding
noremap  <silent> <leader>Z  :call FoldMethCycle()<CR>
noremap  <silent> <leader>z  :call FoldColToggle(4)<CR>

" colour column
nnoremap <silent> <leader>]  :call ColorColToggle()<CR>

" emacs redraws
nnoremap <C-L>       zz<C-L>
nnoremap <C-U><C-L>  zt<C-L>

" reposition
noremap <silent> zz      :call Reposition()<CR>

" ··········· testing ········· {{{1
nmap         t<CR>        <Plug>RunFocusedSpec
nmap         T<CR>        <Plug>RunCurrentSpecFile
nmap      <leader>t       <Plug>RunMostRecentSpec

" ··········· git ············· {{{1
noremap <silent> <leader><C-V>  :Gblame<CR>

" ··········· ruby ············ {{{1
noremap  <silent> <leader>R     :w !ruby<CR>
" ··········· rails ··········· {{{1
nnoremap <silent> <leader><Tab> :A<CR>
nnoremap          <leader>E     :Eschema 
nnoremap          <leader>M     :Emigration 
nnoremap          <leader>es    :Espec 
nnoremap          <leader>ef    :edit spec/factories/
nnoremap          <leader>ec    :Econtroller 
nnoremap          <leader>em    :Emodel 
nnoremap          <leader>ev    :Eview 
nnoremap          <leader>eh    :Ehelper 

nnoremap <leader>P Obinding.pry<Esc>0


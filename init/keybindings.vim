" ::::::::: Keymaps :::::::::::::::::::::::

" ··········· config ··················· {{{1
" leaders
map <Space> <Leader>

set timeout timeoutlen=250 ttimeoutlen=100

" source / edit vimrc
noremap <C-.>  :source $MYVIMRC<CR>
noremap <C-,>  :tabedit $MYVIMRC<CR>

" ··········· keys ····················· {{{1
" enable special key combos
if &term =~ "xterm" || &term =~ "screen" || &term =~ "builtin_gui"
  set  <F13>=[25~
  map  <F13> <C-CR>
  map! <F13> <C-CR>

  set  <F14>=[27~
  map  <F14> <S-CR>
  map! <F14> <S-CR>

  set  <F15>=[29~
  map  <F15> <C-Space>
  map! <F15> <C-Space>

  set  <F16>=[30~
  map  <F16> <S-Space>
  map! <F16> <S-Space>

  set  <F17>=[1;5P
  map  <F17> <C-BS>
  map! <F17> <C-BS>

  set  <F18>=[1;5Q
  map  <F18> <M-Tab>
  map! <F18> <M-Tab>

  set  <F19>=[1;5R
  map  <F19> <M-S-Tab>
  map! <F19> <M-S-Tab>

  set  <F20>=[1;5A
  map  <F20> <C-Up>
  map! <F20> <C-Up>

  set  <F21>=[1;5B
  map  <F21> <C-Down>
  map! <F21> <C-Down>

  set  <F22>=[1;5C
  map  <F22> <C-Right>
  map! <F22> <C-Right>

  set  <F23>=[1;5D
  map  <F23> <C-Left>
  map! <F23> <C-Left>

  set  <F24>=[31~
  map  <F24> <C-Tab>
  map! <F24> <C-Tab>

  set  <F25>=[32~
  map  <F25> <C-S-Tab>
  map! <F25> <C-S-Tab>

  set  <F26>=[33~
  map  <F26> <C-,>
  map! <F26> <C-,>

  set  <F27>=[34~
  map  <F27> <C-.>
  map! <F27> <C-.>

  set  <F28>=[35~
  map  <F28> <C-S-Space>
  map! <F28> <C-S-Space>

  set  <F29>=[36~
  map  <F29> <C-->
  map! <F29> <C-->

  set  <F30>=[37~
  map  <F30> <C-S-CR>
  map! <F30> <C-S-CR>

  set  <F31>=[1;6A
  map  <F31> <C-S-Up>
  map! <F31> <C-S-Up>

  set  <F32>=[1;6B
  map  <F32> <C-S-Down>
  map! <F32> <C-S-Down>

  set  <F33>=[1;6C
  map  <F33> <C-S-Right>
  map! <F33> <C-S-Right>

  set  <F34>=[1;6D
  map  <F34> <C-S-Left>
  map! <F34> <C-S-Left>
endif

" ··········· buffers ·················· {{{1
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
noremap <silent> <Leader><CR>  :Explore<CR>

nmap    <Leader>ee          :edit %%
noremap <Leader>et          :tabedit 
noremap <Leader>e`          :edit ~/
noremap <Leader>ec          :edit ~/Development/code/
noremap <Leader>dd          :bdelete<CR>
noremap <Leader>d3          :bdelete#<CR>
nmap    <Leader>ww          :write %%
vmap    <Leader>ww          :write %%
noremap <C-S-CR>            :write<CR>

noremap <C-S-Down>          :cnext<CR>
noremap <C-S-Up>            :cprevious<CR>
noremap <C-S-Right>         :bnext<CR>
noremap <C-S-Left>          :bprevious<CR>
noremap <Leader>p           :CtrlPBuffer<CR>
noremap <Leader>3           <C-^>
noremap <S-Space>           :buffers<CR>
map     <C-Space>           <Plug>QuickfixToggle
noremap <C-S-Space>         <C-Z>

noremap <Leader>/           :pwd<CR>
noremap <Leader>,<Space>    :call ReLoadBuffers()<CR>

noremap <silent> <Leader>ap :A<CR>

" ··········· ex commands ·············· {{{1
noremap  <Leader>;       :!
nnoremap <Leader>h       :help 
nnoremap <Leader>x       :x

cnoremap <C-P>           <Up>
cnoremap <C-N>           <Down>
cnoremap <C-A>           <Home>
cnoremap <C-Left>        <S-Left>
cnoremap <C-Right>       <S-Right>

" ··········· editing ·················· {{{1
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

" ··········· navigation ··············· {{{1
" sensible marks
noremap `  '
noremap '  `

" ··········· searching ················ {{{1
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

" ··········· splits & tabs ············ {{{1
" splits
noremap <Leader>,s  :split<CR>
noremap <Leader>,v  :vsplit<CR>
noremap  <Leader>q  :quit<CR>

"resize
noremap     <C-W>\  <C-W><Bar>
noremap <C-W><C-\>  <C-W><Bar>

" ··········· appearance ··············· {{{1
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

" ··········· testing ·················· {{{1
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


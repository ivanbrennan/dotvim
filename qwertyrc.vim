" ::::::::: qwertyrc ::::::::::::::::::::::::::::::::::

" leaders
map <Space> <Leader>
let maplocalleader=","

function! QWERTYMaps()
  " source / edit vimrc
  call MapUtility( "<LocalLeader>`", ":source $MYVIMRC<CR>", "nore" )
  noremap <LocalLeader>` 
  noremap <LocalLeader>`, :edit $MYVIMRC<CR>
endfunction

function! QWERTYUnmaps()
endfunction

function! MapUtility(lhs, rhs, ...)
  if a:0 > 0 | let [ m_code, rem, bang ] = ParseOpts(a:000)
  else       | let [ m_code, rem, bang ] = [ "", "", "" ]
  endif
  if a:rhs == "" | let un = "un" | let spacer = ""
  else           | let un = ""   | let spacer = " "
  endif

  execute m_code.un.rem."map".bang." ".a:lhs.spacer.a:rhs
endfunction

function! ParseOpts(opts)
  let m_code = ParseMode(a:opts)
  let rem  = ( count(a:opts, "nore") > 0 ? "nore" : "" )
  let bang = ( count(a:opts,    "!") > 0 ?    "!" : "" )
  return [ m_code, rem, bang ]
endfunction

function! ParseMode(opts)
  let codes = [ "n", "v", "o", "x", "s", "i", "c", "l" ]
  for code in codes
    if count(a:opts, code) > 0 | return code | endif
  endfor
  return ""
endfunction

" ::::::::: Mappings :::::::::::::::::::::: {{{1

" ··········· terminal key codes ······· {{{2
" hack to fix arrow keys in terminal
if &term =~ "xterm"
  imap <Esc>[A <Up>
  imap <Esc>[B <Down>
  imap <Esc>[C <Right>
  imap <Esc>[D <Left>
endif

" use some unused function key codes to
" make special key combos work in terminal
set  <F13>=O2P
map  <F13> <C-CR>
map! <F13> <C-CR>
set  <F14>=O2Q
map  <F14> <S-CR>
map! <F14> <S-CR>

set  <F15>=O2R
map  <F15> <C-Space>
map! <F15> <C-Space>
set  <F16>=O2S
map  <F16> <S-Space>
map! <F16> <S-Space>

set  <F17>=O5P
map  <F17> <C-BS>
map! <F17> <C-BS>

set  <F18>=O5Q
map  <F18> <M-Tab>
map! <F18> <M-Tab>
set  <F19>=O5R
map  <F19> <M-S-Tab>
map! <F19> <M-S-Tab>

" ··········· modes ···················· {{{2
" " enter command mode
" noremap  ; :
" noremap q; q:

" exit insert mode
inoremap    kj <Esc>`^
inoremap    jk <Esc>`^
inoremap <C-[> <Esc>`^

" ··········· buffers ·················· {{{2
" netrw
noremap <silent> <Leader>e :call ExToggle("")<CR>
noremap <silent> <Leader>,e :call ExToggle(getcwd())<CR>
noremap <silent> <Leader><Tab> :call VexToggle("")<CR>
noremap <silent> <Leader>,<Tab> :call VexToggle(getcwd())<CR>

" from ./vim/after/ftplugin/netrw.vim
"   Select file/dir:  f
"   Refresh listing: <LocalLeader>l
"   Set treetop dir: <LocalLeader>t

" list
noremap <LocalLeader><Space> :buffers<CR>
noremap <Leader>b :buffers<CR>:b
noremap <Leader>p :CtrlPBuffer<CR>

" open from ~
noremap <LocalLeader>e, :edit ~/

" open from %
nmap <LocalLeader>ew :edit %%
nmap <LocalLeader>es :split %%
nmap <LocalLeader>ev :vsplit %%
nmap <LocalLeader>et :tabedit %%
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" close
noremap <LocalLeader>d :bdelete<CR>
noremap <silent> <LocalLeader>c :call BClose()<CR>
noremap <LocalLeader>o :bufdo bd<CR>

" current directory
noremap <Leader><Space> :pwd<CR>
noremap <LocalLeader>t :lcd %:h<CR>

" cycle
noremap   <M-Tab> :bnext<CR>
noremap <M-S-Tab> :bprevious<CR>

" ··········· editing ·················· {{{2
" open above / below current line
inoremap <S-CR> <C-O>O
inoremap <C-CR> <C-O>o

" double backspace
inoremap <C-BS> <BS><BS>

" insert above / below current line
noremap <S-Space> mzO<Esc>j`z
noremap <C-Space> mzo<Esc>k`z

" bubble text
nnoremap <silent> <C-Up> mZ:move .-2<CR>==`Z
vnoremap          <C-Up> :move '<-2<CR>gv=gv
inoremap          <C-Up> <Esc>:move .-2<CR>==gi
nnoremap <silent> <C-Down> mZ:move .+1<CR>==`Z
vnoremap          <C-Down> :move '>+1<CR>gv=gv
inoremap          <C-Down> <Esc>:move .+1<CR>==gi

vnoremap <C-Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
vnoremap <C-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o

" whole line completion
inoremap <C-L> <C-X><C-L>

" jump back a word in insert mode
inoremap <C-B> <C-O>b

" autocomplete parens, brackets, braces
inoremap (<CR> (<CR>)<Esc>O<Tab>
inoremap [<CR> [<CR>]<Esc>O<Tab>
inoremap {<CR> {<CR>}<Esc>O<Tab>

" paste toggle
noremap <LocalLeader>p :set paste! paste?<CR>
noremap           <F4> :set paste! paste?<CR>
set pastetoggle=<F4>

" toggle case
inoremap `` <Esc>viwg~gi

" add semicolon to end of line
noremap <Leader>; mZA;<Esc>`Z

" toggle filetype
noremap <silent> <LocalLeader>f, :call FileTypeToggle(1)<CR>
noremap <silent>  <LocalLeader>f :call FileTypeToggle(0)<CR>
" toggle html
inoremap <silent> ``h X<C-O>:call HTMLTypeToggle()<CR><BS>

" format entire file
noremap <LocalLeader>fef :normal! gg=G``<CR>

" toggle Gundo
noremap <Leader>g :GundoToggle<CR>

" previous / next braces
onoremap in :<C-U>call NextTextObject('i')<CR>
xnoremap in :<C-U>call NextTextObject('i')<CR>
onoremap an :<C-U>call NextTextObject('a')<CR>
xnoremap an :<C-U>call NextTextObject('a')<CR>

" ··········· navigation ··············· {{{2
" sensible marks
noremap ` '
noremap ' `

" last non-blank char
noremap - g_

" soft line-breaks
noremap    <Up> gk
noremap  <Down> gj
" behave normally if popup-menu visible
inoremap   <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>
inoremap <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>

" side-scroll
noremap <Left> zh
noremap <Right> zl

" ··········· searching ················ {{{2
" repeat last char search
noremap + ;
noremap _ ,

" " search and replace
" nnoremap  :: :%s:::g<Left><Left><Left>
" vnoremap  :: :s:::g<Left><Left><Left>
" nnoremap  :C :%s:::cg<Left><Left><Left><Left>
" vnoremap  :C :s:::cg<Left><Left><Left><Left>
" cnoremap ;/ \(\)<Left><Left>

" find word under cursor
noremap <silent> <Leader>f :set foldenable!<CR>
      \:let view=winsaveview()<CR>#*
      \:call winrestview(view)<CR>:set foldenable!<CR>

" toggle search highlighting
noremap <LocalLeader><Tab> :set hlsearch! hlsearch?<CR>

" find merge conflicts
noremap <silent> <LocalLeader>m <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" toggle diff
noremap <silent> <Leader>d :call DiffToggle()<CR>

" ··········· splits & tabs ············ {{{2
" splits
noremap <Leader>s :split<CR>
noremap <Leader>v :vsplit<CR>
noremap <silent> <Leader>o :only<CR>
noremap <Leader>k :quit<CR>

"resize
noremap <Leader>- <C-W>_
noremap <Leader>] <C-W><Bar>
noremap <Leader>= <C-W>=

" navigate
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" rearrange
noremap <C-W><C-J> <C-W>J
noremap <C-W><C-K> <C-W>K
noremap <C-W><C-H> <C-W>H
noremap <C-W><C-L> <C-W>L

" tabs
noremap <Leader>9 :tabprevious<CR>
noremap <Leader>0 :tabnext<CR>

" ··········· appearance ··············· {{{2
noremap <LocalLeader>,w :setlocal wrap! linebreak! list! wrap?<CR>

if has("gui_running")
  noremap <LocalLeader>,t :call TransparencyToggle(5)<CR>
end

" fonts
noremap <silent> <LocalLeader>= :call FontCycle(1)<CR>:echo getfontname()<CR>
noremap <silent> <LocalLeader>- :call FontCycle(-1)<CR>:echo getfontname()<CR>

" colors
noremap <silent> <LocalLeader>] :call ColorCycle(1)<CR>:colorscheme<CR>
noremap <silent> <LocalLeader>[ :call ColorCycle(-1)<CR>:colorscheme<CR>

" background
noremap <LocalLeader>b :call ToggleBG()<CR>:echo &background<CR>

" info
noremap <LocalLeader>h :call HexHighlight()<CR>
noremap <LocalLeader>y :call SynStack()<CR>

" line numbers
noremap <Leader>n :call NumberToggle()<CR>
noremap <Leader>r :set relativenumber! relativenumber?<CR>

" foldcolumn
noremap <silent> <Leader>z :call FoldColToggle(4)<CR>

" cursor
noremap <silent> <Leader>c :set cursorcolumn!<CR>

" ··········· evaluation ··············· {{{2
" RSpec
noremap <Leader>tt :call RunCurrentSpecFile()<CR>
noremap <Leader>t<Space> :call RunNearestSpec()<CR>
noremap <Leader>tl :call RunLastSpec()<CR>
noremap <Leader>ta :call RunAllSpecs()<CR>



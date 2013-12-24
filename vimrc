" ::::::::: Vimrc ::::::::::::::::::::::::::::::::::::::::

set nocompatible           " be iMproved
set encoding=utf-8         " default encoding to UTF-8

" ::::::::: Vundle ::::::::::::::::::::::::::: {{{

filetype off               " required for Vundle!
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tsaleh/vim-matchit'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'

Bundle 'vim-scripts/hexHighlight.vim'
Bundle 'guns/xterm-color-table.vim'
Bundle 'shawncplus/Vim-toCterm'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gregsexton/Muon'

filetype plugin indent on       " required!

" }}}

" ::::::::: Backup and Swap Files :::::::::::: {{{

set backup                      " backup files...
set backupdir=~/.vim/backup     " ...to here
set directory=~/.vim/tmp        " all temp files here
set history=500                 " history 500-deep

" }}}

" ::::::::: Mappings ::::::::::::::::::::::::: {{{

set timeout timeoutlen=250 ttimeoutlen=100

let mapleader=" "

" vimrc
noremap \sv :source $MYVIMRC<CR>
noremap \ev :edit $MYVIMRC<CR>

augroup vimrcgroup  " auto-reload vimrc when it's saved
  autocmd!
  autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" easier commands
noremap ; :

" replace overwritten mappings
noremap + ;
noremap _ ,

" easier marks
noremap ` '
noremap ' `

" }}}

" ::::::::: Function Keys :::::::::::::::::::: {{{

" <F1> Help

" <F2> togglebg
call togglebg#map("")
nnoremap <F2> :ToggleBG<CR>

" <F3> find merge conflicts
nnoremap <silent> <F3> <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" <F4> pastetoggle
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>

" <F5> SynStack
nnoremap <F5> :call <SID>SynStack()<CR>

" <F6> HexHighlight
nnoremap   <F6> :call HexHighlight()<CR>

" <F7>

" <F8>

" <F9>

" <F10>

" <F11>

" <F12>

" }}}

" ::::::::: Buffers :::::::::::::::::::::::::: {{{

set hidden        " allow hidden buffers

" navigators
noremap <S-CR> :buffers<CR>:buffer<Space>
noremap <C-CR> :NERDTreeToggle<CR>

" current directory
noremap <Leader>wd :pwd<CR>
noremap <Leader>cd :lcd %:h<CR>

" edit
noremap <Leader>eh :edit ~/
noremap <Leader>ew :edit <C-r>=expand('%:h').'/'<CR>
noremap <Leader>es :split <C-r>=expand('%:h').'/'<CR>
noremap <Leader>ev :vsplit <C-r>=expand('%:h').'/'<CR>
noremap <Leader>et :tabedit <C-r>=expand('%:h').'/'<CR>

" close
noremap  <Leader>d :bdelete<CR>
noremap  <Leader>c :bprevious<CR>:bdelete#<CR>

" split {{{
  noremap <Leader>s :split<CR>
  noremap <Leader>v :vsplit<CR>
  noremap <Leader>o :only<CR>
  " resize
  noremap <Leader>- <C-W>_
  noremap <Leader>\ <C-W><bar>
  noremap <Leader>= <C-W>=
  "function! SwitchSplit()
  "endfunc
  " replace this with SwitchSplit()
  noremap <Leader><Leader>s <C-W>t<C-W>K
  noremap <Leader><Leader>v <C-W>t<C-W>H
" }}}

" navigate {{{
  " buffers / tabs
  noremap  <Leader>j :bprevious<CR>
  noremap  <Leader>k :bnext<CR>
  noremap  <Leader>h :tabprevious<CR>
  noremap  <Leader>l :tabnext<CR>

  " splits
  noremap <C-j> <C-w>j
  noremap <C-k> <C-w>k
  noremap <C-h> <C-w>h
  noremap <C-l> <C-w>l
  noremap <S-Tab> <C-w>W
  noremap   <Tab> <C-w><C-w>
" }}}

" }}}

" ::::::::: Appearance ::::::::::::::::::::::: {{{

set number        " line numbers
set ruler         " line and column number
set nowrap        " don't wrap lines
syntax enable     " syntax highlighting, local overrides
set guifont=Source\ Code\ Pro:h16

if has("gui_running")
  set transparency=5
endif

nnoremap <Leader>ww :set invwrap wrap?<CR>

" ········· Whitespace ······················· {{{

set tabstop=2                   " tab is two spaces
set softtabstop=2               " softtab is two spaces
set shiftwidth=2                " autoindent is two spaces
set expandtab                   " convert tabs to spaces
set backspace=indent,eol,start  " backspace through everything
set textwidth=0                 " no autowrap

set list                        " show invisible characters
set listchars=""                " reset the listchars
set listchars=tab:▸\            " tab
set listchars+=trail:·          " trailing space
set listchars+=extends:»        " continues offscreen
set listchars+=precedes:«       " precedes offscreen

" }}}

" ········· Colors ··························· {{{

colorscheme ivisu

nnoremap  <Leader>1 :colo<Space>ivisu<CR>
nnoremap <Leader>11 :colo<Space>hemisu<CR>
nnoremap  <Leader>2 :colo<Space>smyck<CR>
nnoremap <Leader>22 :colo<Space>smyckblue<CR>
nnoremap  <Leader>3 :colo<Space>mustang<CR>
nnoremap <Leader>33 :colo<Space>mustangblue<CR>
nnoremap  <Leader>4 :colo<Space>github<CR>
nnoremap  <Leader>5 :colo<Space>ivanized<CR>
nnoremap  <Leader>6 :colo<Space>muon<CR>
nnoremap  <Leader>7 :colo<Space>tir_black<CR>
nnoremap <Leader>77 :colo<Space>ir_black<CR>
nnoremap  <Leader>8 :colo<Space>xoria256<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" }}}

" ········· Line Numbers ····················· {{{

nnoremap <Leader>n :set number!<CR>
nnoremap <Leader>r :set relativenumber!<CR>

set cursorline

" hilight line number
highlight clear CursorLine
augroup CLClear
  autocmd! ColorScheme * highlight clear CursorLine
augroup END

" }}}

" ········· Cursor ··························· {{{

set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0

" }}}

" ········· Dividers ························· {{{

set fillchars+=vert:\           " clean dividers
set laststatus=2                " show statusline

set statusline=
set statusline+=%<              " cut at start
set statusline+=\ %f\           " path
set statusline+=%y              " filetype
set statusline+=%m              " modified
set statusline+=%=\             " left/right separator
set statusline+=\ %4l:%-3v      " row:virtual-column
set statusline+=%4.P\           " percent through file

" }}}

" }}}

" ::::::::: Searching :::::::::::::::::::::::: {{{

nnoremap \<Space> :set hlsearch!<CR>

set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ...unless they contain a capital letter

" }}}

" ::::::::: Navigation ::::::::::::::::::::::: {{{

set foldmethod=marker

" soft line-breaks
nnoremap   <Up> gk
inoremap   <Up> <C-o>gk
nnoremap <Down> gj
inoremap <Down> <C-o>gj

" }}}

" ::::::::: Editing :::::::::::::::::::::::::: {{{

" autocomplete parens, brackets, braces
inoremap (<CR> (<CR>)<Esc>O<Tab>
inoremap [<CR> [<CR>]<Esc>O<Tab>
inoremap {<CR> {<CR>}<Esc>O<Tab>

" exit insert mode
inoremap    kj <Esc>`^
inoremap    jk <Esc>`^
inoremap <C-[> <Esc>`^

" open above / below current line
inoremap <S-CR> <C-o>O
inoremap <C-CR> <C-o>o
" insert above / below current line
nnoremap <S-Space> mzO<Esc>j`z
nnoremap <C-Space> mzo<Esc>k`z

" toggle case
inoremap <Leader>` <Esc>viwg~gi

" delete to start of line
inoremap <C-BS> <C-U>

" surround in quotes
nnoremap <Leader>' mZviwva'<Esc>`<i'<Esc>`Zl
vnoremap <Leader>' va'<Esc>`<i'<Esc>`<lv`>l
nnoremap    <Bar>" mZviwva"<Esc>`<i"<Esc>`Zl
vnoremap    <Bar>" va"<Esc>`<i"<Esc>`<lv`>l

" bubble text up / down
nnoremap <silent> <M-Up> mZ:move .-2<CR>==`Z
nnoremap <silent> <M-Down> mZ:move .+1<CR>==`Z
inoremap          <M-Up> <Esc>:move .-2<CR>==gi
inoremap          <M-Down> <Esc>:move .+1<CR>==gi
vnoremap          <M-Up> :move '<-2<CR>gv=gv
vnoremap          <M-Down> :move '>+1<CR>gv=gv

" bubble text left / right
vnoremap <M-Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
vnoremap <M-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o

" visual indent
vnoremap < <gv
vnoremap > >gv

" }}}

" ::::::::: FileType ::::::::::::::::::::::::: {{{

" vim {{{

augroup filetype_vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> <C-_> mAI"<Esc>`Al
  autocmd FileType vim vnoremap <buffer> <C-_> <Esc>`<mA`>mZ'<<C-v>'>I"<Esc>g`Alvg`Zl
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" ruby {{{

augroup filetype_ruby
  autocmd!
  autocmd FileType ruby nnoremap <buffer> <C-_> mZI#<Esc>`Zl
  autocmd FileType ruby vnoremap <buffer> <C-_> <Esc>`<mA`>mZ'<<C-v>'>I"<Esc>g`Alvg`Zl
  autocmd FileType ruby :iabbrev <buffer> iff if<CR>end<Esc>kA
augroup END

" }}}

" erb {{{

augroup filetype_erb
  autocmd!
  autocmd FileType erb :iabbrev <buffer> erb <% %><Left><Left><Left>
  autocmd FileType erb :iabbrev <buffer> erp <%= %><Left><Left><Left>
  autocmd FileType erb :iabbrev <buffer> erc <%# %><Left><Left><Left>
  autocmd FileType erb :iabbrev <buffer> iff <% if %><% end %><Left><Left><Left><Left><Left><Left><Left><Left><Left>
augroup END

" }}}

" python {{{

augroup filetype_python
  autocmd!
  autocmd FileType python nnoremap <buffer> <C-_> mZI#<Esc>`Zl
  autocmd FileType python vnoremap <buffer> <C-_> <Esc>`<mA`>mZ'<<C-v>'>I"<Esc>g`Alvg`Zl
  autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

" }}}

" javascript {{{

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END

" }}}

" markdown {{{

augroup filetype_markdown
  autocmd!
  autocmd FileType markdown :onoremap <buffer> ih :<C-u>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:nohlsearch\rkvg_"<CR>
  autocmd FileType markdown :onoremap <buffer> ah :<C-u>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:nohlsearch\rVk"<CR>
augroup END

" }}}

" }}}

" ::::::::: Operator Pending ::::::::::::::::: {{{

" in last / next braces
onoremap il( :<C-u>normal! F)vi(<CR>
onoremap in( :<C-u>normal! f(vi(<CR>
onoremap il[ :<C-u>normal! F]vi[<CR>
onoremap in[ :<C-u>normal! f[vi[<CR>
onoremap il{ :<C-u>normal! F}vi{<CR>
onoremap in{ :<C-u>normal! f{vi{<CR>

" around last / next braces
onoremap al( :<C-u>normal! F)va(<CR>
onoremap an( :<C-u>normal! f(va(<CR>
onoremap al[ :<C-u>normal! F]va[<CR>
onoremap an[ :<C-u>normal! f[va[<CR>
onoremap al{ :<C-u>normal! F}va{<CR>
onoremap an{ :<C-u>normal! f{va{<CR>

" }}}

" ::::::::: Wild Settings :::::::::::::::::::: {{{

set wildmenu

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" }}}

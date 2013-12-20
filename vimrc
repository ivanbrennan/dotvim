" ::::::::: Vimrc ::::::::::::::::::::::::::::::::::::::::

set nocompatible           " be iMproved
set encoding=utf-8         " default encoding to UTF-8
filetype off               " required for Vundle!

" ::::::::: Vundle ::::::::::::::::::::::::::: {{{

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" original repos on Github
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
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
set history=50                  " history 50-deep

" }}}

" ::::::::: Mappings ::::::::::::::::::::::::: {{{

let mapleader="\\"
let maplocalleader="-"
set timeout timeoutlen=300 ttimeoutlen=100

augroup vimrcgroup  " auto-reload vimrc when it's saved
  autocmd!
  autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" }}}

" ::::::::: Buffers :::::::::::::::::::::::::: {{{

set hidden          " allow hidden buffers

nnoremap  <Leader>t :NERDTreeToggle<CR>
nnoremap  <Leader>p :pwd<CR>
nnoremap <Leader>cd :lcd<Space>

nnoremap  <Leader>` :source $MYVIMRC<CR>
nnoremap <Leader>`` :vsplit $MYVIMRC<CR>

nnoremap  <Leader>b :buffers<CR>
nnoremap      <C-p> :bprevious<CR>
nnoremap      <C-n> :bnext<CR>

nnoremap <Leader>ee :edit<Space>~/
nnoremap  <Leader>e :edit<Space>
nnoremap  <Leader>w :write<CR>
nnoremap  <Leader>q :quit<CR>

nnoremap  <Leader>d :bdelete<CR>
nnoremap  <Leader>c :bprevious<CR>:bdelete#<CR>

" }}}

" ::::::::: Tabs & Splits :::::::::::::::::::: {{{

nnoremap tt :tabnew<CR>
nnoremap tn :tabnew<Space>
nnoremap th :tabprevious<CR>
nnoremap tl :tabnext<CR>

"function! SwitchSplit()
"endfunc

nnoremap  <Leader>s :split<CR>
nnoremap <Leader>es :split<Space>
nnoremap  <Leader>v :vsplit<CR>
nnoremap <Leader>ev :vsplit<Space>

nnoremap  <Leader>a :only<CR>

" previous / next
nnoremap <S-Tab> <C-w>W
nnoremap   <Tab> <C-w><C-w>

" replace this with SwitchSplit()
nnoremap <Leader>xs <C-W>t<C-W>K
nnoremap <Leader>xv <C-W>t<C-W>H

" resize
nnoremap         __ <C-W>_
nnoremap <bar><bar> <C-W><bar>
nnoremap         ++ <C-W>=

" }}}

" ::::::::: Appearance ::::::::::::::::::::::: {{{

set number        " line numbers
set ruler         " line and column number
set nowrap        " don't wrap lines
syntax enable     " syntax highlighting, local overrides
set guifont=Source\ Code\ Pro:h16

" ·············· Whitespace ·················· {{{

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

" ······················ Colors ·············· {{{

colorscheme ivisu

nnoremap <Leader>1 :colo<Space>ivisu<CR>
nnoremap <Leader>2 :colo<Space>smyck<CR>
nnoremap <Leader>3 :colo<Space>smyckblue<CR>
nnoremap <Leader>4 :colo<Space>mustang<CR>
nnoremap <Leader>5 :colo<Space>mustangblue<CR>
nnoremap <Leader>6 :colo<Space>github<CR>
nnoremap <Leader>7 :colo<Space>ivanized<CR>
nnoremap <Leader>8 :colo<Space>hemisu<CR>
nnoremap <Leader>9 :colo<Space>muon<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

call togglebg#map("")
nnoremap <Leader>g :ToggleBG<CR>
nnoremap <Leader>h :call HexHighlight()<CR>
nnoremap <Leader>y :call <SID>SynStack()<CR>

" }}}

" ·················· Line Numbers ············ {{{

nnoremap <LocalLeader>n :set number!<CR>
nnoremap <LocalLeader>r :set relativenumber!<CR>

set cursorline

" hilight line number
highlight clear CursorLine
augroup CLClear
  autocmd! ColorScheme * highlight clear CursorLine
augroup END

" }}}

" ····················· Cursor ··············· {{{

set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0

" }}}

" ···················· Dividers ·············· {{{

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

nnoremap <LocalLeader>h :set hlsearch!<CR>

set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ...unless they contain a capital letter

" }}}

" ::::::::: Navigation ::::::::::::::::::::::: {{{

if has('mouse')
  set mouse=a
endif

" soft line-breaks
nnoremap   <Up> gk
inoremap   <Up> <C-o>gk
nnoremap <Down> gj
inoremap <Down> <C-o>gj

" page up / down
nnoremap <S-Space> <C-b>
nnoremap   <Space> <C-f>

" scroll up / down
nnoremap <C-k> <C-y>
vnoremap <C-k> <C-y>
nnoremap <C-j> <C-e>
vnoremap <C-j> <C-e>

" start / end of line
nnoremap <C-h> 0
nnoremap <C-l> $

" }}}

" ::::::::: Editing :::::::::::::::::::::::::: {{{

set pastetoggle=<LocalLeader>p

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
nnoremap <S-CR> mzO<Esc>j`z
nnoremap <C-CR> mzo<Esc>k`z

" toggle case
inoremap <C-U> <Esc>viwg~gi

" delete to start of line
inoremap <C-BS> <C-U>

" select current word
nnoremap <Space> viw

" delete line
nnoremap <LocalLeader>d dd

" surround in quotes
nnoremap <Leader>' mZviwva'<Esc>`<i'<Esc>`Zl
vnoremap <Leader>' va'<Esc>`<i'<Esc>`<lv`>l
nnoremap    <Bar>" mZviwva"<Esc>`<i"<Esc>`Zl
vnoremap    <Bar>" va"<Esc>`<i"<Esc>`<lv`>l

" ··················· Bubbling ·······························

nnoremap <silent> <C-Up> mZ:move .-2<CR>==`Z
nnoremap <silent> <C-Down> mZ:move .+1<CR>==`Z
inoremap          <C-Up> <Esc>:move .-2<CR>==gi
inoremap          <C-Down> <Esc>:move .+1<CR>==gi
vnoremap          <C-Up> :move '<-2<CR>gv=gv
vnoremap          <C-Down> :move '>+1<CR>gv=gv

vnoremap <C-S-Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
vnoremap <C-S-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o

" visual indent
vnoremap < <gv
vnoremap > >gv

" }}}

" ::::::::: Abbreviations :::::::::::::::::::::::::::: {{{

iabbrev @@ ivan.brennan@gmail.com

" }}}

" ::::::::: Filetype ::::::::::::::::::::::::::::::::: {{{

" vim {{{

augroup filetype_vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> <LocalLeader><LocalLeader> mZI"<Esc>`Zl
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" ruby {{{

augroup filetype_ruby
  autocmd!
  autocmd FileType ruby nnoremap <buffer> <LocalLeader><LocalLeader> mZI#<Esc>`Zl
  autocmd FileType ruby       :iabbrev <buffer> iff if<CR>end<Esc>kA
augroup END

" }}}

" erb {{{

augroup filetype_erb
  autocmd!
  autocmd FileType erb        :iabbrev <buffer> erb <% %><Left><Left><Left>
  autocmd FileType erb        :iabbrev <buffer> erp <%= %><Left><Left><Left>
  autocmd FileType erb        :iabbrev <buffer> erc <%# %><Left><Left><Left>
  autocmd FileType erb        :iabbrev <buffer> iff <% if %><% end %><Left><Left><Left><Left><Left><Left><Left><Left><Left>
augroup END

" }}}

" python {{{

augroup filetype_python
  autocmd!
  autocmd FileType python nnoremap <buffer> <LocalLeader><LocalLeader> mZI#<Esc>`Zl
  autocmd FileType python     :iabbrev <buffer> iff if:<left>
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

" ::::::::: Operator Pending ::::::::::::::::::::::::: {{{

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

" ::::::::: Wild Settings :::::::::::::::::::::::::::: {{{

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

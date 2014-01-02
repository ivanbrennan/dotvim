" ::::::::: vimrc ::::::::::::::::::::::::::::::::::::::::

set nocompatible           " be iMproved
set encoding=utf-8         " default encoding to UTF-8

" ::::::::: Vundle & Plugins ::::::::::::::::: {{{1

filetype off               " required for Vundle!
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" github repos: general
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tsaleh/vim-matchit'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'ivanbrennan/grep-operator'
Bundle 'ivanbrennan/quickfix-toggle'
Bundle 'ivanbrennan/potion'

" github repos: colors
Bundle 'vim-scripts/hexHighlight.vim'
Bundle 'guns/xterm-color-table.vim'
Bundle 'shawncplus/Vim-toCterm'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gregsexton/Muon'

filetype plugin indent on       " required!

" ··········· plugin options ················· {{{2

" NERDTree {{{3
let NERDTreeChDirMode=2             " change CWD whenever root is changed
let NERDTreeMinimalUI=1             " minimal UI
" NERDTree cursorline
augroup NerdCursor
  autocmd!
  autocmd BufEnter NERD_tree_* hi CursorLine gui=underline
  autocmd BufLeave NERD_tree_* highlight clear CursorLine
  autocmd BufAdd * highlight clear CursorLine
augroup END

" ::::::::: Backup and Swap Files :::::::::::: {{{1

set backup                      " backup files...
set backupdir=~/.vim/backup     " ...to here
set directory=~/.vim/tmp        " all temp files here
set history=500                 " history 500-deep

" ::::::::: Options :::::::::::::::::::::::::: {{{1

" disable intro message
set shortmess+=I

" show commands (disable if this slows things down)
set showcmd

" don't beep
set visualbell

" don't auto-comment with o or O
set formatoptions-=o

" let J handle comments intelligently
set formatoptions+=j

" use this if 'i' flag slows down ins-completion
"set complete-=i

" ::::::::: Mappings ::::::::::::::::::::::::: {{{1

set timeout timeoutlen=250 ttimeoutlen=100

" virtual leader
map <Space> <Leader>

" leader keys
let mapleader="\\"
let maplocalleader=","

" source / edit vimrc
noremap <LocalLeader>sv :source $MYVIMRC<CR>
noremap <LocalLeader>ev :edit $MYVIMRC<CR>

augroup vimrcgroup    " auto-reload vimrc when it's saved
  autocmd!
  autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" lazy finger
noremap <Leader><Space> :
noremap ; :
noremap - $

" replace ; and ,
noremap + ;
noremap _ ,

" sensible marks
noremap ` '
noremap ' `

" window size
noremap <Leader>wh :set lines=21<CR>
noremap <Leader>wf :set lines=38<CR>

" ::::::::: Buffers :::::::::::::::::::::::::: {{{1

set hidden        " allow hidden buffers

" navigators
noremap          <S-CR> :buffers<CR>:b
noremap          <C-CR> :NERDTreeToggle<CR>
noremap   <Leader><Tab> :NERDTreeToggle<CR>
noremap        <S-C-CR> :NERDTreeClose<CR>
noremap <Leader><S-Tab> :NERDTreeClose<CR>

" current directory
noremap <Leader>wd :pwd<CR>
noremap <silent> <Leader>cd :lcd %:h<CR>

" close
noremap <Leader>bd :bdelete<CR>
noremap <Leader>bc :bprevious<CR>:bdelete#<CR>

" ··········· edit ··························· {{{2

noremap <Leader>eh :edit ~/
noremap <Leader>ew :edit <C-R>=expand('%:h').'/'<CR>
noremap <Leader>es :split <C-R>=expand('%:h').'/'<CR>
noremap <Leader>ev :vsplit <C-R>=expand('%:h').'/'<CR>
noremap <Leader>et :tabedit <C-R>=expand('%:h').'/'<CR>

" ··········· split ·························· {{{2

" open / close
noremap <Leader>s :split<CR>
noremap <Leader>v :vsplit<CR>
noremap <Leader>o :only<CR>

" resize
noremap <Leader>- <C-W>_
"noremap <Leader>\ <C-W><Bar>
noremap <Leader>= <C-W>=

"function! SwitchSplit()
"endfunc

" replace this with SwitchSplit()
"noremap <Leader><Leader>s <C-W>t<C-W>K
"noremap <Leader><Leader>v <C-W>t<C-W>H

" ··········· navigate ······················· {{{2

" buffers / tabs
noremap <Leader>j :bprevious<CR>
noremap <Leader>k :bnext<CR>
noremap <Leader>h :tabprevious<CR>
noremap <Leader>l :tabnext<CR>

" splits
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" ::::::::: Appearance ::::::::::::::::::::::: {{{1

set title           " xterm title
set number          " line numbers
set nowrap          " don't wrap lines
set sidescroll=1    " smooth sidescroll
set showbreak=\ \   " indent wrapped lines
set linebreak       " break at word boundaries
syntax enable       " syntax highlighting, local overrides

if has("gui_running")
  set transparency=5
  set guifont=Source\ Code\ Pro:h15
endif

noremap <LocalLeader>y :call SynStack()<CR>
function! SynStack() " {{{
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}

" toggle wrapping
noremap <Leader>ww :set wrap! list! wrap?<CR>

" hex highlight
noremap <LocalLeader>h :call HexHighlight()<CR>

" ··········· whitespace ····················· {{{2

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

" ··········· colors ························· {{{2

" toggle background
call togglebg#map("")
noremap <LocalLeader>b :ToggleBG<CR>

colorscheme ivisu

nnoremap  <Leader>1 :colo<Space>ivisu<CR>:colorscheme<CR>
nnoremap <Leader>11 :colo<Space>hemisu<CR>:colorscheme<CR>
nnoremap  <Leader>2 :colo<Space>smyck<CR>:colorscheme<CR>
nnoremap <Leader>22 :colo<Space>smyckblue<CR>:colorscheme<CR>
nnoremap  <Leader>3 :colo<Space>mustang<CR>:colorscheme<CR>
nnoremap <Leader>33 :colo<Space>mustangblue<CR>:colorscheme<CR>
nnoremap  <Leader>4 :colo<Space>github<CR>:colorscheme<CR>
nnoremap  <Leader>5 :colo<Space>ivanized<CR>:colorscheme<CR>
nnoremap  <Leader>6 :colo<Space>muon<CR>:colorscheme<CR>
nnoremap  <Leader>7 :colo<Space>tir_black<CR>:colorscheme<CR>
nnoremap <Leader>77 :colo<Space>ir_black<CR>:colorscheme<CR>
nnoremap  <Leader>8 :colo<Space>xoria256<CR>:colorscheme<CR>

" ··········· line numbers ··················· {{{2

noremap <Leader>n :set number! number?<CR>
noremap <Leader>r :set relativenumber! relativenumber?<CR>

" hilight line number
set cursorline                " turn on cursorline
highlight clear CursorLine    " highlight line-number only
augroup cursorline
  autocmd! ColorScheme * highlight clear CursorLine
augroup END

" ··········· cursor ························· {{{2

set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0

" ··········· status line ····················· {{{2

set fillchars+=vert:\           " clean dividers
set laststatus=2                " show statusline

set statusline=
set statusline+=%<              " cut at start
set statusline+=\ %f\           " path
set statusline+=%y              " filetype
set statusline+=%m              " modified
set statusline+=%=\             " left/right separator
set statusline+=(%l/%L):%-3v    " row:virtual-column
set statusline+=%4.P\           " percent through file

" ::::::::: Gui Settings ::::::::::::::::::::: {{{1

" force these mappings after gvimrc has run
augroup gui_group
  autocmd!
  autocmd GUIEnter * nnoremap <silent> <M-Up> mZ:move .-2<CR>==`Z
  autocmd GUIEnter * vnoremap          <M-Up> :move '<-2<CR>gv=gv
  autocmd GUIEnter * inoremap          <M-Up> <Esc>:move .-2<CR>==gi
  autocmd GUIEnter * nnoremap <silent> <M-Down> mZ:move .+1<CR>==`Z
  autocmd GUIEnter * vnoremap          <M-Down> :move '>+1<CR>gv=gv
  autocmd GUIEnter * inoremap          <M-Down> <Esc>:move .+1<CR>==gi
  " bubble text left / right
  autocmd GUIEnter * vnoremap  <M-Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
  autocmd GUIEnter * vnoremap <M-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o
augroup END

" ::::::::: Navigation ::::::::::::::::::::::: {{{1

set foldmethod=marker
set scrolloff=2

" soft line-breaks
noremap    <Up> gk
noremap  <Down> gj
" behave normally if popup-menu visible
inoremap   <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>
inoremap <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>

" ::::::::: Editing :::::::::::::::::::::::::: {{{1

" format entire file
noremap <LocalLeader>fef :normal! gg=G``<CR>

" whole line completion
inoremap <C-L> <C-X><C-L>

" autocomplete parens, brackets, braces
inoremap (<CR> (<CR>)<Esc>O<Tab>
inoremap [<CR> [<CR>]<Esc>O<Tab>
inoremap {<CR> {<CR>}<Esc>O<Tab>

" exit insert mode
inoremap    kj <Esc>`^
inoremap    jk <Esc>`^
inoremap <C-[> <Esc>`^

" open above / below current line
inoremap <S-CR> <C-O>O
inoremap <C-CR> <C-O>o
" insert above / below current line
noremap <S-Space> mzO<Esc>j`z
noremap <C-Space> mzo<Esc>k`z

" toggle case
inoremap <LocalLeader>` <Esc>viwg~gi

" paste toggle
noremap <LocalLeader>t :set paste! paste?<CR>
noremap           <F4> :set paste! paste?<CR>
set pastetoggle=<F4>

" bubble text up / down
nnoremap <silent> <Leader><Up> mZ:move .-2<CR>==`Z
vnoremap          <Leader><Up> :move '<-2<CR>gv=gv
nnoremap <silent> <Leader><Down> mZ:move .+1<CR>==`Z
vnoremap          <Leader><Down> :move '>+1<CR>gv=gv
" bubble text left / right
vnoremap  <Leader><Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
vnoremap <Leader><Right> <Esc>`><Right>gvxpgv<Right>o<Right>o

" ::::::::: Searching :::::::::::::::::::::::: {{{1

set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ...unless they contain a capital letter

" toggle search highlighting
noremap <LocalLeader><Space> :set hlsearch! hlsearch?<CR>

" find merge conflicts
noremap <silent> <LocalLeader>cc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" ::::::::: FileType ::::::::::::::::::::::::: {{{1

" ··········· vim ···························· {{{2
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  " comments
  autocmd FileType vim nnoremap <buffer> <C-_> mA0i"<Esc>`Al
  autocmd FileType vim vnoremap <buffer> <C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END
" ··········· ruby ··························· {{{2
augroup filetype_ruby
  autocmd!
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  " complete buffer loading can cause code execution
  " turn this off if it's a concern
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
  autocmd FileType ruby let g:rubycomplete_rails = 1
  " if snippet
  autocmd FileType ruby :inoreabbrev <buffer> iff if<CR>end<Esc>kA
  " comments
  autocmd FileType ruby nnoremap <buffer> <C-_> mZ0i#<Esc>`Zl
  autocmd FileType ruby vnoremap <buffer> <C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END
" ··········· eruby ·························· {{{2
augroup filetype_eruby
  autocmd!
  autocmd FileType eruby set omnifunc=rubycomplete#Complete
  " complete buffer loading can cause code execution
  " turn this off if it's a concern
  autocmd FileType eruby let g:rubycomplete_buffer_loading=1
  autocmd FileType eruby let g:rubycomplete_classes_in_global=1
  autocmd FileType eruby let g:rubycomplete_rails = 1
  autocmd FileType eruby :inoreabbrev <buffer> erb <% %><Left><Left><Left>
  autocmd FileType eruby :inoreabbrev <buffer> erp <%= %><Left><Left><Left>
  autocmd FileType eruby :inoreabbrev <buffer> erc <%# %><Left><Left><Left>
  autocmd FileType eruby :inoreabbrev <buffer> iff <% if %><% end %><Left><Left><Left><Left><Left><Left><Left><Left><Left>
augroup END
" ··········· python ························· {{{2
augroup filetype_python
  autocmd!
  autocmd FileType python :inoreabbrev <buffer> iff if:<left>
  " comments
  autocmd FileType python nnoremap <buffer> <C-_> mZ0i#<Esc>`Zl
  autocmd FileType python vnoremap <buffer> <C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END
" ··········· javascript ····················· {{{2
augroup filetype_javascript
  autocmd!
  " if statement
  autocmd FileType javascript :inoreabbrev <buffer> iff if ()<Left>
  " add semicolon
  autocmd FileType javascript noremap <buffer> <Leader>; mZA;<Esc>`Z
augroup END
" ··········· markdown ······················· {{{2
augroup filetype_markdown
  autocmd!
  autocmd FileType markdown :onoremap <buffer> ih :<C-U>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:nohlsearch\rkvg_"<CR>
  autocmd FileType markdown :onoremap <buffer> ah :<C-U>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:nohlsearch\rVk"<CR>
augroup END

" ::::::::: Abbreviations :::::::::::::::::::: {{{1

" shortcuts
noreabbrev fnn function
noreabbrev fn! function!

" common typos
noreabbrev verison version
noreabbrev funiction function
noreabbrev funcition function
noreabbrev funciotn function
noreabbrev funciton function

" ::::::::: Operator Pending ::::::::::::::::: {{{1

" in last / next braces
onoremap il( :<C-U>normal! F)vi(<CR>
onoremap in( :<C-U>normal! f(vi(<CR>
onoremap il[ :<C-U>normal! F]vi[<CR>
onoremap in[ :<C-U>normal! f[vi[<CR>
onoremap il{ :<C-U>normal! F}vi{<CR>
onoremap in{ :<C-U>normal! f{vi{<CR>

" around last / next braces
onoremap al( :<C-U>normal! F)va(<CR>
onoremap an( :<C-U>normal! f(va(<CR>
onoremap al[ :<C-U>normal! F]va[<CR>
onoremap an[ :<C-U>normal! f[va[<CR>
onoremap al{ :<C-U>normal! F}va{<CR>
onoremap an{ :<C-U>normal! f{va{<CR>

" ::::::::: Function Keys :::::::::::::::::::: {{{1

" <F1> Help
" <F4> pastetoggle (see editing)

" ::::::::: Wild Settings :::::::::::::::::::: {{{1

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

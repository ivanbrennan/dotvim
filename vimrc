set nocompatible                " be iMproved
filetype off                    " required for Vundle!

" :::::::::: Vundle - Vim Plugins :::::::::::::

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" original repos on Github
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/hexHighlight.vim'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'guns/xterm-color-table.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'shawncplus/Vim-toCterm'

filetype plugin indent on       " required!

" :::::::::::::: Basic Setup ::::::::::::::::::

set number                      " line numbers
set ruler                       " line and column number
syntax enable                   " syntax highlighting allowing local overrides
set encoding=utf-8              " default encoding to UTF-8

"set guifont=Monaco:h16
set guifont=Source\ Code\ Pro:h16

" ::::::::::: Backup and Swap Files :::::::::::

set backup                      " backup files...
set backupdir=~/.vim/backup     " ...to here
set directory=~/.vim/tmp        " all temp files here
set history=50                  " history 50-deep

" ::::::::::::::: Whitespace ::::::::::::::::::

set nowrap                      " don't wrap lines
set tabstop=2                   " tab is two spaces
set shiftwidth=2                " autoindent (with <<) is two spaces
set expandtab                   " convert tabs to spaces
set backspace=indent,eol,start  " backspace through everything in insert mode
set textwidth=0                 " no autowrap

" list chars
set list                        " show invisible characters
set listchars=""                " reset the listchars
set listchars=tab:@-            " tab as "  "
set listchars+=trail:.          " trailing spaces as dots
set listchars+=extends:>        " when line continues offscreen
set listchars+=precedes:<       " when line precedes offscreen

" ::::::::::::::: Mapleader :::::::::::::::::::

set timeout timeoutlen=200 ttimeoutlen=100

let mapleader="\\"

" edit/reload vimrc
nnoremap <Leader>er :e $MYVIMRC<CR>
nnoremap <Leader>r :so $MYVIMRC<CR>

" NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>

" keycodes for ctrl up / down
set <F13>=[A
set <F14>=[B

" :::::::::::::::: Searching ::::::::::::::::::

set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ...unless they contain a capital letter

" clear search hilights
nnoremap <Leader>/ :nohlsearch<CR>

" ::::::::::::::::: Colors ::::::::::::::::::::

nnoremap <Leader>1 :colo<Space>ivisu<CR>
nnoremap <Leader>2 :colo<Space>smyck<CR>
nnoremap <Leader>3 :colo<Space>smyckblue<CR>
nnoremap <Leader>4 :colo<Space>mustang<CR>
nnoremap <Leader>5 :colo<Space>mustangblue<CR>
nnoremap <Leader>6 :colo<Space>github<CR>
nnoremap <Leader>7 :colo<Space>ivanized<CR>
nnoremap <Leader>8 :colo<Space>hemisu<CR>
nnoremap <Leader>9 :colo<Space>zenburn<CR>

colorscheme ivisu

call togglebg#map("")

nnoremap <Leader>g :ToggleBG<CR>

" show highlighting groups for current word
nnoremap <Leader>y :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" toggle HexHighlight()
nnoremap <Leader>i :call HexHighlight()<CR>

" ::::::::::::::: Line Numbers ::::::::::::::::

set cursorline

hi clear CursorLine             " hilight line number
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" relative numbers
nnoremap <Leader>n :call NumberToggle()<CR>
inoremap <Leader>n <Esc>:call NumberToggle()<CR>gi

" ::::::::::::::::: Cursor ::::::::::::::::::::

set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0

" :::::::::::::::: Dividers :::::::::::::::::::

set fillchars+=vert:\           " clean dividers
set laststatus=2                " show statusline

set statusline=
set statusline+=%<              " cut at start
set statusline+=\ %f\           " path

"set statusline+=%#vertsplit#
set statusline+=%y              " filetype
set statusline+=%m              " modified
"set statusline+=%*

set statusline+=%=\             " left/right separator

"set statusline+=%#vertsplit#
set statusline+=%4.P\           " percent through file
"set statusline+=%*

set statusline+=\ %4l:%-3c      " column

" :::::::::::::::::: Splits :::::::::::::::::::

set splitbelow                  " open new splits below
set splitright                  " open new splits on right

" implement this when you know how
"function! SwitchSplit()
"endfunc

" split horizontal / vertical
nnoremap <Leader>s :sp<CR>
nnoremap <Leader>v :vsp<CR>
" edit horizontal / vertical
nnoremap <Leader>es :sp<Space>
nnoremap <Leader>ev :vsp<Space>
" only current
nnoremap <Leader>a :on<CR>

" navigate splits
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" previous / next
nnoremap <S-Tab> <C-w>W
nnoremap <Tab> <C-w><C-w>

" switch to vertical / horizontal...
" ...replace this with SwitchSplit()
nnoremap <Leader>xs <C-W>t<C-W>K
nnoremap <Leader>xv <C-W>t<C-W>H
" maximize horizontal / vertical
nnoremap _ <C-W>_
nnoremap <bar> <C-W><bar>
" equalize
nnoremap + <C-W>=

" ::::::::::::: Buffers and Tabs ::::::::::::::

" previous / next buffer
nmap <F14> <C-Down>
nnoremap <C-Down> :bprevious<CR>
nmap <F13> <C-Up>
nnoremap <C-Up> :bnext<CR>

" list
nnoremap <Leader>b :ls<CR>

" open / save / quit / save and quit
nnoremap <Leader>e :e<Space>
nnoremap <Leader>h :e<Space>~/
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" close
nnoremap <Leader>d :bd<CR>
" close, keep window
nnoremap <Leader>c :bp<CR>:bd#<CR>

" pwd / cd
nnoremap <Leader>p :pwd<CR>
nnoremap <Leader>cd :cd<Space>

" open in new tab
nnoremap <Leader>et :tabe<Space>

" previous / next tab
nnoremap <S-Left> gT
nnoremap <S-Right> gt

" ::::::::::::::: Navigation ::::::::::::::::::

" soft line-breaks
nnoremap <Up> gk
inoremap <Up> <C-o>gk
nnoremap <Down> gj
inoremap <Down> <C-o>gj

" beginning of line
"nnoremap <C-h> 0
"inoremap <C-h> <Esc>0i
" end of line
"nnoremap <C-l> $
"inoremap <C-l> <Esc>$a
" first character in line
nnoremap hw ^
inoremap hw <Esc>^i

" first / last line
"nnoremap jkk gg
"nnoremap kjj G

" scroll up / down
nnoremap <D-k> <C-y>
vnoremap <D-k> <C-y>
nnoremap <D-j> <C-e>
vnoremap <D-j> <C-e>

" ::::::::::::::::: Editing :::::::::::::::::::

" pastetoggle on / off
nnoremap ip :set paste paste?<CR>i
nnoremap np :set nopaste<CR>

" autocomplete parens, brackets, braces
inoremap (<CR> (<CR>)<Esc>O<Tab>
inoremap [<CR> [<CR>]<Esc>O<Tab>
inoremap {<CR> {<CR>}<Esc>O<Tab>

" exit insert mode
inoremap <Tab> <Esc>`^
vnoremap <Tab> <Esc>gV
" insert Tab character
inoremap <Leader><Tab> <Tab>

" delete to start / end of line
nnoremap dh d0
nnoremap dl d$

" open above / below current line
inoremap <S-Return> <C-o>O
inoremap <C-Return> <C-o>o
" insert above / below current line
nnoremap <S-Space> O<Esc>j
nnoremap <Space> o<Esc>k
" delete above / below current line
nnoremap d<Space>; kdd
nnoremap d<S-Space> jdd

" move line up / down
nnoremap <D-J> :m .+1<CR>==:<Esc>
inoremap <D-J> <Esc>:m .+1<CR>==gi:<Esc>
vnoremap <D-J> :m '>+1<CR>gv=gv:<Esc>
nnoremap <D-K> :m .-2<CR>==:<Esc>
inoremap <D-K> <Esc>:m .-2<CR>==gi:<Esc>
vnoremap <D-K> :m '<-2<CR>gv=gv:<Esc>

::" :::::::::::::: Wild Settings ::::::::::::::::

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


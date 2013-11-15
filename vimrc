set nocompatible        " be iMproved
filetype off            " required!

" :::::::::: Vundle - Vim Plugins :::::::::::::

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" my bundles here:
" original repos on github
Bundle 'scrooloose/nerdtree'
" vim-scripts repos
"Bundle 'FuzzyFinder'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on       " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" :::::::::::::: Basic Setup ::::::::::::::::::

set number                " line numbers
set ruler                 " line and column number
syntax enable             " syntax highlighting allowing local overrides
set encoding=utf-8        " default encoding to UTF-8

" ::::::::::::::: Whitespace ::::::::::::::::::

set nowrap                      " don't wrap lines
set tabstop=2                   " tab is two spaces
set shiftwidth=2                " autoindent (with <<) is two spaces
set expandtab                   " convert tabs to spaces
set backspace=indent,eol,start  " backspace through everything in insert mode

" list chars
set list                        " show invisible characters
set listchars=""                " reset the listchars
set listchars=tab:\ \           " tab as "  "
set listchars+=trail:.          " trailing spaces as dots
set listchars+=extends:>        " when line continues offscreen
set listchars+=precedes:<       " when line precedes offscreen

" :::::::::::::: Customization ::::::::::::::::

set timeoutlen=200        " timeout on mappings and key codes
let mapleader="\\"

" edit/reload vimrc
nnoremap <Leader>er :e $MYVIMRC<CR>
nnoremap <Leader>re :so $MYVIMRC<CR>

" toggle NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" :::::::::::::::: Searching ::::::::::::::::::

set hlsearch          " highlight matches
set incsearch         " incremental searching
set ignorecase        " searches are case insensitive...
set smartcase         " ...unless they contain a capital letter

" clear search hilights
nnoremap <Leader>h :nohlsearch<CR>

" ::::::::::::::: Appearance ::::::::::::::::::

colorscheme smyck

" hilight line number
set cursorline
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

set laststatus=2

" build statusline
set statusline=
set statusline+=%<\            " cut at start
set statusline+=%#normal#
set statusline+=(%n)           " buffer
set statusline+=%*\ 
set statusline+=%f\            " path
set statusline+=%m             " modified
set statusline+=%y\            " filetype
set statusline+=%=\            " left/right separator
set statusline+=[%c]           " column
set statusline+=[%l/%L]\       " line/total
set statusline+=%#normal#
set statusline+=%P             " percent through file
set statusline+=%*\ 

" default font
set guifont=Source\ Code\ Pro:h16

" ::::::::::: Backup and Swap Files :::::::::::

set backup                      " backup files...
set backupdir=~/.vim/backup     " ...here
set directory=~/.vim/tmp        " all temp files
set history=50                  " history 50-deep

" :::::::::::::::::: Splits :::::::::::::::::::

set splitbelow                  " open new splits below
set splitright                  " open new splits on right

" previous / next
nnoremap wh <C-w>W
nnoremap wl <C-w><C-w>
" switch to vertical / horizontal
nnoremap <Leader>df <C-W>t<C-W>H
nnoremap <Leader>dc <C-W>t<C-W>K
" open in vertical / horizontal
nnoremap <Leader>fg :vsp<Space>
nnoremap <Leader>fv :sp<Space>
" add vertical / horizontal
nnoremap fgn :vsp<CR>
nnoremap fvn :sp<CR>

" ::::::::::::: Buffers and Tabs ::::::::::::::

" previous / next
nnoremap bp :bprevious<CR>
nnoremap bn :bnext<CR>

" list
nnoremap bl :ls<CR>

" open / save / quit / save and quit
nnoremap <Leader>ef :edit<Space>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" close
nnoremap bd :bd<CR>
" close, keep window
nnoremap bc :bp<CR>:bd#<CR>

" pwd / cd
nnoremap pwd :pwd<CR>
nnoremap cd :cd<Space>

" open in new tab
nnoremap <Leader>t :tabe<Space>

" ::::::::::::::::: Navigate ::::::::::::::::::

" soft line-breaks
nnoremap <Up> gk
inoremap <Up> <C-o>gk
nnoremap <Down> gj
inoremap <Down> <C-o>gj

" beginning of line
nnoremap <C-h> 0
inoremap <C-h> <Esc>0i
" end of line
nnoremap <C-l> $
inoremap <C-l> <Esc>$a
" first character in line
nnoremap hw ^
inoremap hw <Esc>^i

" first / last line
nnoremap jkk gg
nnoremap kjj G
" page up / down
nnoremap <C-u> <C-b>
nnoremap <C-n> <C-f>
" scroll up / down
nnoremap <C-k> <C-y>
nnoremap <C-j> <C-e>

" ::::::::::::::::: Editing :::::::::::::::::::

" pastetoggle on / off
nnoremap vi :set paste paste?<CR>i
nnoremap vk :set nopaste<CR>

" autocomplete parens, brackets, braces
inoremap (<CR> (<CR>)<Esc>O<Tab>
inoremap [<CR> [<CR>]<Esc>O<Tab>
inoremap {<CR> {<CR>}<Esc>O<Tab>

" exit insert mode
inoremap jk <Esc>

" delete to start / end of line
nnoremap dh d0
nnoremap dl d$

" lines
" open above / below current line
inoremap <S-Return> <C-o>O
inoremap <C-Return> <C-o>o
" insert above / below current line
nnoremap <S-Space> O<Esc>j
nnoremap <Space> o<Esc>k
" delete above / below current line
nnoremap d<Space>; kdd
nnoremap d<S-Space> jdd

" :::::::::::::: Colorswitching :::::::::::::::

nnoremap <Leader>c1 :colo<Space>vylight<CR>
nnoremap <Leader>c2 :colo<Space>blueshift<CR>
nnoremap <Leader>c3 :colo<Space>github<CR>
nnoremap <Leader>c4 :colo<Space>pyte<CR>
nnoremap <Leader>c5 :colo<Space>mayansmoke<CR>
nnoremap <Leader>c6 :colo<Space>slate<CR>
nnoremap <Leader>c7 :colo<Space>mustang<CR>
nnoremap <Leader>c8 :colo<Space>smyck<CR>

" :::::::::::::: Wild Settings ::::::::::::::::

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


""
"" Basic Setup
""

set nocompatible                " Use vim, no vi defaults
set number                      " Show line numbers
set ruler                       " Show line and column number
syntax enable                   " Turn on syntax highlighting allowing local overrides
set encoding=utf-8              " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                      " Don't wrap lines
set tabstop=2                   " Tab is two spaces
set shiftwidth=2                " Autoindent (with <<) is two spaces
set expandtab                   " Convert tabs to spaces
set backspace=indent,eol,start  " Backspace through everything in insert mode

" List chars
set list                        " Show invisible characters
set listchars=""                " Reset the listchars
set listchars=tab:\ \           " Show tab as "  "
set listchars+=trail:.          " Show trailing spaces as dots
set listchars+=extends:>        " Show when line continues offscreen
set listchars+=precedes:<       " Show when line precedes offscreen

""
"" Searching
""

set hlsearch      " Highlight matches
set incsearch     " Incremental searching
set ignorecase    " Searches are case insensitive...
set smartcase      " ...unless they contain a capital letter

""
"" Appearance
""

colorscheme smyck

set cursorline
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

set laststatus=2

set statusline=
set statusline+=%<\         " Cut at start
set statusline+=%#normal#
set statusline+=(%n)       " Buffer
set statusline+=%*\ 
set statusline+=%f\         " Path

set statusline+=%m          " Modified
set statusline+=%y\         " Filetype

set statusline+=%=\         " Left/right separator

set statusline+=[%c]        " Column
set statusline+=[%l/%L]\    " Line/total
set statusline+=%#normal#
set statusline+=%P        " Percent through file
set statusline+=%*\ 

set guifont=Source\ Code\ Pro:h16

set backup                      " keep a backup file
set backupdir=~/.vim/backup     " all backup files
set directory=~/.vim/tmp        " all temp files
set history=50                  " keep history 50-deep

"let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
"if &term == "screen"
"  set t_ts=^[k
"  set t_fs=^[\
"endif
"if &term == "screen" || &term == "xterm"
"  set title
"endif

set splitbelow                  " open new splits below
set splitright                  " open new splits on right

execute pathogen#infect()

"*-------------------------------------------------------*"
" KEY MAPS

set timeoutlen=200              " timeout on mappings and key codes

" Set leader
  let mapleader="\\"


" Quickly edit/reload vimrc
  nnoremap <Leader>er :e $MYVIMRC<CR>
  nnoremap <Leader>re :so $MYVIMRC<CR>

"*-------------------------------------------------------*"

"                         k
" Navigation:         j <-+-> l
"                        Spc
"
"  nnoremap j h
"  nnoremap <Space> j
"  nnoremap m j
"
" Navigate soft line-breaks
  nnoremap <Up> gk
  nnoremap <Down> gj
  inoremap <Up> <C-o>gk
  inoremap <Down> <C-o>gj

" Go to start of line
  nnoremap <C-h> 0
  inoremap <C-h> <Esc>0i
" Go to end of line
  nnoremap <C-l> $
  inoremap <C-l> <Esc>$a

" Goto first character in line
  nnoremap hw ^
  inoremap hw <Esc>^i

" Go to next word
"  nnoremap <C-l> w
"  inoremap <C-l> <Esc>lwi
" Go to previous word
"  nnoremap <C-j> b
"  inoremap <C-j> <Esc>bi

" Go to first line
  nnoremap jkk gg
" Go to last line
  nnoremap kjj G

" Page up
  nnoremap <C-u> <C-b>
" Page down
  nnoremap <C-n> <C-f>

" Half-page up
"  nnoremap <Space>jk <C-u>
" Half-page down
"  nnoremap kj<Space> <C-d>

" Scroll up 1 line
  nnoremap <C-k> <C-y>
" Scroll down 1 line
  nnoremap <C-j> <C-e>

" Clear search results
  nnoremap <Leader>h :nohlsearch<CR>

"*-------------------------------------------------------*"
" Editing:          i | jk   U | Y
"

" Use pastetoggle
  nnoremap vi :set paste paste?<CR>i
  nnoremap vk :set nopaste<CR>

" Autocomplete parens, brackets, braces, quotes
  inoremap ( ()<Esc>i
  inoremap [ []<Esc>i
  inoremap { {}<Esc>i
  inoremap (<CR> (<CR>)<Esc>O<Tab>
  inoremap [<CR> [<CR>]<Esc>O<Tab>
  inoremap {<CR> {<CR>}<Esc>O<Tab>
"  inoremap " ""<Esc>i

" Smarter braces from the wikia
" don't totally understand this
  inoremap ) <c-r>=ClosePair(')')<CR>
  inoremap ] <c-r>=ClosePair(']')<CR>
"  inoremap } <c-r>=ClosePair('}')<CR>
"  inoremap } <c-r>=CloseBracket()<CR>
"  inoremap " <c-r>=QuoteDelim('"')<CR>
"  inoremap ' <c-r>=QuoteDelim("'")<CR>

  function! ClosePair(char)
   if getline('.')[col('.') - 1] == a:char
   return "\<Right>"
   else
   return a:char
   endif
  endf

  function! CloseBracket()
   if match(getline(line('.') + 1), '\s*}') < 0
   return "\<CR>}"
   else
   return "\<Esc>j0f}a"
   endif
  endf

  function! QuoteDelim(char)
   let line = getline('.')
   let col = col('.')
   if line[col - 2] == "\\"
   "Inserting a quoted quotation mark into the string
   return a:char
   elseif line[col - 1] == a:char
   "Escaping out of the string
   return "\<Right>"
   else
   "Starting a string
   return a:char.a:char."\<Esc>i"
   endif
  endf

" Exit insert mode
  inoremap jk <Esc>

" Delete previous word
"  inoremap lkj <Esc>xdbi
" Delete next word
"  inoremap LKJ <Esc>ldwi

" Open newline above current line with no indent
"  nnoremap <Space>oj O<Esc>d0i
" Open newline below current line with no indent
"  nnoremap oj o<Esc>d0i

" Delete to end of line
  nnoremap dl d$
  inoremap <Leader>dl <Esc>d$i
" Delete to start of line
  nnoremap dh d0
  inoremap <Leader>dh <Esc>ld0i

" Clear and replace to end of line
"  nnoremap cjl c$
" Clear and replace to beginning of line
"  nnoremap clj c0
" Yank to end of line
"  nnoremap yjl y$
" Yank to beggining of line
"  nnoremap ylj y0

" Open new line above current line
"  nnoremap <Space>o O
  inoremap <S-Return> <C-o>O
" Open new line below current line
  inoremap <C-Return> <C-o>o

" Insert newline above current line
  nnoremap <S-Space> O<Esc>j
" Insert newline below current line
  nnoremap <Space> o<Esc>k

" Delete line above current line
  nnoremap d<Space>; kdd
" Delete line below current line
  nnoremap d<S-Space> jdd

" Undo
"  nnoremap U u
" Redo
"  nnoremap Y <C-r>

"*-------------------------------------------------------*"
" Buffer/SplitOperations:
"

" NERDTreeToggle
  nnoremap <Leader>n :NERDTreeToggle<CR>

" List buffers
  nnoremap bl :ls<CR>
" Close current buffer
  nnoremap bd :bd<CR>
" Close buffer, keep window
  nnoremap bc :bp<CR>:bd#<CR>

" Next buffer
  nnoremap bn :bnext<CR>
" Previous buffer
  nnoremap bp :bprevious<CR>
" Go right one split (cycle)
  nnoremap wl <C-w><C-w>
" Go left one split (cycle)
  nnoremap wh <C-w>W

" Switch horizontal split to vertical
  nnoremap <Leader>df <C-W>t<C-W>H
" Switch vertical split to horizontal
  nnoremap <Leader>dc <C-W>t<C-W>K

" Edit file in new tab
  nnoremap <Leader>t :tabe<Space>

" Edit file in vertical split
  nnoremap <Leader>fg :vsp<Space>
" Open blank vertical split
  nnoremap fgn :vsp<CR>
" Edit file in horizontal split
  nnoremap <Leader>fv :sp<Space>
" Open blank horizontal split
  nnoremap fvn :sp<CR>

" Save
  nnoremap <Leader>w :w<CR>
" Save and quit
  nnoremap <Leader>wq :wq<CR>
" Quit
  nnoremap <Leader>q :q<CR>

" Print working directory
  nnoremap pwd :pwd<CR>
" Change directory
  nnoremap cd :cd<Space>
" Edit file
  nnoremap ef :edit<Space>

"*-------------------------------------------------------*"
" Colorswitching
"

  nnoremap <Leader>c1 :colo<Space>vylight<CR>
  nnoremap <Leader>c2 :colo<Space>blueshift<CR>
  nnoremap <Leader>c3 :colo<Space>github<CR>
  nnoremap <Leader>c4 :colo<Space>pyte<CR>
  nnoremap <Leader>c5 :colo<Space>mayansmoke<CR>
  nnoremap <Leader>c6 :colo<Space>slate<CR>
  nnoremap <Leader>c7 :colo<Space>mustang<CR>
  nnoremap <Leader>c8 :colo<Space>smyck<CR>


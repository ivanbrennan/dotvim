set nocompatible           " be iMproved
set encoding=utf-8         " default encoding to UTF-8
filetype off               " required for Vundle!

" ::::::::::::::::: Vundle ::::::::::::::::::::

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" original repos on Github
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/hexHighlight.vim'
Bundle 'guns/xterm-color-table.vim'
Bundle 'shawncplus/Vim-toCterm'
Bundle 'altercation/vim-colors-solarized'
Bundle 'LaTeX-Box-Team/LaTeX-Box'

filetype plugin indent on       " required!

" ::::::::::: Backup and Swap Files :::::::::::

set backup                      " backup files...
set backupdir=~/.vim/backup     " ...to here
set directory=~/.vim/tmp        " all temp files here
set history=50                  " history 50-deep
set hidden                      " allow hidden buffers

" ::::::::::::::::: Mappings ::::::::::::::::::

let mapleader="\\"
set timeout timeoutlen=200 ttimeoutlen=100

" auto-reload vimrc when it's saved
augroup vimrcgroup
  autocmd!
  autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" ctrl up / down
set <F13>=[A
set <F14>=[B

" :::::::::::::::::: Buffers ::::::::::::::::::

nnoremap  <Leader>t :NERDTreeToggle<CR>
nnoremap  <Leader>d :pwd<CR>
nnoremap <Leader>cd :lcd<Space>

nnoremap <Leader>`` :edit $MYVIMRC<CR>
nnoremap  <Leader>` :source $MYVIMRC<CR>

nnoremap  <Leader>b :buffers<CR>
nnoremap      <D-[> :bprevious<CR>
nnoremap      <D-]> :bnext<CR>

nnoremap <Leader>ee :edit<Space>~/
nnoremap  <Leader>e :edit<Space>
nnoremap  <Leader>w :write<CR>
nnoremap  <Leader>q :quit<CR>

nnoremap <Leader>dd :bdelete<CR>
nnoremap <Leader>cc :bprevious<CR>:bdelete#<CR>

" ::::::::::::::: Tabs & Splits :::::::::::::::

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

" navigate splits
nnoremap   <C-k> <C-w>k
nnoremap   <C-j> <C-w>j
nnoremap   <C-h> <C-w>h
nnoremap   <C-l> <C-w>l
" previous / next
nnoremap <S-Tab> <C-w>W
nnoremap   <Tab> <C-w><C-w>

" replace this with SwitchSplit()
nnoremap <Leader>xs <C-W>t<C-W>K
nnoremap <Leader>xv <C-W>t<C-W>H

" resize
nnoremap     _ <C-W>_
nnoremap <bar> <C-W><bar>
nnoremap     + <C-W>=

" ::::::::::::::: Appearance ::::::::::::::::::

set number        " line numbers
set ruler         " line and column number
set nowrap        " don't wrap lines
syntax enable     " syntax highlighting, local overrides

set guifont=Source\ Code\ Pro:h16

" ··············· Whitespace ··················

set tabstop=2                   " tab is two spaces
set softtabstop=2               " softtab is two spaces
set shiftwidth=2                " autoindent is two spaces
set expandtab                   " convert tabs to spaces
set backspace=indent,eol,start  " backspace through everything in insert mode
set textwidth=0                 " no autowrap

set list                        " show invisible characters
set listchars=""                " reset the listchars
set listchars=tab:▸\            " tab
set listchars+=trail:·          " trailing space
set listchars+=extends:»        " continues offscreen
set listchars+=precedes:«       " precedes offscreen

" ················· Colors ····················

colorscheme ivisu

nnoremap <Leader>1 :colo<Space>ivisu<CR>
nnoremap <Leader>2 :colo<Space>smyck<CR>
nnoremap <Leader>3 :colo<Space>smyckblue<CR>
nnoremap <Leader>4 :colo<Space>mustang<CR>
nnoremap <Leader>5 :colo<Space>mustangblue<CR>
nnoremap <Leader>6 :colo<Space>github<CR>
nnoremap <Leader>7 :colo<Space>ivanized<CR>
nnoremap <Leader>8 :colo<Space>hemisu<CR>
nnoremap <Leader>9 :colo<Space>zenburn<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

call togglebg#map("")
nnoremap <Leader>g :ToggleBG<CR>
nnoremap <Leader>i :call HexHighlight()<CR>
nnoremap <Leader>y :call <SID>SynStack()<CR>

" ··············· Line Numbers ················

nnoremap <Leader>n :set number!<CR>
nnoremap <Leader>r :set relativenumber!<CR>

set cursorline

" hilight line number
highlight clear CursorLine
augroup CLClear
  autocmd! ColorScheme * highlight clear CursorLine
augroup END

" ················· Cursor ····················

set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0

" ················ Dividers ···················

set fillchars+=vert:\           " clean dividers
set laststatus=2                " show statusline

set statusline=
set statusline+=%<              " cut at start
set statusline+=\ %f\           " path

set statusline+=%y              " filetype
set statusline+=%m              " modified

set statusline+=%=\             " left/right separator

set statusline+=%4.P\           " percent through file

set statusline+=\ %4l:%-3v      " row:virtual-column

" :::::::::::::::: Searching ::::::::::::::::::

noremap <Leader>h :set hlsearch!<CR>

set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ...unless they contain a capital letter

" ::::::::::::::: Navigation ::::::::::::::::::

nnoremap    hw ^
nnoremap <C-l> $
nnoremap <C-h> 0

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

" ::::::::::::::::: Editing :::::::::::::::::::

set pastetoggle=\\p

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
nnoremap   <CR> maO<Esc>j`a
nnoremap <S-CR> mao<Esc>k`a

" move line up / down
nnoremap <D-J> ma:m .+1<CR>==:<Esc>`a
inoremap <D-J> <Esc>:m .+1<CR>==gi
vnoremap <D-J> :m '>+1<CR>gv=gv:<Esc>
nnoremap <D-K> ma:m .-2<CR>==:<Esc>`a
inoremap <D-K> <Esc>:m .-2<CR>==gi
vnoremap <D-K> :m '<-2<CR>gv=gv:<Esc>

" indent in visual mode
vnoremap < <gv
vnoremap > >gv

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

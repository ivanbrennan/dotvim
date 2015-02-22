" ::::::::: Options :::::::::::::::::::::::

" persistence
set directory=~/.vim/tmp
set backup
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undo
set history=500
set hidden

" navigation
set incsearch
set ignorecase
set smartcase
set scrolloff=1
set sidescroll=2
set mouse+=a
set guioptions-=L
set guioptions-=r
set splitright
set splitbelow

" editing
set backspace=indent,eol,start
set textwidth=0
set nrformats=
set complete-=i
set formatprg=par               " gq -> par, gw -> internal
set formatoptions-=o            " don't auto-comment with o or O
silent! set formatoptions+=j    " let J handle comments if supported

" appearance
syntax enable                   " syntax highlighting, local overrides
set number
set title
set nowrap
set showtabline=1
set fillchars=vert:\ ,fold:-
set cursorline
set foldmethod=marker
set showcmd
set noshowmode

" notifications
set shortmess+=I
set visualbell

" matching
set showmatch
set matchtime=2

" whitespace
set tabstop=2                   " tab is two spaces
set softtabstop=2               " softtab is two spaces
set shiftwidth=2                " autoindent is two spaces
set expandtab                   " convert tabs to spaces

" characters
set guifont=Sauce\ Code\ Powerline:h14
set list                        " show invisible characters
set listchars=""                " reset the listchars
set listchars=tab:▸\            " tab
set listchars+=trail:·          " trailing space
set listchars+=extends:»        " continues offscreen
set listchars+=precedes:«       " precedes offscreen

" statusline
set laststatus=2
set statusline=%t\ %y%m


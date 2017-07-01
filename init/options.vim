" ::::::::: Options :::::::::::::::::::::::

" startup
set exrc           " enable local .vimrc files
set secure         " disable unsafe commands in local .vimrc files

" persistence
set directory=~/.vim/tmp
set backup
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undo
set history=500
set hidden

" tags
setg tags-=./tags    " don't just look in the current buffer's directory (vim)
setg tags-=./tags;   " don't just look in the current buffer's directory (nvim)
setg tags+=./tags;~  " search for tags recursively upwards until ~

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
set nojoinspaces
setg nrformats=
setg complete-=i
set clipboard=unnamed  " default to the clipboard register
if exists('+inccommand')
  set inccommand=nosplit  " nvim magic
endif

" formatting
let s:tw=90
let &g:textwidth=s:tw
let &g:colorcolumn=join(range(s:tw+1, s:tw+256),',')
call matchadd('ColorColumn', '\%>'.s:tw.'v', 100)
exe 'setg formatprg=par\ -w'.s:tw
unlet s:tw
setg formatoptions-=t            " don't auto-wrap non-commented text
setg formatoptions-=o            " don't auto-comment with o or O
setg formatoptions+=r            " auto-comment with Enter
silent! setg formatoptions+=j    " let J handle comments if supported

" appearance
setg synmaxcol=256
setg number
set title
setg nowrap
set showtabline=1
set fillchars=vert:│
setg foldmethod=syntax
set foldlevelstart=10
setg nofoldenable
set showcmd
set lazyredraw

" notifications
set shortmess+=I
set visualbell

" matching
set showmatch
set matchtime=2

" whitespace
setg tabstop=2                   " tab is two spaces
setg softtabstop=2               " softtab is two spaces
setg shiftwidth=2                " autoindent is two spaces
setg expandtab                   " convert tabs to spaces

" characters
if exists('&guifont')
  set guifont=Sauce\ Code\ Powerline:h14
endif
setg list                        " show invisible characters
setg listchars=""                " reset the listchars
setg listchars=tab:▸\            " tab
setg listchars+=trail:·          " trailing space
setg listchars+=extends:»        " continues offscreen
setg listchars+=precedes:«       " precedes offscreen

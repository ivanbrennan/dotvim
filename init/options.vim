" ::::::::: Options ::::::::::::::::::::::: {{{1

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
set winwidth=80                 " soft active min
set winminwidth=25              " hard inactive min

fun! SetWinMinHts(inactive_min)
  if a:inactive_min > 0
    let full_screen = &lines - 2
    let upper_bound = full_screen - a:inactive_min

    if upper_bound > a:inactive_min
      let &winheight    = min( [upper_bound, 25] )  " soft active min
      let &winminheight = a:inactive_min            " hard inactive min
    endif
  endif
endf

fun! ToggleWinMinHts(inactive_min)
  if &winminheight > 1
    set winminheight=1
    set winheight=1
    normal! =
  else
    call SetWinMinHts(a:inactive_min)
  endif
endf

let inactive_min=5
call SetWinMinHts(inactive_min)

noremap <silent> <Leader>0 :call ToggleWinMinHts(inactive_min)<CR>

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


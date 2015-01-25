" ::::::::: vimrc :::::::::::::::::::::::::::::::::::::

set nocompatible                " iMproved
set encoding=utf-8              " default UTF-8
set t_Co=256                    " 256 color terminal

" ::::::::: Plugins ::::::::::::::::::::::: {{{1

filetype off                    " required for Vundle!

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" github repos: general
Bundle 'ivanbrennan/quickfix-toggle'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
" Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rails'
" Bundle 'tpope/vim-bundler'
Bundle 'AndrewRadev/splitjoin.vim'
Plugin 'jwhitley/vim-matchit'
Plugin 'sjl/gundo.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'thoughtbot/vim-rspec'
Bundle 'kchmck/vim-coffee-script'
Bundle 'eiginn/netrw'
Bundle 'nelstrom/vim-qargs'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'gabebw/vim-spec-runner'
Bundle 'christoomey/vim-tmux-runner'

" github repos: colors
Bundle 'gregsexton/Muon'
Bundle 'guns/xterm-color-table.vim'
Bundle 'shawncplus/Vim-toCterm'
Bundle 'vim-scripts/hexHighlight.vim'

call vundle#end()
filetype plugin indent on       " required for Vundle!

" ::::::::: Options ::::::::::::::::::::::: {{{1

" ··········· core ····················· {{{2
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
if &term =~ '^screen'           " extended mouse mode
  set ttymouse=xterm2
endif
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

" cursor
set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0
augroup CursorGroup             " clear cursorline highlight
  autocmd!
  autocmd BufReadPost * call      RestoreCrsr()
augroup END
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

" colors
colorscheme ib

" statusline
set laststatus=2
set statusline=%t\ %y%m

" wildmode
set wildmode=longest,list
" output and VCS
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" archives
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" bundler and sass
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" librarian-chef, vagrant, test-kitchen and Berkshelf
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
" rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
" temp and backup files
set wildignore+=*.swp,*~,._*
" OSX bullshit
set wildignore+=*.DS_Store

" ··········· plugins ·················· {{{2
" netrw
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+,^DS_Store$'
let g:netrw_hide=1              " hide hidden files
let g:netrw_dirhistmax=100      " keep more history
let g:netrw_altfile=1           " last edited file '#'
let g:netrw_liststyle=0         " thin
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically
let g:netrw_use_errorwindow=0   " suppress error window

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'max:18'

" Ag
if executable('ag')
  let g:aghighlight = 1
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" vim-rspec
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!rspec --drb {spec}"

" vim-spec-runner
let g:spec_runner_dispatcher = "VtrSendCommand! {command} --drb"
let g:disable_write_on_spec_run = 1
let g:VtrOrientation = "h"
let g:VtrPercentage = 35

" ::::::::: Keymaps ::::::::::::::::::::::: {{{1

" ··········· config ··················· {{{2
" leaders
map <Space> <Leader>

set timeout timeoutlen=250 ttimeoutlen=100

" source / edit vimrc
noremap <Leader>2 :source $MYVIMRC<CR>
noremap <Leader>t2 :tabedit $MYVIMRC<CR>

" ··········· keys ····················· {{{2
" enable special key combos
if &term =~ "xterm" || &term =~ "screen" || &term =~ "builtin_gui"
  set  <F13>=[25~
  map  <F13> <C-CR>
  map! <F13> <C-CR>

  set  <F14>=[27~
  map  <F14> <S-CR>
  map! <F14> <S-CR>

  set  <F15>=[29~
  map  <F15> <C-Space>
  map! <F15> <C-Space>

  set  <F16>=[30~
  map  <F16> <S-Space>
  map! <F16> <S-Space>

  set  <F17>=[1;5P
  map  <F17> <C-BS>
  map! <F17> <C-BS>

  set  <F18>=[1;5Q
  map  <F18> <M-Tab>
  map! <F18> <M-Tab>

  set  <F19>=[1;5R
  map  <F19> <M-S-Tab>
  map! <F19> <M-S-Tab>

  set  <F20>=[1;5A
  map  <F20> <C-Up>
  map! <F20> <C-Up>

  set  <F21>=[1;5B
  map  <F21> <C-Down>
  map! <F21> <C-Down>

  set  <F22>=[1;5C
  map  <F22> <C-Right>
  map! <F22> <C-Right>

  set  <F23>=[1;5D
  map  <F23> <C-Left>
  map! <F23> <C-Left>

  set  <F24>=[31~
  map  <F24> <C-Tab>
  map! <F24> <C-Tab>

  set  <F25>=[32~
  map  <F25> <C-S-Tab>
  map! <F25> <C-S-Tab>

  set  <F26>=[33~
  map  <F26> <C-,>
  map! <F26> <C-,>

  set  <F27>=[34~
  map  <F27> <C-S-Space>
  map! <F27> <C-S-Space>
endif

" ··········· buffers ·················· {{{2
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
noremap <silent> <Leader><Tab> :call VexToggle("")<CR>

noremap     <Leader>` :edit ~/
nmap       <Leader>et :tabedit 
noremap     <Leader>d :bdelete<CR>
noremap    <Leader>,d :bdelete#<CR>
nmap       <Leader>,w :write %%

noremap   <M-Tab> :bnext<CR>
noremap <M-S-Tab> :bprevious<CR>
noremap <Leader>p :CtrlPBuffer<CR>
noremap <Leader>l <C-^>
noremap <Leader><Space> <C-Z>

noremap <Leader>/ :pwd<CR>
noremap <Leader>,<Space> :call ReLoadBuffers()<CR>

noremap <silent> <Leader>s :A<CR>

" ··········· ex commands ·············· {{{2
noremap <Leader>; :
noremap <Leader>1 :!

cnoremap     <C-P> <Up>
cnoremap     <C-N> <Down>
cnoremap     <C-A> <Home>
cnoremap  <C-Left> <S-Left>
cnoremap <C-Right> <S-Right>

" ··········· editing ·················· {{{2
" above / below current line
inoremap   <S-CR> <C-O>O
inoremap   <C-CR> <C-O>o
noremap <S-Space> mzO<Esc>j`z
noremap <C-Space> mzo<Esc>k`z

" clipboard
noremap <Leader>= "+
noremap <Leader>4 g_

" commentary
xmap <Leader>3 <Plug>Commentary
nmap <Leader>3 <Plug>Commentary
omap <Leader>3 <Plug>Commentary
nmap <Leader>3<Space> <Plug>CommentaryLine

" bubble text
nnoremap <silent> <C-Up> mZ:move .-2<CR>==`Z
vnoremap          <C-Up> :move '<-2<CR>gv=gv
inoremap          <C-Up> <Esc>:move .-2<CR>==gi
nnoremap <silent> <C-Down> mZ:move .+1<CR>==`Z
vnoremap          <C-Down> :move '>+1<CR>gv=gv
inoremap          <C-Down> <Esc>:move .+1<CR>==gi

vnoremap <C-Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
vnoremap <C-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o

" whole line completion
inoremap <C-L> <C-X><C-L>

" tab
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-P>"
    endif
endfunction
inoremap <expr> <silent> <TAB> InsertTabWrapper()
inoremap <S-TAB> <C-N>

" jump around
inoremap <C-B> <C-O>b
inoremap    JK <C-O>A

" paste toggle
noremap <F4> :set paste! paste?<CR>
set pastetoggle=<F4>

" toggle case
inoremap ~~ <Esc>viwg~gi

" ··········· navigation ··············· {{{2
" sensible marks
noremap ` '
noremap ' `

" ··········· searching ················ {{{2
" find word under cursor
noremap <silent> <Leader>f :set foldenable!<CR>
      \:let view=winsaveview()<CR>#*
      \:call winrestview(view)<CR>:set foldenable!<CR>

" search
noremap <Leader>a :Ag! 

" toggle search highlighting
noremap <silent> <C-L> :nohlsearch<CR><C-L>
noremap <Leader>,n :set hlsearch! hlsearch?<CR>

" fix & to preserve flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" ··········· splits & tabs ············ {{{2
" splits
noremap <Leader>,s :split<CR>
noremap <Leader>,v :vsplit<CR>
noremap  <Leader>q :quit<CR>

"resize
noremap     <C-W>\ <C-W><Bar>
noremap <C-W><C-\> <C-W><Bar>

" ··········· appearance ··············· {{{2
noremap <Leader>w :setlocal wrap! linebreak! list! wrap?<CR>

noremap <Leader>,b :call ToggleBG()<CR>:echo &background<CR>

" info
noremap <Leader>,x :call HexHighlight()<CR>
noremap <Leader>,y :call SynStack()<CR>

" line numbers
noremap <Leader>n :call NumberToggle()<CR>
noremap <Leader>r :set relativenumber! relativenumber?<CR>

" folding
noremap   <expr> <Leader>,m FoldMethToggle()
noremap <silent> <Leader>,z :call FoldColToggle(4)<CR>

" cursor
noremap <silent> <Leader>,c :set cursorcolumn!<CR>
noremap <silent> <Leader>,l :call CursorLineToggle()<CR>
noremap <silent> <Leader>,1 :call ColorColToggle()<CR>

" ··········· testing ·················· {{{2
nmap <Leader>tt <Plug>RunCurrentSpecFile
nmap <Leader>t<Space> <Plug>RunFocusedSpec
nmap <Leader>tl <Plug>RunMostRecentSpec
noremap <Leader>k :VtrKillRunner<CR>

noremap <Leader>,tt :call RunCurrentSpecFile()<CR>
noremap <Leader>,t<Space> :call RunNearestSpec()<CR>
noremap <Leader>,tl :call RunLastSpec()<CR>
noremap <Leader>,ta :call RunAllSpecs()<CR>

" Fugitive
noremap <silent> <Leader>b :Gblame<CR>

" ::::::::: Filetype :::::::::::::::::::::: {{{1

" vimrc
augroup VimrcGroup
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

" git
augroup GitGroup
  autocmd!
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

" ruby
augroup RubyGroup
  autocmd!
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby syn match parens /[(){}\[\]]/
  autocmd FileType ruby,eruby hi def link parens Delimiter
  " complete buffer loading can cause code execution
  " turn this off if it's a concern
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby :inoreabbrev <buffer> erb <% %><C-O>F<Space>
  autocmd FileType ruby,eruby :inoreabbrev <buffer> erp <%= %><C-O>F<Space>
  autocmd FileType ruby,eruby :inoreabbrev <buffer> erc <%# %><C-O>F<Space>
augroup END

" markdown
augroup MarkdownGroup
  autocmd!
  autocmd Bufread,BufNewFile *.md set filetype=markdown
augroup END

" ::::::::: Functions ::::::::::::::::::::: {{{1

" ··········· netrw ···················· {{{2
fun! VexToggle(dir)
  if exists("t:vex_buf_nr")
    call VexClose()
  else
    call VexOpen(a:dir)
  endif
endf

fun! VexOpen(dir)
  let g:netrw_browse_split=4    " open files in previous window
  let g:netrw_banner=0          " no banner
  let vex_width = 27

  exe "Vexplore " . a:dir
  let t:vex_buf_nr = bufnr("%")
  wincmd H

  call VexSize(vex_width)
endf

fun! VexClose()
  let cur_win_nr = winnr()
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  1wincmd w
  close
  unlet t:vex_buf_nr

  exe (target_nr - 1) . "wincmd w"
  call NormalizeWidths()
endf

fun! VexSize(vex_width)
  exe "vertical resize" . a:vex_width
  set winfixwidth
  call NormalizeWidths()
endf

fun! NormalizeWidths()
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endf

" ··········· filetype ················· {{{2
fun! FileTypeToggle(num)
  if a:num > 0 || !exists("b:alt_ftype")
    let b:alt_ftype = &filetype
    let   &filetype = input("enter FileType: ")
  else
    let     new_alt = &filetype
    let   &filetype = b:alt_ftype
    let b:alt_ftype = new_alt
  end
endf

fun! HTMLTypeToggle()
  if exists("b:alt_ftype")
    let &filetype = b:alt_ftype
    unlet b:alt_ftype
  else
    let b:alt_ftype = &filetype
    set filetype=html
  end
endf

" ··········· line numbers ············· {{{2
fun! NumberToggle()
  if &number == 0
    set foldcolumn=0 number number?
  else
    set foldcolumn=1 nonumber number?
  end
endf

" ··········· folding ·················· {{{2
fun! FoldMethToggle()
  if &foldmethod == 'marker'
    set foldmethod=syntax
    if &filetype == 'ruby'
      let ruby_fold = 1
    endif
  else
    set foldmethod=marker
    if exists('ruby_fold')
      unlet ruby_fold
    endif
  endif
endf

fun! FoldColToggle(fold_max)
  if &foldcolumn < a:fold_max
    call FoldColOn(a:fold_max)
  else
    call FoldColOff()
  endif
endf

fun! FoldColOn(fold_max)
  let w:use_num  = &number==1
  let w:use_rel  = &relativenumber==1
  let w:fold_min = &foldcolumn

  set nonumber norelativenumber
  let &foldcolumn = a:fold_max
endf

fun! FoldColOff()
  let [ &number, &relativenumber ] = [ w:use_num, w:use_rel ]
  let &foldcolumn = w:fold_min
endf

" ··········· syntax ··················· {{{2
fun! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endf

" ··········· statusline ··············· {{{2
function! AirlineInit()
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_detect_whitespace=0
  let g:airline_section_z = '%v : %l/%L (%n)'
  let g:airline_theme='today'
endfunction

call AirlineInit()

" ··········· colors ··················· {{{2
fun! ToggleBG()
  if  exists("g:colors_name") | let cur_colo = g:colors_name | endif

  if &background=='dark' | set background=light
  else                   | set background=dark | endif

  if !exists("g:colors_name") && exists("cur_colo")
    let g:colors_name = cur_colo
  endif
endf

fun! TransparencyToggle(transpr)
  if exists("g:transparency_memo")
    let &transparency = g:transparency_memo
    unlet g:transparency_memo
  else
    let g:transparency_memo = &transparency
    let &transparency=a:transpr
  end
endf

fun! ColorColToggle()
  if &colorcolumn == ""
    set colorcolumn=80
  else
    set colorcolumn=
  endif
endf

" ··········· cursor ··················· {{{2
fun! RestoreCrsr()
  if line("'\"") > 1 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endf

fun! CursorLineToggle()
  highlight! CursorLineClear guibg=NONE guifg=NONE gui=NONE ctermbg=NONE ctermfg=NONE cterm=NONE
  if exists("w:cursorline_memo")
    highlight! link CursorLine CursorLine
    unlet w:cursorline_memo
  else
    highlight! link CursorLine CursorLineClear
    let w:cursorline_memo = 1
  end
endf

" ··········· braces ··················· {{{2
function! NextTextObject(motion)
  echo
  let c = nr2char(getchar())
  execute "normal! f" . c . "v" . a:motion . c
endfunction

" ··········· git ······················ {{{2
"Git branch
function! GitBranch()
    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    if branch != ''
      return '(' . substitute(branch, '\n', '', 'g') . ')'
    endif
    return ''
endfunction

function! ReLoadBuffers()
  set autoread
  checktime
  set noautoread
endfunction

" ··········· keyboard ················· {{{2
function! Keyboard(type)
   if a:type == "workman"
     call NormanUnmaps()
     call QWERTYUnmaps()
     call WorkmanMaps()
     echo "Workman mappings enabled"
   elseif a:type == "norman"
     call QWERTYUnmaps()
     call WorkmanUnmaps()
     call NormanMaps()
     echo "Norman mappings enabled"
   else
     call NormanUnmaps()
     call WorkmanUnmaps()
     call QWERTYMaps()
     echo "QWERTY mappings enabled"
   endif
endfunction

" ··········· norman ··················· {{{3
function! NormanMaps()
  " ··· home ············ {{{4
  noremap <C-Y> h
  noremap <C-I> k
  noremap <C-O> l
  noremap <C-H> <C-I>
  noremap <C-J> <C-Y>
  noremap <C-P> <C-O>
  " }}}
  " ··· arch ············ {{{4
  " noremap <C-R> k
  " noremap <C-Y> h
  " noremap <C-L> l
  " noremap <C-U> <C-R>
  " noremap <C-J> <C-Y>
  " noremap     l <C-L>
  " }}}
endfunction
function! NormanUnmaps()
  " ··· home ············ {{{4
  silent! unmap <C-Y>
  silent! unmap <C-I>
  silent! unmap <C-O>
  silent! unmap <C-H>
  silent! unmap <C-J>
  silent! unmap <C-P>
  " }}}
  " ··· arch ············ {{{4
  " silent! unmap <C-R>
  " silent! unmap <C-Y>
  " silent! unmap <C-L>
  " silent! unmap <C-U>
  " silent! unmap <C-J>
  " silent! unmap l
  " }}}
endfunction

" ··········· qwerty ··················· {{{3
function! QWERTYMaps()
endfunction
function! QWERTYUnmaps()
endfunction

" ··········· workman ·················· {{{3
function! WorkmanMaps()
  " ··· home ············ {{{4
  noremap <C-E> k
  noremap <C-Y> h
  noremap <C-O> l
  noremap k <C-E>
  noremap j <C-Y>
  noremap <C-K> <C-O>
  " }}}
  " ··· arch ············ {{{4
  " noremap <C-U> k
  " noremap <C-Y> h
  " noremap <C-P> l
  " noremap <C-J> <C-Y>
  " }}}
  " ··· swap ············ {{{4
  " noremap j k
  " noremap k j
  " }}}
  " ··· mix ············· {{{4
  " noremap <C-E> k
  " noremap <C-K> <C-E>
  " }}}
endfunction
function! WorkmanUnmaps()
  " ··· home ············ {{{4
  silent! unmap <C-E>
  silent! unmap <C-Y>
  silent! unmap <C-O>
  silent! unmap k
  silent! unmap j
  silent! unmap <C-K>
  " }}}
  " ··· arch ············ {{{4
  " silent! unmap <C-U>
  " silent! unmap <C-Y>
  " silent! unmap <C-P>
  " silent! unmap <C-J>
  " }}}
  " ··· swap ············ {{{4
  " silent! unmap j
  " silent! unmap k
  " }}}
  " ··· mix ············· {{{4
  " silent! unmap <C-E>
  " silent! unmap <C-K>
  " }}}
endfunction

" ··········· initialize ··············· {{{3
call QWERTYMaps()
" call WorkmanMaps()

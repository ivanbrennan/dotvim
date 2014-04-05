" ::::::::: vimrc :::::::::::::::::::::::::::::::::::::

set nocompatible                " be iMproved
set encoding=utf-8              " default encoding to UTF-8

" ::::::::: Plugins ::::::::::::::::::::::: {{{1

filetype off                    " required for Vundle!

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" github repos: general
Bundle 'gmarik/vundle'
Bundle 'ivanbrennan/quickfix-toggle'
Bundle 'kien/ctrlp.vim'
" Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tsaleh/vim-matchit'
Bundle 'sjl/gundo.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'thoughtbot/vim-rspec'
Bundle 'kchmck/vim-coffee-script'

" github repos: colors
Bundle 'gregsexton/Muon'
Bundle 'guns/xterm-color-table.vim'
Bundle 'shawncplus/Vim-toCterm'
Bundle 'vim-scripts/hexHighlight.vim'

filetype plugin indent on       " required for Vundle!

" ::::::::: Settings :::::::::::::::::::::: {{{1

" ··········· options ·················· {{{2
" notifications
set shortmess+=I                " disable intro message
set showcmd                     " show commands (remove if slow)
set visualbell                  " don't beep

" posterity
set backup                      " backup files
set backupdir=~/.vim/backup     " backups here
set directory=~/.vim/tmp        " temp files here
set history=500                 " history 500-deep

" ··········· netrw ···················· {{{2
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+,^DS_Store$'
let g:netrw_hide=1              " hide hidden files
let g:netrw_dirhistmax=100      " keep more history
let g:netrw_altfile=1           " last edited file '#'
let g:netrw_liststyle=0         " thin
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically
let g:netrw_use_errorwindow=0   " suppress error window

" ··········· ctrlp ···················· {{{2
let g:ctrlp_show_hidden = 1     " include hidden files
let g:ctrlp_match_window = 'max:12'

" ··········· vim-rspec ················ {{{2
let g:rspec_command_launcher = "iterm"

" ··········· editing ·················· {{{2
set hidden                      " allow hidden buffers
set backspace=indent,eol,start  " backspace through everything
set textwidth=0                 " no autowrap

" formatting
set formatprg=par               " gq -> par, gw -> internal
set formatoptions-=o            " don't auto-comment with o or O
silent! set formatoptions+=j    " let J handle comments if supported

" ··········· navigation ··············· {{{2
set scrolloff=1
set sidescroll=1                " smooth sidescroll

" ··········· searching ················ {{{2
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ...unless they contain a capital letter

" ··········· appearance ··············· {{{2
syntax enable                   " syntax highlighting, local overrides
set number                      " line numbers
set title                       " xterm title
set nowrap                      " don't wrap lines
set fillchars+=vert:\           " clean dividers
set cursorline                  " cursorline on
set foldmethod=marker           " fold markers
augroup CursorGroup             " clear cursorline highlight
  autocmd!
  autocmd BufReadPost * call      RestoreCrsr()
augroup END

" cursor
set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0

" whitespace
set tabstop=2                   " tab is two spaces
set softtabstop=2               " softtab is two spaces
set shiftwidth=2                " autoindent is two spaces
set expandtab                   " convert tabs to spaces

set list                        " show invisible characters
set listchars=""                " reset the listchars
set listchars=tab:▸\            " tab
set listchars+=trail:·          " trailing space
set listchars+=extends:»        " continues offscreen
set listchars+=precedes:«       " precedes offscreen

" colors
colorscheme github

" nice colorschemes {{{
let g:nice_schemes =
      \[
      \"eivel",
      \"eivel_dark",
      \"eivel_light",
      \"github",
      \"hemisu",
      \"ivisu",
      \"muon",
      \"mustang",
      \"mustangblue",
      \"smyck",
      \"smyckblue",
      \"ir_black",
      \"tir_black",
      \"xoria256",
      \]
" }}}
" fonts {{{
set guifont=Source\ Code\ Pro:h17
let g:font_dict =
      \{
      \"Anonymous Pro":    3,
      \"Inconsolata":      1,
      \"Menlo":            0,
      \"Monaco":          -2,
      \"Source Code Pro": -1,
      \"Ubuntu Mono":      3,
      \}
" }}}

" status line
set laststatus=2                " show statusline

" ··········· wild settings ············ {{{2
set wildmenu
set wildmode=longest,full

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

" ::::::::: Mappings :::::::::::::::::::::: {{{1

" leaders
map <Space> <Leader>
let maplocalleader=','
set timeout timeoutlen=250 ttimeoutlen=100

" source / edit vimrc
noremap <LocalLeader>` :source $MYVIMRC<CR>
noremap <LocalLeader>`, :tabedit $MYVIMRC<CR>

" ··········· keyboard layouts ········· {{{2
noremap <LocalLeader>kq :call Keyboard("qwerty")<CR>
noremap <LocalLeader>kw :call Keyboard("workvan")<CR>

function! QWERTYMaps() " {{{3
  " enter command mode
  noremap  ; :
  noremap q; q:

  " exit insert mode
  inoremap kj <Esc>`^
  inoremap jk <Esc>`^

  " shell command
  noremap <Leader>1 :!

  " navigate
  noremap <C-J> <C-W>j
  noremap <C-K> <C-W>k
  noremap <C-H> <C-W>h
  noremap <C-L> <C-W>l

  " rearrange
  noremap <C-W><C-J> <C-W>J
  noremap <C-W><C-K> <C-W>K
  noremap <C-W><C-H> <C-W>H
  noremap <C-W><C-L> <C-W>L
endfunction

function! QWERTYUnmaps() " {{{3
  " enter command mode
  unmap  ;
  unmap q;

  " exit insert mode
  iunmap    kj
  iunmap    jk

  " shell command
  unmap <Leader>1

  " navigate
  unmap <C-J>
  unmap <C-K>
  unmap <C-H>
  unmap <C-L>

  " rearrange
  unmap <C-W><C-J>
  unmap <C-W><C-K>
  unmap <C-W><C-H>
  unmap <C-W><C-L>
endfunction

function! WorkVanMaps() " {{{3
  " (E)xit insert mode
  inoremap <C-E> <Esc>`^
  inoremap <C-K> <C-E>

  " (O)pen line -> (L)ine
  noremap l o
  noremap o l
  noremap L O
  noremap O L
  " Search (N)ext -> (J)ump
  noremap j n
  noremap n j
  noremap J N
  noremap N J
  " (E)nd of word -> brea(K) of word
  noremap k e
  noremap e k
  noremap K E
  noremap E K
  " (Y)ank -> (H)aul
  noremap h y
  noremap y h
  noremap H Y
  noremap Y H

  " navigate
  noremap <C-O> <C-W>l
  noremap <C-L> <C-O>
  noremap <C-N> <C-W>j
  noremap <C-J> <C-N>
  noremap <C-E> <C-W>k
  noremap <C-K> <C-E>
  noremap <C-Y> <C-W>h
  noremap <C-H> <C-Y>

  " beginning of line
  noremap ) 0
endfunction

function! WorkVanUnmaps() " {{{3
  " (E)xit insert mode
  iunmap <C-E>
  iunmap <C-K>

  " (O)pen line -> (L)ine
  unmap l
  unmap o
  unmap L
  unmap O
  " Search (N)ext -> (J)ump
  unmap j
  unmap n
  unmap J
  unmap N
  " (E)nd of word -> brea(K) of word
  unmap k
  unmap e
  unmap K
  unmap E
  " (Y)ank -> (H)aul
  unmap h
  unmap y
  unmap H
  unmap Y

  " navigate
  unmap <C-O>
  unmap <C-L>
  unmap <C-N>
  unmap <C-J>
  unmap <C-E>
  unmap <C-K>
  unmap <C-Y>
  unmap <C-H>
endfunction

" initialize {{{3
call QWERTYMaps()

" ··········· terminal key codes ······· {{{2
" hack to fix arrow keys in terminal
if &term =~ "xterm"
  imap <Esc>[A <Up>
  imap <Esc>[B <Down>
  imap <Esc>[C <Right>
  imap <Esc>[D <Left>
endif

" use some unused function key codes to
" make special key combos work in terminal
set  <F13>=O2P
map  <F13> <C-CR>
map! <F13> <C-CR>
set  <F14>=O2Q
map  <F14> <S-CR>
map! <F14> <S-CR>

set  <F15>=O2R
map  <F15> <C-Space>
map! <F15> <C-Space>
set  <F16>=O2S
map  <F16> <S-Space>
map! <F16> <S-Space>

set  <F17>=O5P
map  <F17> <C-BS>
map! <F17> <C-BS>

set  <F18>=O5Q
map  <F18> <M-Tab>
map! <F18> <M-Tab>
set  <F19>=O5R
map  <F19> <M-S-Tab>
map! <F19> <M-S-Tab>

" ··········· buffers ·················· {{{2
" netrw
noremap <silent> <Leader>e :call ExToggle("")<CR>
noremap <silent> <Leader>,e :call ExToggle(getcwd())<CR>
noremap <silent> <Leader><Tab> :call VexToggle("")<CR>
noremap <silent> <Leader>,<Tab> :call VexToggle(getcwd())<CR>

" from ./vim/after/ftplugin/netrw.vim
"   Select file/dir:  f
"   Refresh listing: <LocalLeader>l
"   Set treetop dir: <LocalLeader>t

" list
noremap <LocalLeader><Space> :buffers<CR>
noremap <Leader>p :CtrlPBuffer<CR>
noremap <Leader>b :echo bufnr('%')<CR>

" open from ~
noremap <Leader>eh :edit ~/

" open from %
nmap <Leader>ew :edit %%
nmap <Leader>es :split %%
nmap <Leader>ev :vsplit %%
nmap <Leader>et :tabedit %%
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" close
noremap <LocalLeader>d :bdelete<CR>
noremap <silent> <LocalLeader>c :call BClose()<CR>

" current directory
noremap <Leader><Space> :pwd<CR>
noremap <LocalLeader>t :lcd %:h<CR>

" cycle
noremap   <M-Tab> :bnext<CR>
noremap <M-S-Tab> :bprevious<CR>

" ··········· editing ·················· {{{2
" open above / below current line
inoremap <S-CR> <C-O>O
inoremap <C-CR> <C-O>o

" double backspace
inoremap <C-BS> <BS><BS>

" insert above / below current line
noremap <S-Space> mzO<Esc>j`z
noremap <C-Space> mzo<Esc>k`z

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

" jump back a word in insert mode
inoremap <C-B> <C-O>b

" autocomplete parens, brackets, braces
inoremap (<CR> (<CR>)<Esc>O<Tab>
inoremap [<CR> [<CR>]<Esc>O<Tab>
inoremap {<CR> {<CR>}<Esc>O<Tab>

" paste toggle
noremap <LocalLeader>p :set paste! paste?<CR>
noremap           <F4> :set paste! paste?<CR>
set pastetoggle=<F4>

" toggle case
inoremap `` <Esc>viwg~gi

" add semicolon to end of line
noremap <Leader>; mZA;<Esc>`Z

" toggle filetype
noremap <silent> <LocalLeader>f, :call FileTypeToggle(1)<CR>
noremap <silent>  <LocalLeader>f :call FileTypeToggle(0)<CR>
" toggle html
inoremap <silent> `h X<C-O>:call HTMLTypeToggle()<CR><BS>

" format entire file
noremap <LocalLeader>fef :normal! gg=G``<CR>

" toggle Gundo
noremap <Leader>g :GundoToggle<CR>

" previous / next braces
onoremap in :<C-U>call NextTextObject('i')<CR>
xnoremap in :<C-U>call NextTextObject('i')<CR>
onoremap an :<C-U>call NextTextObject('a')<CR>
xnoremap an :<C-U>call NextTextObject('a')<CR>

" ··········· navigation ··············· {{{2
" sensible marks
noremap ` '
noremap ' `

" last non-blank char
noremap - g_

" soft line-breaks
noremap    <Up> gk
noremap  <Down> gj
" behave normally if popup-menu visible
inoremap   <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>
inoremap <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>

" side-scroll
noremap <Left> zh
noremap <Right> zl

" ··········· searching ················ {{{2
" repeat last char search
noremap + ;
noremap _ ,

" " search and replace
" nnoremap  :: :%s:::g<Left><Left><Left>
" vnoremap  :: :s:::g<Left><Left><Left>
" nnoremap  :C :%s:::cg<Left><Left><Left><Left>
" vnoremap  :C :s:::cg<Left><Left><Left><Left>
" cnoremap ;/ \(\)<Left><Left>

" find word under cursor
noremap <silent> <Leader>f :set foldenable!<CR>
      \:let view=winsaveview()<CR>#*
      \:call winrestview(view)<CR>:set foldenable!<CR>

" toggle search highlighting
noremap <LocalLeader><Tab> :set hlsearch! hlsearch?<CR>

" find merge conflicts
noremap <silent> <LocalLeader>m <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" toggle diff
noremap <silent> <Leader>d :call DiffToggle()<CR>

" ··········· splits & tabs ············ {{{2
" splits
noremap <Leader>s :split<CR>
noremap <Leader>v :vsplit<CR>
noremap <silent> <Leader>o :only<CR>
noremap <Leader>k :quit<CR>

"resize
noremap <Leader>- <C-W>_
noremap <Leader>0 <C-W><Bar>
noremap <Leader>= <C-W>=

  " tabs
  noremap <Leader>[ :tabprevious<CR>
  noremap <Leader>] :tabnext<CR>

" ··········· appearance ··············· {{{2
noremap <LocalLeader>w :setlocal wrap! linebreak! list! wrap?<CR>

if has("gui_running")
  noremap <LocalLeader>,t :call TransparencyToggle(5)<CR>
end

" statusline
noremap <silent> <LocalLeader>sp :call ToggleStatusLnElement("tail")<CR>:call BuildStatusLn()<CR>
noremap <silent> <LocalLeader>sg :call ToggleStatusLnElement("git")<CR>:call BuildStatusLn()<CR>
noremap <silent> <LocalLeader>sb :call CycleStatusLnBufColor()<CR>:call BuildStatusLn()<CR>

" fonts
noremap <silent> <LocalLeader>= :call FontCycle(1)<CR>:echo getfontname()<CR>
noremap <silent> <LocalLeader>- :call FontCycle(-1)<CR>:echo getfontname()<CR>

" colors
noremap <silent> <LocalLeader>] :call ColorCycle(1)<CR>:colorscheme<CR>
noremap <silent> <LocalLeader>[ :call ColorCycle(-1)<CR>:colorscheme<CR>

" background
noremap <LocalLeader>b :call ToggleBG()<CR>:echo &background<CR>

" info
noremap <LocalLeader>h :call HexHighlight()<CR>
noremap <LocalLeader>y :call SynStack()<CR>

" line numbers
noremap <Leader>n :call NumberToggle()<CR>
noremap <Leader>r :set relativenumber! relativenumber?<CR>

" foldcolumn
noremap <silent> <Leader>z :call FoldColToggle(4)<CR>

" cursor
noremap <silent> <Leader>c :set cursorcolumn!<CR>

" colorcolumn
noremap <silent> <Leader>8 :call ColorColToggle()<CR>

" ··········· evaluation ··············· {{{2
" RSpec
noremap <Leader>tt :call RunCurrentSpecFile()<CR>
noremap <Leader>t<Space> :call RunNearestSpec()<CR>
noremap <Leader>tl :call RunLastSpec()<CR>
noremap <Leader>ta :call RunAllSpecs()<CR>

" ::::::::: Abbreviations ::::::::::::::::: {{{1
" common typos
noreabbrev verison version
noreabbrev funiction function
noreabbrev funcition function
noreabbrev funciotn function
noreabbrev funciton function
noreabbrev docuemt document
noreabbrev docuemtn document
noreabbrev hte the
noreabbrev edn end

" ::::::::: Autocommands :::::::::::::::::: {{{1

" ··········· vimrc ···················· {{{2
augroup VimrcGroup
  autocmd!
  autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" ··········· netrw ···················· {{{2
augroup NetrwGroup
  autocmd!
  " autocmd BufEnter * call NormalizeWidths()
augroup END

" ··········· ruby ····················· {{{2
augroup RubyGroup
  autocmd!
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  " complete buffer loading can cause code execution
  " turn this off if it's a concern
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby :inoreabbrev <buffer> erb <% %><C-O>F<Space>
  autocmd FileType ruby,eruby :inoreabbrev <buffer> erp <%= %><C-O>F<Space>
  autocmd FileType ruby,eruby :inoreabbrev <buffer> erc <%# %><C-O>F<Space>
augroup END

" ··········· markdown ················· {{{2
augroup MarkdownGroup
  autocmd!
  autocmd Bufread,BufNewFile *.md set filetype=markdown
augroup END

" ::::::::: Functions ::::::::::::::::::::: {{{1

" ··········· netrw ···················· {{{2
fun! ExToggle(dir)
  if &filetype != "netrw"
    call ExOpen(a:dir)
  else
    call ExClose()
  endif
endf

fun! ExOpen(dir)
  let g:netrw_browse_split=0    " open files in current window
  let g:netrw_banner=1          " banner
  exe "Explore " . a:dir
endf

fun! ExClose()
  while &filetype == "netrw"
    exe "normal! \<C-O>"
  endw
endf

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

" ··········· splits ··················· {{{2
fun! BClose()
  silent! bprevious | split
  silent! bnext     | bdelete
endf

fun! DiffToggle()
  echo "Implement DiffToggle()"
endf

" ··········· line numbers ············· {{{2
fun! NumberToggle()
  if &number == 0
    set foldcolumn=0 number number?
  else
    set foldcolumn=1 nonumber number?
  end
endf

" ··········· foldcolumn ··············· {{{2
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

" ··········· fonts ···················· {{{2
fun! FontCycle(num)
  let font_nams = sort(keys(g:font_dict))
  let [ cur_nam, cur_hgt, cur_idx ] = CurFont(font_nams)
  let new_nam = NewFontNm(cur_idx, a:num, font_nams)
  let new_hgt = NewFontHt(cur_hgt, cur_nam, new_nam)

  let new_font = join([ new_nam, new_hgt ], ":h")
  exe "set guifont=" . escape(new_font, " ")
endf

fun! CurFont(font_nams)
  let [cur_nam, cur_hgt] = split(getfontname(), ':')
  let cur_idx = index(a:font_nams, cur_nam)
  return [cur_nam, cur_hgt, cur_idx]
endf

fun! NewFontNm(cur_idx, num, font_nams)
  let new_idx = (a:cur_idx + a:num) % len(a:font_nams)
  return a:font_nams[new_idx]
endf

fun! NewFontHt(cur_hgt, cur_nam, new_nam)
  let cur_adj = get(g:font_dict, a:cur_nam, 0)
  let new_adj = g:font_dict[a:new_nam]
  return a:cur_hgt - cur_adj + new_adj
endf

" ··········· statusline ··············· {{{2
fun! BuildStatusLn()
  call InitializeStatusLn()
  call StatusLnLeft()
  set statusline+=%=
  call StatusLnRight()
endf

fun! ToggleStatusLnElement(el)
  exec exists("w:".a:el) ? "unlet w:".a:el : "let w:".a:el."=1"
endf

fun! CycleStatusLnElement(el, opts)
  exec "let w:".a:el." = (w:".a:el." + 1) % ".len(a:opts)
endf

fun! CycleStatusLnBufColor()
  let opts = StatusLnColors()
  call CycleStatusLnElement("buf_color", opts)
endf

fun! InitializeStatusLn()
  if a:0 > 0
    call ToggleStatusLnElement(a:1)
  endif
  set statusline=
  set statusline+=%<
endf

fun! StatusLnColors()
  let  status = 'set statusline+=%*'
  let  wildmu = 'set statusline+=%#wildmenu#'
  let  statnc = 'set statusline+=%#statuslinenc#'
  let  matchp = 'set statusline+=%#matchparen#'
  return [ status, wildmu, statnc, matchp ]
endf

fun! StatusLnLeft()
  if !exists('w:buf_color')
    let w:buf_color = 3
  end
  call StatusLnColor(w:buf_color)
  set  statusline+=%n
  call StatusLnColor(0)
  call StatusLnGit()
  call StatusLnPath()
  set statusline+=%m
endf

fun! StatusLnRight()
  set statusline+=%l:%v\ 
  set statusline+=%y
endf

fun! StatusLnColor(i)
  exec StatusLnColors()[a:i]
endf

fun! StatusLnPath()
  let  full  = 'set statusline+=\ %f\ '
  let  tail  = 'set statusline+=\ %t\ '
  let  paths = [ full, tail ]
  let  i = exists('w:tail') ? 1 : 0
  exec paths[i]
endf

fun! StatusLnGit()
  if exists('w:git')
    set statusline+=\ %{GitBranch()}
  end
endf

call BuildStatusLn()

" ··········· colors ··················· {{{2
fun! ToggleBG()
  if  exists("g:colors_name") | let cur_colo = g:colors_name | endif

  if &background=='dark' | set background=light
  else                   | set background=dark | endif

  if !exists("g:colors_name") && exists("cur_colo")
    let g:colors_name = cur_colo
  endif
endf

fun! ColorCycle(num)
  let cur_idx = index( g:nice_schemes, g:colors_name )
  let new_idx = (cur_idx + a:num) % len(g:nice_schemes)
  let new_nam = g:nice_schemes[new_idx]
  exe "colorscheme " . new_nam
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

" ··········· keyboard ················· {{{2
function! Keyboard(type)
   if a:type == "workvan"
     call QWERTYUnmaps()
     call WorkVanMaps()
     echo "WorkVan mappings enabled"
   else
     call WorkVanUnmaps()
     call QWERTYMaps()
     echo "QWERTY mappings enabled"
   endif
endfunction

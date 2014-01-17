" ::::::::: vimrc :::::::::::::::::::::::::::::::::::::

set nocompatible                " be iMproved
set encoding=utf-8              " default encoding to UTF-8

" ::::::::: Plugins ::::::::::::::::::::::: {{{1

filetype off                    " required for Vundle!

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" github repos: general
Bundle 'gmarik/vundle'
Bundle 'SirVer/ultisnips'
Bundle 'tsaleh/vim-matchit'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'ivanbrennan/grep-operator'
Bundle 'ivanbrennan/quickfix-toggle'

" github repos: colors
Bundle 'vim-scripts/hexHighlight.vim'
Bundle 'guns/xterm-color-table.vim'
Bundle 'shawncplus/Vim-toCterm'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gregsexton/Muon'

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
let g:netrw_liststyle=0         " thin
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically
let g:netrw_use_errorwindow=0   " suppress error window

" ··········· editing ·················· {{{2
set hidden                      " allow hidden buffers
set backspace=indent,eol,start  " backspace through everything
set textwidth=0                 " no autowrap
"set complete-=i                " speed up ins-completion

" formatting
set formatprg=par               " gq -> par, gw -> internal
set formatoptions-=o            " don't auto-comment with o or O
silent! set formatoptions+=j    " let J handle comments if supported

" ··········· navigation ··············· {{{2
set scrolloff=2
set sidescroll=1                " smooth sidescroll

" ··········· searching ················ {{{2
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ...unless they contain a capital letter

" ··········· appearance ··············· {{{2
syntax enable                   " syntax highlighting, local overrides
set title                       " xterm title
set nowrap                      " don't wrap lines
set fillchars+=vert:\           " clean dividers
set cursorline                  " cursorline on
set number                      " line numbers
set foldmethod=marker           " fold markers
augroup cursorline              " clear cursorline highlight
  autocmd!
  autocmd ColorScheme * highlight clear CursorLine
  autocmd WinEnter,BufRead,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
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
if has("gui_running")
  colorscheme ivisu | set transparency=5
else
  colorscheme muon
endif
highlight clear CursorLine

" nice colorschemes {{{
let g:nice_schemes =
      \[
      \"badwolf",
      \"github",
      \"hemisu",
      \"ivisu",
      \"ivanized",
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
set guifont=Source\ Code\ Pro:h15
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
set statusline=
set statusline+=%<              " cut at start
set statusline+=\ %f\           " path
set statusline+=%y              " filetype
set statusline+=%m              " modified
set statusline+=%=\             " left/right separator
set statusline+=(%l/%L):%-3v    " row:virtual-column
set statusline+=%4.P\           " percent through file

" ··········· wild settings ············ {{{2
set wildmenu

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
let maplocalleader=","
set timeout timeoutlen=250 ttimeoutlen=100

" source / edit vimrc
noremap <Leader>` :source $MYVIMRC<CR>
noremap <Leader>`<Space> :edit $MYVIMRC<CR>

" ··········· modes ···················· {{{2
" enter command mode
noremap  ; :
noremap q; q:

" exit insert mode
inoremap    kj <Esc>`^
inoremap    jk <Esc>`^
inoremap <C-[> <Esc>`^

" ··········· buffers ·················· {{{2
" netrw
noremap <silent> <Leader>e :call ExToggle("")<CR>
noremap <silent> <Leader>w :call ExToggle(getcwd())<CR>
noremap <silent> <LocalLeader>e :call VexToggle(getcwd())<CR>
noremap <silent> <LocalLeader>w :call VexToggle("")<CR>

" from ./vim/after/ftplugin/netrw.vim
  "  Select file/dir:  f
  "  Refresh listing: <LocalLeader>l
  "  Set treetop dir: <LocalLeader>t

" list
noremap <Leader>l :buffers<CR>
noremap <Leader>b :buffers<CR>:b

" open from ~
noremap <LocalLeader>eh, :edit ~/

" open from %
nmap <LocalLeader>ew :edit %%
nmap <LocalLeader>es :split %%
nmap <LocalLeader>ev :vsplit %%
nmap <LocalLeader>et :tabedit %%
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" close
noremap <LocalLeader>d :bdelete<CR>
noremap <LocalLeader>c :call BClose()<CR>

" current directory
noremap <Leader><Space> :pwd<CR>
noremap <LocalLeader>t :lcd %:h<CR>

" cycle
noremap <S-CR> :bprevious<CR>
noremap <C-CR> :bnext<CR>

" ··········· editing ·················· {{{2
" open above / below current line
inoremap <S-CR> <C-O>O
inoremap <C-CR> <C-O>o

" insert above / below current line
noremap <S-Space> mzO<Esc>j`z
noremap <C-Space> mzo<Esc>k`z

" bubble text
nnoremap <silent> <Leader><Up> mZ:move .-2<CR>==`Z
vnoremap          <Leader><Up> :move '<-2<CR>gv=gv
nnoremap <silent> <Leader><Down> mZ:move .+1<CR>==`Z
vnoremap          <Leader><Down> :move '>+1<CR>gv=gv
vnoremap          <Leader><Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
vnoremap          <Leader><Right> <Esc>`><Right>gvxpgv<Right>o<Right>o

augroup guioverrides            " override gvimrc mappings
  autocmd!
  autocmd GUIEnter * nnoremap <silent> <M-Up> mZ:move .-2<CR>==`Z
  autocmd GUIEnter * vnoremap          <M-Up> :move '<-2<CR>gv=gv
  autocmd GUIEnter * inoremap          <M-Up> <Esc>:move .-2<CR>==gi
  autocmd GUIEnter * nnoremap <silent> <M-Down> mZ:move .+1<CR>==`Z
  autocmd GUIEnter * vnoremap          <M-Down> :move '>+1<CR>gv=gv
  autocmd GUIEnter * inoremap          <M-Down> <Esc>:move .+1<CR>==gi
  autocmd GUIEnter * vnoremap <M-Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
  autocmd GUIEnter * vnoremap <M-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o
augroup END

" whole line completion
inoremap <C-L> <C-X><C-L>

" autocomplete parens, brackets, braces
inoremap (<CR> (<CR>)<Esc>O<Tab>
inoremap [<CR> [<CR>]<Esc>O<Tab>
inoremap {<CR> {<CR>}<Esc>O<Tab>

" paste toggle
noremap <LocalLeader>p :set paste! paste?<CR>
noremap           <F4> :set paste! paste?<CR>
set pastetoggle=<F4>

" toggle case
inoremap <LocalLeader>` <Esc>viwg~gi

" toggle filetype
noremap <silent> <LocalLeader>f, :call FileTypeToggle(1)<CR>
noremap <silent>  <LocalLeader>f :call FileTypeToggle(0)<CR>

" format entire file
noremap <LocalLeader>fef :normal! gg=G``<CR>

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

" ··········· searching ················ {{{2
" repeat last char search
noremap + ;
noremap _ ,

" search and replace
nnoremap  ;; :%s:::g<Left><Left><Left>
vnoremap  ;; :s:::g<Left><Left><Left>
nnoremap  ;' :%s:::cg<Left><Left><Left>
nnoremap  ;' :s:::cg<Left><Left><Left>
cnoremap ;/ \(\)<Left><Left>

" find word under cursor
noremap <silent> <Leader>f :set foldenable!<CR>
      \:let view=winsaveview()<CR>#*
      \:call winrestview(view)<CR>:set foldenable!<CR>

" toggle search highlighting
noremap <Leader><Tab> :set hlsearch! hlsearch?<CR>

" find merge conflicts
noremap <silent> <Leader>cc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" ··········· splits & tabs ············ {{{2
" splits
noremap <Leader>s :split<CR>
noremap <Leader>v :vsplit<CR>
noremap K :quit<CR>
noremap <Leader>k :only<CR>

"resize
noremap <Leader>- <C-W>_
noremap <Leader>] <C-W><Bar>
noremap <Leader>= <C-W>=

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

" tabs
noremap <Leader>9 :tabprevious<CR>
noremap <Leader>0 :tabnext<CR>

" ··········· appearance ··············· {{{2
noremap <LocalLeader>w :setlocal wrap! linebreak! list! wrap?<CR>

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
noremap <silent> <Leader>c :call ToggleHiCrsrLn()<CR>

" ::::::::: Abbreviations ::::::::::::::::: {{{1
" common typos
noreabbrev verison version
noreabbrev funiction function
noreabbrev funcition function
noreabbrev funciotn function
noreabbrev funciton function

" ::::::::: Autocommands :::::::::::::::::: {{{1

" ··········· vimrc ···················· {{{2
augroup vimrcgroup
  autocmd!
  autocmd BufWritePost .vimrc source $MYVIMRC
  autocmd BufReadPost * call RestoreCrsr()
augroup END

" ··········· vim ······················ {{{2
augroup filetype_vim
  autocmd!
  " comments
  autocmd FileType vim nnoremap <buffer> <C-_> mA0i"<Esc>`Al
  autocmd FileType vim vnoremap <buffer> <C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END

" ··········· netrw ···················· {{{2
augroup NetrwGroup
  autocmd!
  autocmd FileType,BufEnter * call NetrwCrsrLn()
  autocmd BufEnter * call NormalizeWidths()
augroup END

" ··········· ruby ····················· {{{2
augroup filetype_ruby
  autocmd!
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  " complete buffer loading can cause code execution
  " turn this off if it's a concern
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
  autocmd FileType ruby let g:rubycomplete_rails = 1
  " comments
  autocmd FileType ruby nnoremap <buffer> <C-_> mZ0i#<Esc>`Zl
  autocmd FileType ruby vnoremap <buffer> <C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END

" ··········· eruby ···················· {{{2
augroup filetype_eruby
  autocmd!
  autocmd FileType eruby set omnifunc=rubycomplete#Complete
  " complete buffer loading can cause code execution
  " turn this off if it's a concern
  autocmd FileType eruby let g:rubycomplete_buffer_loading=1
  autocmd FileType eruby let g:rubycomplete_classes_in_global=1
  autocmd FileType eruby let g:rubycomplete_rails = 1
  autocmd FileType eruby :inoreabbrev <buffer> erb <% %><C-O>F<Space>
  autocmd FileType eruby :inoreabbrev <buffer> erp <%= %><C-O>F<Space>
  autocmd FileType eruby :inoreabbrev <buffer> erc <%# %><C-O>F<Space>
augroup END

" ··········· python ··················· {{{2
augroup filetype_python
  autocmd!
  "autocmd FileType python :inoreabbrev <buffer> iff if:<left>
  " comments
  autocmd FileType python nnoremap <buffer> <C-_> mZ0i#<Esc>`Zl
  autocmd FileType python vnoremap <buffer> <C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END

" ··········· javascript ··············· {{{2
augroup filetype_javascript
  autocmd!
  " if statement
  "autocmd FileType javascript :inoreabbrev <buffer> iff if ()<Left>
  " add semicolon
  autocmd FileType javascript noremap <buffer> <Leader>; mZA;<Esc>`Z
augroup END

" ··········· markdown ················· {{{2
augroup filetype_markdown
  autocmd!
  autocmd FileType markdown :onoremap <buffer>
        \ih :<C-U>exe "normal! ?^\\(==\\+\\\|--\\+\\)$\r:noh\rkvg_"<CR>
  autocmd FileType markdown :onoremap <buffer>
        \ah :<C-U>exe "normal! ?^\\(==\\+\\\|--\\+\\)$\r:noh\rVk"<CR>
augroup END

" ::::::::: Functions ::::::::::::::::::::: {{{1

" ··········· netrw ···················· {{{2
fun! NetrwCrsrLn()
  if &filetype ==# "netrw"
    call HiCrsrLn()
  else
    highlight clear CursorLine
  endif
endf

fun! ExToggle(dir)
  if &filetype != "netrw"
    let g:netrw_browse_split=0  " open files in current window
    exe "Explore " . a:dir
  else
    call BClose()
  endif
endf

fun! BClose()
  silent! bprevious | split
  silent! bnext     | bdelete
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

" ··········· splits ··················· {{{2
"fun! SwitchSplit()
"endf

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

" ··········· colors ··················· {{{2
fun! ToggleBG()
  if &background=='light' | set background=dark
  else | set background=light
  endif
endf

fun! ColorCycle(num)
  let cur_idx = index( g:nice_schemes, g:colors_name )
  let new_idx = (cur_idx + a:num) % len(g:nice_schemes)
  let new_nam = g:nice_schemes[new_idx]
  exe "colorscheme " . new_nam
endf

" ··········· cursor ··················· {{{2
fun! ToggleHiCrsrLn()
  let cur_hi = synIDattr(synIDtrans(hlID("CursorLine")), "bg")
  if len(cur_hi) == 0
    call HiCrsrLn()
  else
    highlight clear CursorLine
  endif
endf

fun! HiCrsrLn()
  if &background == "light"
    highlight CursorLine guibg=#CBE4EE ctermbg=195
  else
    highlight CursorLine guibg=#444444 ctermbg=238
  endif
endf

fun! RestoreCrsr()
  if line("'\"") > 1 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endf

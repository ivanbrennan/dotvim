" ::::::::: vimrc :::::::::::::::::::::::::::::::::::::

set nocompatible           " be iMproved
set encoding=utf-8         " default encoding to UTF-8

" ::::::::: Vundle & Plugins :::::::::::::: {{{1

filetype off               " required for Vundle!
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" github repos: general
Bundle 'gmarik/vundle'
Bundle 'tsaleh/vim-matchit'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'ivanbrennan/grep-operator'
Bundle 'ivanbrennan/quickfix-toggle'
Bundle 'ivanbrennan/potion'

" github repos: colors
Bundle 'vim-scripts/hexHighlight.vim'
Bundle 'guns/xterm-color-table.vim'
Bundle 'shawncplus/Vim-toCterm'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gregsexton/Muon'

"" NERDTree or Netrw?
"Bundle 'scrooloose/nerdtree'

filetype plugin indent on       " required!

" ::::::::: Backup and Swap Files ::::::::: {{{1

set backup                      " backup files...
set backupdir=~/.vim/backup     " ...to here
set directory=~/.vim/tmp        " all temp files here
set history=500                 " history 500-deep

" ::::::::: Options ::::::::::::::::::::::: {{{1

" disable intro message
set shortmess+=I

" show commands (disable if this slows things down)
set showcmd

" don't beep
set visualbell

" don't auto-comment with o or O
set formatoptions-=o

" let J handle comments intelligently
set formatoptions+=j

" use this if 'i' flag slows down ins-completion
"set complete-=i

" ::::::::: Mappings :::::::::::::::::::::: {{{1

set timeout timeoutlen=250 ttimeoutlen=100

" virtual leader
map <Space> <Leader>

" leader keys
let mapleader="\\"
let maplocalleader=","

" source / edit vimrc
noremap <LocalLeader>ss :source $MYVIMRC<CR>
noremap <LocalLeader>ee :edit $MYVIMRC<CR>

augroup vimrcgroup    " auto-reload vimrc when it's saved
  autocmd! BufWritePost .vimrc source $MYVIMRC
augroup END

" lazy finger
noremap ; :
noremap - g_

" replace ; and ,
noremap + ;
noremap _ ,

" sensible marks
noremap ` '
noremap ' `

" memo word under cursor
noremap <silent> <Leader>m :silent! normal! #*<CR>

" window size
noremap <Leader>wh :set lines=21<CR>
noremap <Leader>wf :set lines=38<CR>

" ::::::::: Buffers ::::::::::::::::::::::: {{{1

set hidden        " allow hidden buffers

" ··········· navigation ··············· {{{2

" buffers / tabs
noremap <Leader>j :bprevious<CR>
noremap <Leader>k :bnext<CR>
noremap <Leader>h :tabprevious<CR>
noremap <Leader>l :tabnext<CR>

" splits
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" current directory
noremap <LocalLeader>wd :pwd<CR>
noremap <LocalLeader>cd :lcd %:h<CR>

" close
noremap <LocalLeader>d :bdelete<CR>
noremap <LocalLeader>c :bprevious<CR>:bdelete#<CR>

" ··········· navigators ··············· {{{2

" navigators
noremap <Leader><Space> :buffers<CR>
noremap          <S-CR> :buffers<CR>:b

" NERDTree {{{3
"let NERDTreeMinimalUI=1             " minimal UI
"noremap          <C-CR> :NERDTreeToggle<CR>
"noremap   <Leader><Tab> :NERDTreeToggle<CR>
"noremap        <S-C-CR> :NERDTreeClose<CR>
"noremap <Leader><S-Tab> :NERDTreeClose<CR>

"" NERDTree cursorline
"augroup NerdCursor
"  autocmd!
"  autocmd BufEnter NERD_tree_* highlight CursorLine gui=underline
"  autocmd BufLeave NERD_tree_* highlight clear CursorLine
"  autocmd BufAdd * highlight clear CursorLine
"augroup END

" Netrw {{{3
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+,^DS_Store$'
let g:netrw_hide=1              " hide hidden files
let g:netrw_altv=1              " open files on right
let g:netrw_winsize=-25         " tree takes 25 cols
let g:netrw_preview=1           " open previews vertically
let g:netrw_use_errorwindow=0   " suppress error window

noremap <silent> <LocalLeader>r :Rexplore<CR>

" explorer mappings ( ~/.vim/after/ftplugin/netrw.vim )
" nmap <buffer> f <CR>

" enable cursorline (underline) {{{4
augroup NetrwCursor
  autocmd!
  autocmd FileType netrw call HighlightCursor()
  autocmd FileType netrw autocmd BufEnter <buffer> call HighlightCursor()
  autocmd FileType netrw autocmd BufLeave <buffer> highlight clear CursorLine
augroup END

function! HighlightCursor()
  if &background == "light"
    highlight CursorLine guibg=#CBE4EE ctermbg=195
  else
    highlight CursorLine guibg=#444444 ctermbg=238
  end
endfunc

" Explorer {{{4
noremap <C-CR> :call NetEx()<CR>
function! NetEx()
  let g:netrw_banner=1            " banner
  let g:netrw_liststyle=0         " thin
  let g:netrw_browse_split=0      " open files in current window
  Explore
endfunc

" VexToggle {{{4
noremap <Leader><Tab> :call VexToggle()<CR>

function! VexToggle()
  if !exists( "t:expl_buf_num" )
    let g:netrw_banner=0
    let g:netrw_liststyle=3
    let g:netrw_browse_split=4
    Vexplore
    wincmd H
    execute 'vertical resize' . abs( g:netrw_winsize )
    let t:expl_buf_num = bufnr( "%" )
  else
    if bufwinnr( t:expl_buf_num ) == -1
      unlet t:expl_buf_num
      call VexToggle()
    else
      let t:cur_win_nr = winnr()
      1wincmd w
      close
      execute ( t:cur_win_nr - 1 ) . 'wincmd w'
      unlet t:expl_buf_num
    endif
  endif
endfunc

" ··········· edit ····················· {{{2

" in home directory
noremap <LocalLeader>eh :edit ~/

" in current file's directory (not PWD)
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
nmap <LocalLeader>ew :edit %%
nmap <LocalLeader>es :split %%
nmap <LocalLeader>ev :vsplit %%
nmap <LocalLeader>et :tabedit %%

" ··········· split ···················· {{{2

" open / close
noremap <Leader>s :split<CR>
noremap <Leader>v :vsplit<CR>
noremap <Leader>o :only<CR>

" resize
noremap <Leader>- <C-W>_
noremap <Leader>] <C-W><Bar>
noremap <Leader>= <C-W>=

"function! SwitchSplit()
"endfunc

" replace this with SwitchSplit()
"noremap <Leader><Leader>s <C-W>t<C-W>K
"noremap <Leader><Leader>v <C-W>t<C-W>H

" ::::::::: Appearance :::::::::::::::::::: {{{1

set title           " xterm title
set number          " line numbers
set nowrap          " don't wrap lines
set sidescroll=1    " smooth sidescroll
syntax enable       " syntax highlighting, local overrides

noremap <LocalLeader>y :call SynStack()<CR>
function! SynStack() " {{{
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}

" toggle wrapping
noremap <Leader>ww :set wrap! linebreak! list! wrap?<CR>

" hex highlight
noremap <LocalLeader>h :call HexHighlight()<CR>

" ··········· fonts ···················· {{{2

set guifont=Source\ Code\ Pro:h15
noremap <LocalLeader>ff :call FontCycle()<CR>:echo getfontname()<CR>

let g:font_dict =
      \{
      \"Anonymous Pro":    3,
      \"Inconsolata":      1,
      \"Menlo":            0,
      \"Monaco":          -2,
      \"Source Code Pro": -1,
      \}

function! FontCycle() " {{{3
  let l:font_nams = sort( keys( g:font_dict ) )
  " current info
  let l:cur_parts = split( getfontname(), ':' )
  let [ l:cur_nam, l:cur_hgt ] = [ l:cur_parts[0], l:cur_parts[1] ]
  let l:cur_idx = index( l:font_nams, l:cur_nam )
  " new name
  let l:new_idx = ( l:cur_idx + 1 ) % len( l:font_nams )
  let l:new_nam = l:font_nams[ l:new_idx ]
  " new height
  let l:cur_adj = get( g:font_dict, l:cur_nam, 0 )
  let l:new_adj = g:font_dict[ l:new_nam ]
  let l:new_hgt = l:cur_hgt - l:cur_adj + l:new_adj
  " assign new font
  let l:new_font = join( [ l:new_nam, l:new_hgt ], ":h" )
  execute "set guifont=" . escape( l:new_font, " ")
endfunc

" ··········· whitespace ··············· {{{2

set tabstop=2                   " tab is two spaces
set softtabstop=2               " softtab is two spaces
set shiftwidth=2                " autoindent is two spaces
set expandtab                   " convert tabs to spaces
set backspace=indent,eol,start  " backspace through everything
set textwidth=0                 " no autowrap

set list                        " show invisible characters
set listchars=""                " reset the listchars
set listchars=tab:▸\            " tab
set listchars+=trail:·          " trailing space
set listchars+=extends:»        " continues offscreen
set listchars+=precedes:«       " precedes offscreen

" ··········· colors ··················· {{{2

colorscheme ivisu
noremap <LocalLeader>` :call ColorCycle()<CR>:colorscheme<CR>

" toggle background
call togglebg#map("")
noremap <LocalLeader>b :ToggleBG<CR>

" nice colorschemes {{{3
let g:nice_schemes =
      \[
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

function! ColorCycle() " {{{3
  let l:cur_idx = index( g:nice_schemes, g:colors_name )
  let l:new_idx = ( l:cur_idx + 1 ) % len( g:nice_schemes )
  let l:new_nam = g:nice_schemes[ l:new_idx ]
  execute "colorscheme " . l:new_nam
endfunc

" ··········· line numbers ············· {{{2

noremap <Leader>n :set number! number?<CR>
noremap <Leader>r :set relativenumber! relativenumber?<CR>

" hilight line number
set cursorline                " turn on cursorline
highlight clear CursorLine    " highlight line-number only
augroup cursorline
  autocmd!
  autocmd ColorScheme * highlight clear CursorLine
  autocmd WinLeave * setlocal nocursorline
  autocmd WinEnter,BufRead * setlocal cursorline
augroup END

" ··········· cursor ··················· {{{2

set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0

" ··········· status line ·············· {{{2

set fillchars+=vert:\           " clean dividers
set laststatus=2                " show statusline

set statusline=
set statusline+=%<              " cut at start
set statusline+=\ %f\           " path
set statusline+=%y              " filetype
set statusline+=%m              " modified
set statusline+=%=\             " left/right separator
set statusline+=(%l/%L):%-3v    " row:virtual-column
set statusline+=%4.P\           " percent through file

" ::::::::: Gui Settings :::::::::::::::::: {{{1

if has("gui_running")
  set transparency=5
endif

" force these mappings after gvimrc has run
augroup gui_group
  autocmd!
  au GUIEnter * nnoremap <silent> <M-Up> mZ:move .-2<CR>==`Z
  au GUIEnter * vnoremap          <M-Up> :move '<-2<CR>gv=gv
  au GUIEnter * inoremap          <M-Up> <Esc>:move .-2<CR>==gi
  au GUIEnter * nnoremap <silent> <M-Down> mZ:move .+1<CR>==`Z
  au GUIEnter * vnoremap          <M-Down> :move '>+1<CR>gv=gv
  au GUIEnter * inoremap          <M-Down> <Esc>:move .+1<CR>==gi
  " bubble text left / right
  au GUIEnter * vnoremap
        \<M-Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
  au GUIEnter * vnoremap
        \<M-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o
augroup END

" ::::::::: Navigation :::::::::::::::::::: {{{1

set foldmethod=marker
set scrolloff=2

" soft line-breaks
noremap    <Up> gk
noremap  <Down> gj
" behave normally if popup-menu visible
inoremap   <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>
inoremap <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>

" ::::::::: Editing ::::::::::::::::::::::: {{{1

" format entire file
noremap <LocalLeader>fef :normal! gg=G``<CR>

" whole line completion
inoremap <C-L> <C-X><C-L>

" autocomplete parens, brackets, braces
inoremap (<CR> (<CR>)<Esc>O<Tab>
inoremap [<CR> [<CR>]<Esc>O<Tab>
inoremap {<CR> {<CR>}<Esc>O<Tab>

" exit insert mode
inoremap    kj <Esc>`^
inoremap    jk <Esc>`^
inoremap <C-[> <Esc>`^

" open above / below current line
inoremap <S-CR> <C-O>O
inoremap <C-CR> <C-O>o
" insert above / below current line
noremap <S-Space> mzO<Esc>j`z
noremap <C-Space> mzo<Esc>k`z

" toggle case
inoremap <LocalLeader>` <Esc>viwg~gi

" paste toggle
noremap <LocalLeader>t :set paste! paste?<CR>
noremap           <F4> :set paste! paste?<CR>
set pastetoggle=<F4>

" bubble text up / down
nnoremap <silent> <Leader><Up> mZ:move .-2<CR>==`Z
vnoremap          <Leader><Up> :move '<-2<CR>gv=gv
nnoremap <silent> <Leader><Down> mZ:move .+1<CR>==`Z
vnoremap          <Leader><Down> :move '>+1<CR>gv=gv
" bubble text left / right
vnoremap  <Leader><Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
vnoremap <Leader><Right> <Esc>`><Right>gvxpgv<Right>o<Right>o

" ::::::::: Searching ::::::::::::::::::::: {{{1

set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ...unless they contain a capital letter

" toggle search highlighting
noremap <LocalLeader><Space> :set hlsearch! hlsearch?<CR>

" find merge conflicts
noremap <silent> <LocalLeader>cc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" ::::::::: FileType :::::::::::::::::::::: {{{1

" ··········· vim ······················ {{{2
augroup filetype_vim
  autocmd!
  au FileType vim setlocal foldmethod=marker
  " comments
  au FileType vim nnoremap <buffer>
        \<C-_> mA0i"<Esc>`Al
  au FileType vim vnoremap <buffer>
        \<C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END
" ··········· ruby ····················· {{{2
augroup filetype_ruby
  autocmd!
  au FileType ruby set omnifunc=rubycomplete#Complete
  " complete buffer loading can cause code execution
  " turn this off if it's a concern
  au FileType ruby let g:rubycomplete_buffer_loading=1
  au FileType ruby let g:rubycomplete_classes_in_global=1
  au FileType ruby let g:rubycomplete_rails = 1
  " if snippet
  au FileType ruby :inoreabbrev <buffer>
        \iff if<CR>end<Esc>kA
  " comments
  au FileType ruby nnoremap <buffer>
        \<C-_> mZ0i#<Esc>`Zl
  au FileType ruby vnoremap <buffer>
        \<C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END
" ··········· eruby ···················· {{{2
augroup filetype_eruby
  autocmd!
  au FileType eruby set omnifunc=rubycomplete#Complete
  " complete buffer loading can cause code execution
  " turn this off if it's a concern
  au FileType eruby let g:rubycomplete_buffer_loading=1
  au FileType eruby let g:rubycomplete_classes_in_global=1
  au FileType eruby let g:rubycomplete_rails = 1
  au FileType eruby :inoreabbrev <buffer> erb <% %><Left><Left><Left>
  au FileType eruby :inoreabbrev <buffer> erp <%= %><Left><Left><Left>
  au FileType eruby :inoreabbrev <buffer> erc <%# %><Left><Left><Left>
  au FileType eruby :inoreabbrev <buffer>
        \iff <% if %><% end %><Left><Left><Left><Left><Left><Left><Left><Left><Left>
augroup END
" ··········· python ··················· {{{2
augroup filetype_python
  autocmd!
  au FileType python :inoreabbrev <buffer> iff if:<left>
  " comments
  au FileType python nnoremap <buffer>
        \<C-_> mZ0i#<Esc>`Zl
  au FileType python vnoremap <buffer>
        \<C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END
" ··········· javascript ··············· {{{2
augroup filetype_javascript
  autocmd!
  " if statement
  au FileType javascript :inoreabbrev <buffer> iff if ()<Left>
  " add semicolon
  au FileType javascript noremap <buffer> <Leader>; mZA;<Esc>`Z
augroup END
" ··········· markdown ················· {{{2
augroup filetype_markdown
  autocmd!
  au FileType markdown :onoremap <buffer>
        \ih :<C-U>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:noh\rkvg_"<CR>
  au FileType markdown :onoremap <buffer>
        \ah :<C-U>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:noh\rVk"<CR>
augroup END

" ::::::::: Abbreviations ::::::::::::::::: {{{1

" shortcuts
noreabbrev fnn function
noreabbrev fn! function!

" common typos
noreabbrev verison version
noreabbrev funiction function
noreabbrev funcition function
noreabbrev funciotn function
noreabbrev funciton function

" ::::::::: Operator Pending :::::::::::::: {{{1

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

" ::::::::: Function Keys ::::::::::::::::: {{{1

" <F1> Help
" <F4> pastetoggle (see editing)

" ::::::::: Wild Settings ::::::::::::::::: {{{1

set wildmenu

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

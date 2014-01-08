" ::::::::: vimrc :::::::::::::::::::::::::::::::::::::

set nocompatible           " be iMproved
set encoding=utf-8         " default encoding to UTF-8

" ::::::::: Plugins ::::::::::::::::::::::: {{{1

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

filetype plugin indent on       " required!

" ::::::::: Settings :::::::::::::::::::::: {{{1

" notifications
set shortmess+=I        " disable intro message
set showcmd             " show commands (remove if slow)
set visualbell          " don't beep

" posterity
set backup                      " backup files
set backupdir=~/.vim/backup     " backups here
set directory=~/.vim/tmp        " temp files here
set history=500                 " history 500-deep

" buffers
set hidden        " allow hidden buffers

" timeout
set timeout timeoutlen=250 ttimeoutlen=100

" ··········· netrw ····················
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+,^DS_Store$'
let g:netrw_hide=1              " hide hidden files
let g:netrw_altv=1              " open files on right
let g:netrw_winsize=-25         " tree takes 25 cols
let g:netrw_preview=1           " open previews vertically
let g:netrw_use_errorwindow=0   " suppress error window

" ··········· appearance ···············
syntax enable          " syntax highlighting, local overrides
set title              " xterm title
set nowrap             " don't wrap lines
set number             " line numbers
set fillchars+=vert:\  " clean dividers

" ··········· fonts ····················
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

" ··········· cursor ···················
set cursorline         " turn on cursorline

set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0

" ··········· line numbers ·············
augroup cursorline
  autocmd!
  autocmd ColorScheme * highlight clear CursorLine
  autocmd WinEnter,BufRead,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" ··········· whitespace ···············
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

" ··········· colors ···················
set background=dark

if has("gui_running")
  colorscheme ivisu | set transparency=5
else
  colorscheme muon
endif
highlight clear CursorLine

" nice colorschemes
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

" ··········· status line ··············
set laststatus=2                " show statusline

set statusline=
set statusline+=%<              " cut at start
set statusline+=\ %f\           " path
set statusline+=%y              " filetype
set statusline+=%m              " modified
set statusline+=%=\             " left/right separator
set statusline+=(%l/%L):%-3v    " row:virtual-column
set statusline+=%4.P\           " percent through file

" ··········· navigation ···············
set foldmethod=marker
set scrolloff=2
set sidescroll=1      " smooth sidescroll

" ··········· editing ··················
set backspace=indent,eol,start  " backspace through everything
set textwidth=0       " no autowrap
"set complete-=i        " speed up ins-completion

" formatting
set formatprg=par       " gq -> par, gw -> internal
set formatoptions-=o    " don't auto-comment with o or O
silent! set formatoptions+=j " let J handle comments if supported

" ··········· searching ················
set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ...unless they contain a capital letter

" ··········· wild settings ············
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

" ::::::::: Mappings :::::::::::::::::::::: {{{1

map <Space> <Leader>
let maplocalleader=","

" ··········· Buffers ··················
" open from ~
noremap <LocalLeader>e, :edit ~/

" open from %
nmap <LocalLeader>ew :edit %%
nmap <LocalLeader>es :split %%
nmap <LocalLeader>ev :vsplit %%
nmap <LocalLeader>et :tabedit %%
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" close
noremap <LocalLeader>d :bdelete<CR>
noremap <LocalLeader>c :bprevious<CR>:bdelete#<CR>

" current directory
noremap <LocalLeader>w :pwd<CR>
noremap <LocalLeader>5 :lcd %:h<CR>

" list
noremap <S-CR> :buffers<CR>:b
noremap <Leader><Space> :buffers<CR>

" cycle
noremap <Leader>j :bprevious<CR>
noremap <Leader>k :bnext<CR>
noremap <Leader>h :tabprevious<CR>
noremap <Leader>l :tabnext<CR>

" ··········· Netrw ····················
" netrw
noremap <C-CR> :call NetEx()<CR>
noremap <Leader><Tab> :call VexToggle()<CR>

" ··········· Misc ·····················
" source / edit vimrc
noremap <LocalLeader>v :source $MYVIMRC<CR>
noremap <LocalLeader>v, :tabedit $MYVIMRC<CR>

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

" syntax revealer
noremap <LocalLeader>y :call SynStack()<CR>

" ··········· Splits ···················
noremap <Leader>s :split<CR>
noremap <Leader>v :vsplit<CR>
noremap <Leader>o :only<CR>

" resize
noremap <Leader>- <C-W>_
noremap <Leader>] <C-W><Bar>
noremap <Leader>= <C-W>=

" navigate
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
noremap <LocalLeader>ww :call NavToggle()<CR>

" replace this with SwitchSplit()
"noremap <Leader><Leader>s <C-W>t<C-W>K
"noremap <Leader><Leader>v <C-W>t<C-W>H

" ··········· Appearance ···············
noremap <Leader>ww :set wrap! linebreak! list! wrap?<CR>
noremap <LocalLeader>h :call HexHighlight()<CR>

" ··········· fonts ····················
noremap <silent> <LocalLeader>= :call FontCycle(1)<CR>:echo getfontname()<CR>
noremap <silent> <LocalLeader>- :call FontCycle(-1)<CR>:echo getfontname()<CR>

" ··········· colors ···················
noremap <silent> <LocalLeader>] :call ColorCycle(1)<CR>:colorscheme<CR>
noremap <silent> <LocalLeader>[ :call ColorCycle(-1)<CR>:colorscheme<CR>

noremap <LocalLeader>b :ToggleBG<CR>:echo &background<CR>

" ··········· line numbers ·············
noremap <Leader>n :set number! number?<CR>
noremap <Leader>r :set relativenumber! relativenumber?<CR>

" ··········· cursor ···················
noremap <silent> <Leader>c :call ToggleHiCrsrLn()<CR>

" ··········· navigation ···············
" soft line-breaks
noremap    <Up> gk
noremap  <Down> gj
" behave normally if popup-menu visible
inoremap   <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>
inoremap <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>

" ··········· editing ··················
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

" ··········· gui-only ·················
" force these mappings after gvimrc has run
augroup guioverrides
  autocmd!
  " bubble text up / down
  au GUIEnter * nnoremap <silent> <M-Up> mZ:move .-2<CR>==`Z
  au GUIEnter * vnoremap          <M-Up> :move '<-2<CR>gv=gv
  au GUIEnter * inoremap          <M-Up> <Esc>:move .-2<CR>==gi
  au GUIEnter * nnoremap <silent> <M-Down> mZ:move .+1<CR>==`Z
  au GUIEnter * vnoremap          <M-Down> :move '>+1<CR>gv=gv
  au GUIEnter * inoremap          <M-Down> <Esc>:move .+1<CR>==gi
  " bubble text left / right
  au GUIEnter * vnoremap <M-Left> <Esc>`<<Left>i_<Esc>mz"_xgvx`zPgv<Left>o<Left>o
  au GUIEnter * vnoremap <M-Right> <Esc>`><Right>gvxpgv<Right>o<Right>o
augroup END

" ··········· searching ················
" search and replace
noremap  ;; :%s:::g<Left><Left><Left>
noremap  ;' :%s:::cg<Left><Left><Left>
cnoremap ;/ \(\)<Left><Left>

" toggle search highlighting
noremap <LocalLeader><Space> :set hlsearch! hlsearch?<CR>

" find merge conflicts
noremap <silent> <LocalLeader>cc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" ··········· abbreviations ············
" shortcuts
noreabbrev fnn function
noreabbrev fn! function!

" common typos
noreabbrev verison version
noreabbrev funiction function
noreabbrev funcition function
noreabbrev funciotn function
noreabbrev funciton function

" ··········· operator pending ·········
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

" ::::::::: FileType :::::::::::::::::::::: {{{1

" ··········· vimrc ····················
augroup vimrcgroup
  autocmd!
  autocmd BufWritePost .vimrc source $MYVIMRC
  autocmd BufReadPost * call RestoreCrsr()
augroup END

" ··········· vim ······················
augroup filetype_vim
  autocmd!
  au FileType vim setlocal foldmethod=marker
  " comments
  au FileType vim nnoremap <buffer>
        \<C-_> mA0i"<Esc>`Al
  au FileType vim vnoremap <buffer>
        \<C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END

" ··········· netrw ····················
augroup NetrwGroup
  autocmd!
  autocmd FileType * call NetrwCrsrLn()
  autocmd BufEnter * call NetrwCrsrLn()
augroup END

" ··········· ruby ·····················
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

" ··········· eruby ····················
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

" ··········· python ···················
augroup filetype_python
  autocmd!
  au FileType python :inoreabbrev <buffer> iff if:<left>
  " comments
  au FileType python nnoremap <buffer>
        \<C-_> mZ0i#<Esc>`Zl
  au FileType python vnoremap <buffer>
        \<C-_> <Esc>`<mA`>mZ'<<C-V>'>I"<Esc>g`Alvg`Zl
augroup END

" ··········· javascript ···············
augroup filetype_javascript
  autocmd!
  " if statement
  au FileType javascript :inoreabbrev <buffer> iff if ()<Left>
  " add semicolon
  au FileType javascript noremap <buffer> <Leader>; mZA;<Esc>`Z
augroup END

" ··········· markdown ·················
augroup filetype_markdown
  autocmd!
  au FileType markdown :onoremap <buffer>
        \ih :<C-U>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:noh\rkvg_"<CR>
  au FileType markdown :onoremap <buffer>
        \ah :<C-U>execute "normal! ?^\\(==\\+\\\|--\\+\\)$\r:noh\rVk"<CR>
augroup END

" ::::::::: Functions ::::::::::::::::::::: {{{1

" ··········· netrw ···················· {{{2
function! NetrwCrsrLn()
  if &filetype ==# 'netrw'| call HiCrsrLn()
  else | highlight clear CursorLine
  endif
endfunc

function! NetEx()
  let g:netrw_banner=1            " banner
  let g:netrw_liststyle=0         " thin
  let g:netrw_browse_split=0      " open files in current window
  Explore
endfunc

function! VexToggle()
  if !exists( "t:expl_buf_num" )
    let g:netrw_banner=0          " no banner
    let g:netrw_liststyle=3       " tree
    let g:netrw_browse_split=4    " open files in previous window
    Vexplore | wincmd H
    execute 'vertical resize' . abs( g:netrw_winsize )
    let t:expl_buf_num = bufnr( "%" )
  else
    if bufwinnr( t:expl_buf_num ) == -1
      unlet t:expl_buf_num | call VexToggle()
    else
      let t:cur_win_nr = winnr()
      1wincmd w | close
      execute ( t:cur_win_nr - 1 ) . 'wincmd w'
      unlet t:expl_buf_num
    endif
  endif
endfunc

" ··········· splits ··················· {{{2
function! NavToggle()
  " map/unmap split navigators
  echo "implement this"
endfunc

"function! SwitchSplit()
"endfunc

" ··········· syntax ··················· {{{2
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ··········· fonts ···················· {{{2
function! FontCycle(num)
  let l:font_nams = sort( keys( g:font_dict ) )
  " current info
  let l:cur_parts = split( getfontname(), ':' )
  let [ l:cur_nam, l:cur_hgt ] = [ l:cur_parts[0], l:cur_parts[1] ]
  let l:cur_idx = index( l:font_nams, l:cur_nam )
  " new name
  let l:new_idx = ( l:cur_idx + a:num ) % len( l:font_nams )
  let l:new_nam = l:font_nams[ l:new_idx ]
  " new height
  let l:cur_adj = get( g:font_dict, l:cur_nam, 0 )
  let l:new_adj = g:font_dict[ l:new_nam ]
  let l:new_hgt = l:cur_hgt - l:cur_adj + l:new_adj
  " assign new font
  let l:new_font = join( [ l:new_nam, l:new_hgt ], ":h" )
  execute "set guifont=" . escape( l:new_font, " ")
endfunc

" ··········· colors ··················· {{{2
function! ColorCycle(num)
  let l:cur_idx = index( g:nice_schemes, g:colors_name )
  let l:new_idx = ( l:cur_idx + a:num ) % len( g:nice_schemes )
  let l:new_nam = g:nice_schemes[ l:new_idx ]
  execute "colorscheme " . l:new_nam
endfunc

" ··········· cursor ··················· {{{2
function! ToggleHiCrsrLn()
  let l:cur_hi = synIDattr(synIDtrans(hlID("CursorLine")), "bg")
  if len(l:cur_hi) == 0
    call HiCrsrLn()
  else
    highlight clear CursorLine
  endif
endfunc

function! HiCrsrLn()
  if &background == "light"
    highlight CursorLine guibg=#CBE4EE ctermbg=195
  else
    highlight CursorLine guibg=#444444 ctermbg=238
  endif
endfunc

function! RestoreCrsr()
  if line("'\"") > 1 && line("'\"") <= line("$")
    execute "normal! g`\""
  endif
endfunc

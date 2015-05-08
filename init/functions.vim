" ::::::::: Functions :::::::::::::::::::::

" ··········· filetype ················· {{{1
function! FileTypeToggle(num)
  if a:num > 0 || !exists("b:alt_ftype")
    let b:alt_ftype = &filetype
    let   &filetype = input("enter FileType: ")
  else
    let     new_alt = &filetype
    let   &filetype = b:alt_ftype
    let b:alt_ftype = new_alt
  end
endfunction

function! HTMLTypeToggle()
  if exists("b:alt_ftype")
    let &filetype = b:alt_ftype
    unlet b:alt_ftype
  else
    let b:alt_ftype = &filetype
    set filetype=html
  end
endfunction

" ··········· line numbers ············· {{{1
function! NumberToggle()
  if &number == 0
    set foldcolumn=0 number number?
  else
    set foldcolumn=1 nonumber number?
  end
endfunction

" ··········· folding ·················· {{{1
function! FoldMethToggle()
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
endfunction

function! FoldColToggle(fold_max)
  if &foldcolumn < a:fold_max
    call FoldColOn(a:fold_max)
  else
    call FoldColOff()
  endif
endfunction

function! FoldColOn(fold_max)
  let w:use_num  = &number==1
  let w:use_rel  = &relativenumber==1
  let w:fold_min = &foldcolumn

  set nonumber norelativenumber
  let &foldcolumn = a:fold_max
endfunction

function! FoldColOff()
  let [ &number, &relativenumber ] = [ w:use_num, w:use_rel ]
  let &foldcolumn = w:fold_min
endfunction

" ··········· syntax ··················· {{{1
function! SynStack()
  if exists("*synstack")
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endif
endfunction

" ··········· statusline ··············· {{{1
function! RefreshUI()
  if exists(':AirlineRefresh')
    AirlineRefresh
  else
    redraw!
    redrawstatus!
  endif
endfunction

function! AirlineInit()
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_section_z = '%v : %l/%L (%n)'
  let g:airline_theme='lateron'
endfunction

call AirlineInit()

" ··········· colors ··················· {{{1
function! ToggleBG()
  if exists("g:colors_name") | let cur_colo = g:colors_name | endif

  if &background=='dark' | set background=light
  else                   | set background=dark | endif

  if !exists("g:colors_name") && exists("cur_colo")
    let g:colors_name = cur_colo
  endif
endfunction

function! ToggleColorscheme()
  if exists("g:colors_name")
    if g:colors_name == 'ion' | colorscheme blight
    else                      | colorscheme ion | endif
  endif
endfunction

function! TransparencyToggle(transpr)
  if exists("g:transparency_memo")
    let &transparency = g:transparency_memo
    unlet g:transparency_memo
  else
    let g:transparency_memo = &transparency
    let &transparency=a:transpr
  end
endfunction

function! ColorColToggle()
  if &colorcolumn == ""
    set colorcolumn=80
  else
    set colorcolumn=
  endif
endfunction

" ··········· braces ··················· {{{1
function! NextTextObject(motion)
  echo
  let c = nr2char(getchar())
  execute "normal! f" . c . "v" . a:motion . c
endfunction

" ··········· tab key ·················· {{{1
function! SuperTab(complete, tab)
  " complete if popup-menu displayed
  if pumvisible() | return a:complete | endif

  let line = getline('.')  " current line
  let col  = col('.') - 2  " previous character's col index

  " tab if not finishing a word/filename
  if empty(line) || line[col] !~ '\k\|[/~.]' || line[col + 1] =~ '\k'
    " on empty line
    " OR not following part of a word/filename
    " OR within a word/filename
    return a:tab
  endif

  " group of non-whitespace characters before cursor
  let prefix = expand(matchstr(line[0:col], '\S*$'))

  " complete filename if finishing a path
  if prefix =~ '^[~/.]' | return "\<c-x>\<c-f>" | endif

  " perform custom completion if possible
  if !empty(&completefunc) && call(&completefunc, [1, prefix]) >= 0
    return "\<c-x>\<c-u>"
  endif

  return a:complete
endfunction

" ··········· git ······················ {{{1
"Git branch
function! GitBranch()
  let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
  if branch != ''
    return '(' . substitute(branch, '\n', '', 'g') . ')'
  endif
  return ''
endfunction

function! ReloadBuffers()
  set autoread
  silent! checktime
  set noautoread
  echo 'reloaded!'
endfunction

" ··········· vmux ····················· {{{1
function! Vmux()
  VmuxPrimary
  let g:spec_runner_dispatcher = "call system(\"tmux send -t " . g:vmux_primary . " C-L '{command}' ENTER\")"
endfunction

function! Vtux()
  let g:spec_runner_dispatcher = "VtrSendCommand! {command}"
endfunction

" ··········· keyboard ················· {{{1
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

" ··········· norman ··················· {{{2
function! NormanMaps()
  " ··· home ············ {{{3
  noremap <C-Y> h
  noremap <C-I> k
  noremap <C-O> l
  noremap <C-H> <C-I>
  noremap <C-J> <C-Y>
  noremap <C-P> <C-O>
  " }}}
  " ··· arch ············ {{{3
  " noremap <C-R> k
  " noremap <C-Y> h
  " noremap <C-L> l
  " noremap <C-U> <C-R>
  " noremap <C-J> <C-Y>
  " noremap     l <C-L>
  " }}}
endfunction
function! NormanUnmaps()
  " ··· home ············ {{{3
  silent! unmap <C-Y>
  silent! unmap <C-I>
  silent! unmap <C-O>
  silent! unmap <C-H>
  silent! unmap <C-J>
  silent! unmap <C-P>
  " }}}
  " ··· arch ············ {{{3
  " silent! unmap <C-R>
  " silent! unmap <C-Y>
  " silent! unmap <C-L>
  " silent! unmap <C-U>
  " silent! unmap <C-J>
  " silent! unmap l
  " }}}
endfunction

" ··········· qwerty ··················· {{{2
function! QWERTYMaps()
endfunction
function! QWERTYUnmaps()
endfunction

" ··········· workman ·················· {{{2
function! WorkmanMaps()
  " ··· home ············ {{{3
  noremap <C-E> k
  noremap <C-Y> h
  noremap <C-O> l
  noremap k <C-E>
  noremap j <C-Y>
  noremap <C-K> <C-O>
  " }}}
  " ··· arch ············ {{{3
  " noremap <C-U> k
  " noremap <C-Y> h
  " noremap <C-P> l
  " noremap <C-J> <C-Y>
  " }}}
  " ··· swap ············ {{{3
  " noremap j k
  " noremap k j
  " }}}
  " ··· mix ············· {{{3
  " noremap <C-E> k
  " noremap <C-K> <C-E>
  " }}}
endfunction
function! WorkmanUnmaps()
  " ··· home ············ {{{3
  silent! unmap <C-E>
  silent! unmap <C-Y>
  silent! unmap <C-O>
  silent! unmap k
  silent! unmap j
  silent! unmap <C-K>
  " }}}
  " ··· arch ············ {{{3
  " silent! unmap <C-U>
  " silent! unmap <C-Y>
  " silent! unmap <C-P>
  " silent! unmap <C-J>
  " }}}
  " ··· swap ············ {{{3
  " silent! unmap j
  " silent! unmap k
  " }}}
  " ··· mix ············· {{{3
  " silent! unmap <C-E>
  " silent! unmap <C-K>
  " }}}
endfunction

" ··········· initialize ··············· {{{2
call QWERTYMaps()
" call WorkmanMaps()

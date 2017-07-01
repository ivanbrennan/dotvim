" ::::::::: Functions :::::::::::::::::::::

" ··········· vimrc ···················· {{{1
func! EditDotVim(...)
  execute 'edit '. (a:0 > 0 ? DotVim('init/'.a:1) : resolve($MYVIMRC))
endf

func! ListDotVimFiles(A,L,P)
  return system("find ". DotVim('init/') ." -type f -name '*.vim' -exec basename -a {} +")
endf

func! DotVim(...)
  let l:dir = fnamemodify(resolve($MYVIMRC), ':h')
  return (a:0 > 0) ? l:dir.'/'.a:1 : l:dir
endf

" ··········· filetype ················· {{{1
func! FileTypeToggle(num)
  if a:num > 0 || !exists("b:alt_ftype")
    let b:alt_ftype = &filetype
    let   &filetype = input("enter FileType: ")
  else
    let     new_alt = &filetype
    let   &filetype = b:alt_ftype
    let b:alt_ftype = new_alt
  end
endf

func! HTMLTypeToggle()
  if exists("b:alt_ftype")
    let &filetype = b:alt_ftype
    unlet b:alt_ftype
  else
    let b:alt_ftype = &filetype
    set filetype=html
  end
endf

" ··········· line numbers ············· {{{1
func! NumberToggle()
  if &number == 0
    set foldcolumn=0 number number?
  else
    set foldcolumn=1 nonumber number?
  end
endf

" ··········· status toggle ············ {{{1
func! StatusToggle()
  if &laststatus == 2
    set laststatus=0
  else
    set laststatus=2
  end
endf

" ··········· repositioning ············ {{{1
func! Reposition()
  let target = float2nr(round(winheight(0) / 3.0))
  let diff   = winline() - target
  if diff > 0
    let movement = diff . ''
  else
    let movement = -diff . ''
  endif
  execute 'normal ' . movement
endf

" ··········· transposition ············ {{{1
func! TransposeChars()
  let l:col  = CursorPos()
  let l:line = CursorLine()

  if l:col == 1
    return ''
  elseif l:col > len(l:line)
    return TransposePrecedingChars(l:line, l:col)
  else
    return TransposeSurroundingChars(l:line, l:col)
  endif
endf

func! CursorPos()
  return mode() == 'c' ? getcmdpos() : col('.')
endf

func! CursorLine()
  return mode() == 'c' ? getcmdline() : getline('.')
endf

func! TransposePrecedingChars(line, col)
  if a:col > 2
    return "\<BS>\<BS>" . a:line[ a:col-2 ] . a:line[ a:col-3 ]
  else
    return mode() == 'i' ? "\<C-G>U\<Left>" : "\<Left>"
  end
endf

func! TransposeSurroundingChars(line, col)
  return "\<BS>\<Del>" . a:line[ a:col-1 ] . a:line[ a:col-2 ]
endf

" ··········· movement ················· {{{1
func! MoveToBol()
  return col('.') > 1 ? '0' : '^'
endf

" ··········· folding ·················· {{{1
func! FoldMethCycle()
  if &foldmethod == 'syntax'
    set foldmethod=indent
  elseif &foldmethod == 'indent'
    set foldmethod=marker
  elseif &foldmethod == 'marker'
    set foldmethod=syntax
  endif

  if &filetype == 'ruby'
    if &foldmethod == 'syntax'
      let ruby_fold = 1
    elseif exists('ruby_fold')
      unlet ruby_fold
    endif
  endif
endf

func! FoldColToggle(fold_max)
  if &foldcolumn < a:fold_max
    call FoldColOn(a:fold_max)
  else
    call FoldColOff()
  endif
endf

func! FoldColOn(fold_max)
  let w:use_num  = &number==1
  let w:use_rel  = &relativenumber==1
  let w:fold_min = &foldcolumn

  set nonumber norelativenumber
  let &foldcolumn = a:fold_max
endf

func! FoldColOff()
  let [ &number, &relativenumber ] = [ w:use_num, w:use_rel ]
  let &foldcolumn = w:fold_min
endf

" ··········· syntax ··················· {{{1
func! SynStack()
  return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endf

func! SynHighlights(...)
  let l:stack  = SynStack()
  let l:arg    = a:0 > 0 ? a:1 : 0
  let l:offset = max([l:arg, -len(l:stack)])

  for name in l:stack[l:offset:]
    exe 'verbose hi ' . name
  endfor
endf

command! -nargs=0 SynStack call SynStack()
command! -nargs=0 SynHighlight call SynHighlights(-1)
command! -nargs=? SynHighlights call SynHighlights(<args>)

" ··········· colors ··················· {{{1
func! ToggleBG()
  if exists("g:colors_name") | let cur_colo = g:colors_name | endif

  if &background=='dark' | set background=light
  else                   | set background=dark | endif

  if !exists("g:colors_name") && exists("cur_colo")
    let g:colors_name = cur_colo
  endif
endf

func! ToggleColorscheme()
  if exists("g:colors_name")
    if g:colors_name == 'ion' | colorscheme blight
    else                      | colorscheme ion | endif
  endif
endf

func! TransparencyToggle(transpr)
  if exists("g:transparency_memo")
    let &transparency = g:transparency_memo
    unlet g:transparency_memo
  else
    let g:transparency_memo = &transparency
    let &transparency=a:transpr
  end
endf

func! ColorColToggle()
  if &colorcolumn == ""
    let width = (&textwidth > 0) ? &textwidth : 80
    let &colorcolumn=join(range(width+1, width+256),',')
  else
    set colorcolumn=
  endif
endf

" ··········· braces ··················· {{{1
func! NextTextObject(motion)
  echo
  let c = nr2char(getchar())
  execute "normal! f" . c . "v" . a:motion . c
endf

" ··········· tab key ·················· {{{1
func! SuperTab(complete, tab)
  " complete if popup-menu displayed
  if pumvisible() | return a:complete | endif

  let line = getline('.')  " current line
  let col  = col('.') - 2  " previous character's col index

  " tab if not finishing a word/filename
  if empty(line) || line[col] !~ '\k\|[/~.]' || line[col + 1] =~ '\k' || &expandtab == 0
    " on empty line
    " OR not following part of a word/filename
    " OR within a word/filename
    " OR using tabs, not spaces
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
endf

" ··········· git ······················ {{{1
"Git branch
func! GitBranch()
  let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
  if branch != ''
    return '(' . substitute(branch, '\n', '', 'g') . ')'
  endif
  return ''
endf

func! ReloadBuffers()
  set autoread
  silent! checktime
  set noautoread
  echo 'reloaded!'
endf

" ··········· rspec ···················· {{{1
func! RSpecLet(bang)
  delete
  normal! mz

  call MoveAssignment()
  call ReplaceWithLet(a:bang)

  normal! `z
endf

func! MoveAssignment()
  call search('\v^\s*<let>|<context>|<describe>', 'b')
  put
  normal! ==
endf

func! ReplaceWithLet(bang)
  execute 'substitute/\v^\s+\zs(\w+)%(\s*\=\s*)(.*\S)\s*$/let'.a:bang.'(:\1) { \2 }'
endf

" ··········· vmux ····················· {{{1
func! Vmux()
  VmuxPrimary
  let g:spec_runner_dispatcher = "call system(\"tmux send -t " . g:vmux_primary . " C-L '{command}' ENTER\")"
endf

func! Vtux()
  let g:spec_runner_dispatcher = "VtrSendCommand! {command}"
  echo 'g:spec_runner_dispatcher = "' . g:spec_runner_dispatcher . '"'
endf

func! Fifo()
  let g:spec_runner_dispatcher = "silent !echo clear > test_commands && echo {command} > test_commands"
  echo 'g:spec_runner_dispatcher = "' . g:spec_runner_dispatcher . '"'
endf

" ··········· keyboard ················· {{{1
func! Keyboard(type)
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
endf

" ··········· norman ··················· {{{2
func! NormanMaps()
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
endf
func! NormanUnmaps()
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
endf

" ··········· qwerty ··················· {{{2
func! QWERTYMaps()
endf
func! QWERTYUnmaps()
endf

" ··········· workman ·················· {{{2
func! WorkmanMaps()
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
endf
func! WorkmanUnmaps()
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
endf

" ··········· initialize ··············· {{{2
call QWERTYMaps()
" call WorkmanMaps()

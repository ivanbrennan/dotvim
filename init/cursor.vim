" ::::::::: Cursor ::::::::::::::::::::::::

" ··········· helpers ········· {{{1
highlight! CursorLineClear guibg=NONE guifg=NONE gui=NONE ctermbg=NONE ctermfg=NONE cterm=NONE

function! CursorLineToggle()
  call InitCursorVars()

  if w:cursorline_on
    highlight! link CursorLine CursorLineClear
    let w:cursorline_on = 0
  else
    highlight! link CursorLine CursorLine
    let w:cursorline_on = 1
  endif
endfunction

function! InitCursorVars()
  if !exists("w:cursorline_on")
    let w:cursorline_on = 0
  endif
endfunction

function! RestoreCrsr()
  if line("'\"") > 1 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endfunction
" ····························· }}}1

" Gui cursor
set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0

" cursor shape
if &term =~ 'xterm'
  let &t_SI="\<Esc>]50;CursorShape=1\x7"
  let &t_EI="\<Esc>]50;CursorShape=0\x7"
elseif &term =~ 'screen'
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" cursorline
set cursorline
let w:cursorline_on = 0

augroup CursorGroup
  autocmd!
  autocmd BufReadPost            * call RestoreCrsr()
  autocmd BufReadPost,BufNewFile * call InitCursorVars()
augroup END


" ::::::::: Cursor ::::::::::::::::::::::::

" ··········· helpers ········· {{{1
highlight! CursorLineClear guibg=NONE guifg=NONE gui=NONE ctermbg=NONE ctermfg=NONE cterm=NONE

fun! CursorLineToggle()
  if exists("w:cursorline_memo")
    highlight! link CursorLine CursorLine
    unlet w:cursorline_memo
  else
    highlight! link CursorLine CursorLineClear
    let w:cursorline_memo = 1
  end
endf

fun! RestoreCrsr()
  if line("'\"") > 1 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endf
" ····························· }}}1

" Gui cursor
set guicursor=n-v-c:block-blinkon0
set guicursor+=ve:ver35
set guicursor+=o:hor50
set guicursor+=i-ci:ver25
set guicursor+=r-cr:hor20
set guicursor+=sm:block-blinkon0

" Clear cursorline highlight
augroup CursorGroup
  autocmd!
  autocmd BufReadPost * call RestoreCrsr()
augroup END


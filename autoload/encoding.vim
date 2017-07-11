" Functions for working with multibyte strings.
" Adapted from https://github.com/LucHermitte/lh-vim-lib

func! encoding#eolp(line, col) abort
  return match(a:line, '\%'.a:col.'c$') >= 0
endf

func! encoding#previous_char(line, col) abort
  return matchstr(a:line, '.\%'.a:col.'c')
endf

func! encoding#pre_previous_char(line, col) abort
  return matchstr(a:line, '.\ze.\%'.a:col.'c')
endf

func! encoding#char(line, col) abort
  return matchstr(a:line, '\%'.a:col.'c.')
endf

func! encoding#first_nonblankp(line, col) abort
  return match(a:line, '^\s*\%'.a:col.'c\S') >= 0
endf

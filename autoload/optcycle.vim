" Override any of the defaults by defining g:optcycle_config
"  let g:optcycle_config = {
"  \   'colorscheme': [
"  \     { 'colorscheme': 'nord' },
"  \     { 'colorscheme': 'monokai' }
"  \   ]
"  \ }
let s:defaults = {
\   'colorscheme': [
\     { 'colorscheme': 'default' }
\   ],
\   'number': [
\     { 'number': 1, 'foldcolumn': 0 },
\     { 'number': 0, 'foldcolumn': 1 }
\   ],
\   'foldcolumn': [
\     { 'foldcolumn': 0, 'number': 1, 'relativenumber': 0 },
\     { 'foldcolumn': 4, 'number': 0, 'relativenumber': 0 }
\   ],
\   'foldmethod': [
\     { 'foldmethod': 'syntax', 'g:ruby_fold': 1 },
\     { 'foldmethod': 'indent' },
\     { 'foldmethod': 'marker' }
\   ],
\   'colorcolumn': [
\     { 'colorcolumn':       '', 'long_line':       '' },
\     { 'colorcolumn': 'tw 100', 'long_line':       '' },
\     { 'colorcolumn':       '', 'long_line': 'tw 100' }
\   ]
\ }

func! s:choices(opt)
  let conf = get(g:, 'optcycle_config', {})
  return get(conf, a:opt, s:defaults[a:opt])
endf

func! s:index(opt)
  let s:indices[a:opt] = get(s:indices, a:opt, 0)
  return s:indices[a:opt]
endf
let s:indices = {}

func! s:rotate_choices(opt)
  let choices = s:choices(a:opt)
  let i = (s:index(a:opt) + 1) % len(choices)
  let s:indices[a:opt] = i
  return choices[i]
endf

func! s:rotate(opt)
  let choice = s:rotate_choices(a:opt)
  for [option, value] in items(choice)
    exec 'let &l:'.option '=' value
  endfor
  exec 'set' a:opt.'?'
endf

" -- autoload functions

func! optcycle#colorscheme()
  let choice = s:rotate_choices('colorscheme')
  exec 'colorscheme' choice['colorscheme']
  redrawstatus | colorscheme
endf

func! optcycle#number()
  call s:rotate('number')
endf

func! optcycle#foldcolumn()
  call s:rotate('foldcolumn')
endf

func! optcycle#foldmethod()
  let choice = s:rotate_choices('foldmethod')
  let &l:foldmethod = choice['foldmethod']
  call s:update_ruby_fold(choice)
  set foldmethod?
endf

func! s:update_ruby_fold(choice)
  if &filetype == 'ruby'
    if has_key(a:choice, 'g:ruby_fold')
      let g:ruby_fold = a:choice['g:ruby_fold']
    elseif exists('g:ruby_fold')
      unlet g:ruby_fold
    endif
  endif
endf

func! optcycle#colorcolumn()
  if exists('w:long_line_highlight')
    call matchdelete(w:long_line_highlight)
    unlet w:long_line_highlight
  endif

  let choice = s:rotate_choices('colorcolumn')
  let &colorcolumn = s:colorcolumn_spec(choice['colorcolumn'])
  let long_line_spec = s:long_line_spec(choice['long_line'])
  if long_line_spec != ''
    let w:long_line_highlight = s:highlight_long_lines(long_line_spec)
  endif
endf

func! s:colorcolumn_spec(expr)
  let col = s:start_column(a:expr)
  return (col > 0) ? join(range(col+1, col+256),',') : ''
endf

func! s:long_line_spec(expr)
  let col = s:start_column(a:expr)
  return (col > 0) ? '\%>'.col.'v.' : ''
endf

func! s:start_column(expr)
  if &textwidth > 0 && match(a:expr, '\v<%(tw|textwidth)>') != -1
    return &textwidth
  else
    return str2nr(matchstr(a:expr, '\v[[:digit:]]+'))
  endif
endf

func! s:highlight_long_lines(spec)
  return matchadd('ColorColumn', a:spec, 128)
endf

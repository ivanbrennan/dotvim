" Depends on functions in encoding.vim

let s:plain_left  = "\<Left>"
let s:insert_left = "\<C-G>U\<Left>"

func! transposition#transpose(mode)
  if a:mode == 'c'
    return s:transpose( s:cursor(getcmdline(), getcmdpos()) )
  else
    return s:transpose( s:cursor(getline('.'), col('.')) )
  endif
endf

func! s:cursor(line, col)
  return {
        \  'line': a:line,
        \  'col': a:col,
        \  'current_char': function('s:current_char'),
        \  'previous_char': function('s:previous_char'),
        \  'pre_previous_char': function('s:pre_previous_char')
        \}
endf

func! s:current_char() dict
  return s:literal(encoding#char(self.line, self.col))
endf

func! s:previous_char() dict
  return s:literal(encoding#previous_char(self.line, self.col))
endf

func! s:pre_previous_char() dict
  return s:literal(encoding#pre_previous_char(self.line, self.col))
endf

func! s:transpose(cursor)
  if a:cursor.col == 1
    return ''
  elseif a:cursor.col > strlen(a:cursor.line)
    return s:transpose_preceding_chars(a:cursor)
  else
    return s:transpose_surrounding_chars(a:cursor)
  endif
endf

func! s:transpose_preceding_chars(cursor)
  let pre_previous_char = a:cursor.pre_previous_char()
  if pre_previous_char == ''
    return mode() == 'i' ? s:insert_left : s:plain_left
  endif
  return "\<BS>\<BS>" . a:cursor.previous_char() . pre_previous_char
endf

func! s:transpose_surrounding_chars(cursor)
  return "\<BS>\<Del>" . a:cursor.current_char() . a:cursor.previous_char()
endf

func! s:literal(char)
  return a:char == "\<Tab>" ? "\<C-V>\<Tab>" : a:char
endf

" Depends on functions in encoding.vim

let s:plain_left  = "\<Left>"
let s:insert_left = "\<C-G>U\<Left>"

func! transposition#new(mode)
  if a:mode == 'c'
    let l:cursor = s:cursor(getcmdline(), getcmdpos())
  else
    let l:cursor = s:cursor(getline('.'), col('.'))
  endif

  return {
        \  'cursor': l:cursor,
        \  'transpose': l:cursor.transposer(),
        \  'left': a:mode == 'i' ? s:insert_left : s:plain_left
        \}
endf

func! s:cursor(line, col)
  return {
        \  'line': a:line,
        \  'col': a:col,
        \  'eolp': function('s:eolp'),
        \  'transposer': function('s:transposer'),
        \  'current_char': function('s:current_char'),
        \  'previous_char': function('s:previous_char'),
        \  'pre_previous_char': function('s:pre_previous_char')
        \}
endf

func! s:transposer() dict
  if self.col == 1
    return {-> ''}
  elseif self.eolp()
    return function('s:transpose_preceding_chars')
  else
    return function('s:transpose_surrounding_chars')
  endif
endf

func! s:eolp() dict
  return encoding#eolp(self.line, self.col)
endf

func! s:current_char() dict
  return s:LiteralChar(encoding#char(self.line, self.col))
endf

func! s:previous_char() dict
  return s:LiteralChar(encoding#previous_char(self.line, self.col))
endf

func! s:pre_previous_char() dict
  return s:LiteralChar(encoding#pre_previous_char(self.line, self.col))
endf

func! s:transpose_preceding_chars() dict
  let pre_previous_char = self.cursor.pre_previous_char()
  if pre_previous_char == ''
    return self.left
  endif
  return "\<BS>\<BS>" . self.cursor.previous_char() . pre_previous_char
endf

func! s:transpose_surrounding_chars() dict
  return "\<BS>\<Del>" . self.cursor.current_char() . self.cursor.previous_char()
endf

func! s:LiteralChar(char)
  return a:char == "\<Tab>" ? "\<C-V>\<Tab>" : a:char
endf

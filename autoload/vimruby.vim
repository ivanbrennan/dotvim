func! vimruby#align_method_chain()
  if s:has_leading_dot_operator()
    call s:align_method_chain_up()
  endif
  if line('.') < line('$')
    call s:align_method_chain_down()
  endif
endf

func! s:has_leading_dot_operator()
  return match(getline('.'), '^\s*\zs\.\K') != -1
endf

func! s:align_method_chain_up()
  let [dot_line, dot_col] = s:chainstart()
  if dot_line
    call s:align_range(dot_line + 1, line('.'), dot_col)
  endif
endf

func! s:chainstart()
  let before_line = '\%<'. line('.') .'l'
  let dot = s:backsearch_chainstart(before_line, '')

  while dot[0] && s:is_comment(dot)
    let before_col = '\%<'. dot[1] .'c'
    let dot = s:backsearch_chainstart(before_line, before_col)
  endwhile

  return dot
endf

func! s:backsearch_chainstart(line_anchor, col_anchor)
  return searchpos(s:chainstart_regex(a:line_anchor, a:col_anchor), 'bWn') " backwards, no-wrap, no-move
endf

func! s:chainstart_regex(line, col)
  return '^\s*[^[:blank:].].*' . a:line . a:col . '\zs\.\ze\K'
endf

func! s:is_comment(pos)
  return synIDattr(synID(a:pos[0], a:pos[1], 1), 'name') == 'rubyComment'
endf

func! s:align_range(minline, maxline, col)
  if a:minline <= a:maxline
    execute a:minline.','.a:maxline 'left' a:col - 1
  endif
endf

func! s:align_method_chain_down()
  let [curline, dot_col] = s:chaindot()
  if dot_col
    let maxline = s:chain_maxline()
    call s:align_range(curline + 1, maxline, dot_col)
  endif
endf

func! s:chaindot()
  let curline = line('.')
  let linestr = getline(curline)
  let dot_idx = match(linestr, '.*\zs\.\ze\K.*$')

  while dot_idx != -1 && s:is_comment([curline, dot_idx + 1])
    let linestr = linestr[:(dot_idx - 1)]
    let dot_idx = match(linestr, '.*\zs\.\ze\K.*$')
  endwhile

  return [curline, dot_idx + 1]
endf

func! s:chain_maxline()
  let pattern = '\%>'.line('.').'l^\s*\([^[:blank:].]\+.*\)\?$'
  let line_beyond = search(pattern, 'nW')
  return line_beyond ? line_beyond - 1 : line('$')
endf

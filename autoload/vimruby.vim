func! vimruby#align_method_chain()
  let curline = line('.')

  if s:has_leading_dot_operator(curline)
    let [dot_line, dot_col] = s:chainhead(curline)
    if dot_line
      call s:align_range(dot_line + 1, curline, dot_col)
    endif
  endif
endf

func! s:has_leading_dot_operator(line)
  return match(getline(a:line), '^\s*\zs\.\K') != -1
endf

func! s:chainhead(line)
  let above_line = '\%<'. a:line .'l'
  let dot = s:backsearch_chainhead(above_line, '')

  while dot[0] && s:is_comment(dot)
    let before_col = '\%<'. dot[1] .'c'
    let dot = s:backsearch_chainhead(above_line, before_col)
  endwhile

  return dot
endf

func! s:backsearch_chainhead(line_anchor, col_anchor)
  return searchpos(s:chainhead_regex(a:line_anchor, a:col_anchor), 'bWn') " backwards, no-wrap, no-move
endf

func! s:chainhead_regex(line, col)
  return '^\s*[^[:blank:].].*' . a:line . a:col . '\zs\.\ze\K'
endf

func! s:is_comment(pos)
  return synIDattr(synID(a:pos[0], a:pos[1], 1), 'name') == 'rubyComment'
endf

func! s:align_range(minline, maxline, col)
  execute a:minline.','.a:maxline 'left' a:col - 1
endf

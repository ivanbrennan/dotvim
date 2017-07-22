func! rubyfuncs#align_chain()
  let l:line = line('.')

  if l:line > 1 && s:has_leading_dot_operator(l:line)
    let dot_col = s:dot_operator_col(l:line - 1)
    if dot_col | execute 'left' dot_col - 1 | endif
  endif
endf

func! s:has_leading_dot_operator(line)
  return match(getline(a:line), '^\s*\zs\.\K') != -1
endf

func! s:dot_operator_col(line)
  let regex   = s:dot_operator_regex(a:line)
  let dot_col = s:searchcol(regex, 'bn', a:line)

  while dot_col && s:is_comment(a:line, dot_col)
    let dot_col = s:searchcol(s:match_before_col(dot_col, regex), 'bn', a:line)
  endwhile

  return dot_col
endf

func! s:dot_operator_regex(line)
  return '\%'.a:line.'l\.\ze\K'
endf

func! s:match_before_col(col, regex)
  return '\%<'.a:col.'v' . a:regex
endf

func! s:searchcol(regex, flags, stopline)
  let [_, l:col] = searchpos(a:regex, a:flags, a:stopline)
  return l:col
endf

func! s:is_comment(line, col)
  return synIDattr(synID(a:line, a:col, 1), 'name') == 'rubyComment'
endf

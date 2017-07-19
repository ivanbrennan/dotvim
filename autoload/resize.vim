func! resize#horizontal(n)
  if a:n == 1
    execute 'resize' s:is_bottom_edge() ? '+1' : '-1'
  else
    execute 'resize' s:is_bottom_edge() ? '-1' : '+1'
  endif
endf

func! resize#vertical(n)
  if a:n == 1
    execute 'vertical resize' s:is_right_edge() ? '-1' : '+1'
  else
    execute 'vertical resize' s:is_right_edge() ? '+1' : '-1'
  end
endf

func! s:is_bottom_edge()
  return s:is_edge_for_direction('j')
endf

func! s:is_right_edge()
  return s:is_edge_for_direction('l')
endf

func! s:is_edge_for_direction(direction_key)
  let orig = winnr()
  silent! execute 'wincmd' a:direction_key
  let is_edge = winnr() == orig

  silent! execute orig 'wincmd w'
  return is_edge
endf

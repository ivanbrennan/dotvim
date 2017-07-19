func! resize#horizontal(n)
  execute printf('resize %+d', s:is_bottom_edge() ? -a:n : a:n)
endf

func! resize#vertical(n)
  execute printf('vertical resize %+d', s:is_right_edge() ? -a:n : a:n)
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

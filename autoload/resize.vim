func! resize#horizontal(n)
  execute printf('resize %+d', s:horizontal_should_invert() ? -a:n : a:n)
endf

func! resize#vertical(n)
  execute printf('vertical resize %+d', s:vertical_should_invert() ? -a:n : a:n)
endf

func! s:horizontal_should_invert()
  let orig_nr = winnr()

  silent! wincmd j
  let is_bottom_window = winnr() == orig_nr

  silent! 2 wincmd k
  let has_window_above = winnr() != orig_nr
  silent! execute orig_nr 'wincmd w'

  " Don't invert resize commands if there's no window above. Doing so
  " would cause counter-intuitive resizing of the command-line area.
  return is_bottom_window && has_window_above
endf

func! s:vertical_should_invert()
  let orig_nr = winnr()

  silent! wincmd l
  let is_rightmost_window = winnr() == orig_nr
  silent! execute orig_nr 'wincmd w'

  return is_rightmost_window
endf

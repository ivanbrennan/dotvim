func! resize#horizontal(n)
  execute printf('resize %+d', s:is_bottom_edge() ? -a:n : a:n)
endf

func! resize#vertical(n)
  execute printf('vertical resize %+d', s:is_right_edge() ? -a:n : a:n)
endf

func! s:is_bottom_edge()
  let orig_nr = winnr()

  silent! wincmd j
  let below_nr = winnr()

  " check whether it's also the top-edge
  silent! 2 wincmd k
  let above_nr = winnr()
  silent! execute orig_nr 'wincmd w'

  " don't invert resize operations if just one window tall,
  " otherwise resizing "down" will increase command-line height,
  " like dragging the statusline upwards.
  return orig_nr == below_nr && orig_nr != above_nr
endf

func! s:is_right_edge()
  let orig_nr = winnr()

  silent! wincmd l
  let right_nr = winnr()
  let is_edge = winnr() == orig_nr

  silent! execute orig_nr 'wincmd w'
  return right_nr == orig_nr
endf

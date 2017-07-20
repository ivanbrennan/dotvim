let w:resize_cache = {}

augroup ResizeGroup
  autocmd!
  autocmd WinEnter * let w:resize_cache = {}
augroup END

func! resize#horizontal(n)
  execute printf('resize %+d', a:n * s:fetch('s:horizontal_sign'))
endf

func! resize#vertical(n)
  execute printf('vertical resize %+d', a:n * s:fetch('s:vertical_sign'))
endf

func! s:horizontal_sign()
  return s:horizontal_should_invert() ? -1 : 1
endf

func! s:vertical_sign()
  return s:vertical_should_invert() ? -1 : 1
endf

func! s:horizontal_should_invert()
  let orig_nr = winnr()

  silent! wincmd j
  let is_bottom_window = winnr() == orig_nr
  silent! execute orig_nr 'wincmd w'

  silent! wincmd k
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

func! s:fetch(funcname)
  let cached_val = get(w:resize_cache, a:funcname)
  if cached_val
    return cached_val
  else
    let w:resize_cache[a:funcname] = call(a:funcname, [])
    return w:resize_cache[a:funcname]
  endif
endf

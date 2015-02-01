" ::::::::: Autosize ::::::::::::::::::::::

fun! SetWinMinHts(inactive_min)
  if a:inactive_min > 0
    let full_screen = &lines - 2
    let upper_bound = full_screen - a:inactive_min

    if upper_bound > a:inactive_min
      let &winheight    = min( [upper_bound, 25] )  " soft active min
      let &winminheight = a:inactive_min            " hard inactive min
    endif
  endif
endf

fun! ToggleWinMinHts(inactive_min)
  if &winminheight > 1
    set winminheight=1
    set winheight=1
    normal! =
  else
    call SetWinMinHts(a:inactive_min)
  endif
endf

set winwidth=80                 " soft active min
set winminwidth=25              " hard inactive min

let inactive_min=5
call SetWinMinHts(inactive_min)

noremap <silent> <Leader>9 :call ToggleWinMinHts(inactive_min)<CR>


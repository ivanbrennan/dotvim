if exists('w:quickfix_title')
  " Adjust quickfix statusline to show the command that was run and total line count:
  setlocal statusline=\                 " space
  setlocal statusline+=%3*              " italics
  setlocal statusline+=%{w:quickfix_title}
  setlocal statusline+=%*               " reset highlight group
  setlocal statusline+=\                " space
  setlocal statusline+=%=               " separator
  setlocal statusline+=%l               " line
  setlocal statusline+=%#StatusLineNC#  " dim
  setlocal statusline+=/                " literal '/'
  setlocal statusline+=%*               " reset highlight group
  setlocal statusline+=%L               " total lines
  setlocal statusline+=\                " space
endif

setlocal colorcolumn=""

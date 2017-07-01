if exists('w:quickfix_title')
  " Adjust quickfix statusline to show the command that was run and total line count:
  setl statusline=\                 " space
  setl statusline+=%3*              " italics
  setl statusline+=%{w:quickfix_title}
  setl statusline+=%*               " reset highlight group
  setl statusline+=\                " space
  setl statusline+=%=               " separator
  setl statusline+=%l               " line
  setl statusline+=%#StatusLineNC#  " dim
  setl statusline+=/                " literal '/'
  setl statusline+=%*               " reset highlight group
  setl statusline+=%L               " total lines
  setl statusline+=\                " space
endif

setl colorcolumn=""

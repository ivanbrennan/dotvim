" ::::::::: Colors ::::::::::::::::::::::::

if has('termguicolors')
  set termguicolors
endif

let g:nord_italic_comments = 1

if !exists('g:colors_name')
  if $THEME == 'light'
    colorscheme blight
  else
    try
      colorscheme nord
    catch /^Vim\%((\a\+)\)\=:E185/
      colorscheme ion
    endtry
  endif
endif

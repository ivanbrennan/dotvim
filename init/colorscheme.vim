" ::::::::: Colors ::::::::::::::::::::::::

if has('termguicolors')
  set termguicolors
endif

if !exists('g:colors_name')
  if $THEME == 'dark'
    colorscheme ion
  else
    colorscheme blight
  endif
endif


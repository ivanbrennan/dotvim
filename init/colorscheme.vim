" ::::::::: Colors ::::::::::::::::::::::::

if !exists('g:colors_name')
  if $THEME == 'light'
    colorscheme blight
  else
    colorscheme ion
  endif
endif


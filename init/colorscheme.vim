" ::::::::: Colors ::::::::::::::::::::::::

if !exists('g:colors_name')
  if $THEME == 'dark'
    colorscheme ion
  else
    colorscheme blight
  endif
endif


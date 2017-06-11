" ::::::::: Colors ::::::::::::::::::::::::

if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if !exists('g:colors_name')
  if $THEME == 'dark'
    colorscheme ion
  else
    colorscheme blight
  endif
endif


let g:airline#themes#today#palette = {}
let s:background = &background

function! airline#themes#today#refresh()
  let g:airline#themes#today#palette.accents = {
        \ 'red': airline#themes#get_highlight('Constant'),
        \ }

  if s:background == "dark"
    let s:N1 = airline#themes#get_highlight2(['Normal', 'fg'], ['NonText', 'fg'], 'bold')
  else
    let s:N1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Delimiter', 'fg'], 'bold')
  endif
  let s:N2 = airline#themes#get_highlight2(['Cursor', 'bg'], ['CursorLine', 'bg'])
  let s:N3 = airline#themes#get_highlight2(['Normal', 'fg'], ['TabLineFill', 'bg'])
  let g:airline#themes#today#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  let group = airline#themes#get_highlight2(['FoldColumn', 'fg'], ['TabLineFill', 'bg' ])
  let g:airline#themes#today#palette.normal_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  if s:background == "dark"
    let s:I1 = airline#themes#get_highlight2(['Normal', 'fg'], ['DiffChange', 'bg'])
  else
    let s:I1 = airline#themes#get_highlight2(['Normal', 'bg'], ['DiffChange', 'bg'])
  endif
  let s:I2 = airline#themes#get_highlight2(['Normal', 'fg'], ['TabLineFill', 'bg'])
  let s:I3 = airline#themes#get_highlight2(['Normal', 'fg'], ['CursorLine', 'bg'])
  let g:airline#themes#today#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#today#palette.insert_modified = g:airline#themes#today#palette.normal_modified

  if s:background == "dark"
    let s:R1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Constant', 'fg'])
  else
    let s:R1 = airline#themes#get_highlight2(['Visual', 'bg'], ['Normal', 'fg'])
  endif
  let s:R2 = s:I2
  let s:R3 = s:I3
  let g:airline#themes#today#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#today#palette.replace_modified = g:airline#themes#today#palette.normal_modified

  if s:background == "dark"
    let s:V1 = airline#themes#get_highlight2(['Normal', 'fg'], ['Visual', 'bg'], 'bold')
  else
    let s:V1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Constant', 'fg'], 'bold')
  endif
  let s:V2 = s:I2
  let s:V3 = s:I3
  let g:airline#themes#today#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#today#palette.visual_modified = g:airline#themes#today#palette.normal_modified

  let s:IA1 = airline#themes#get_highlight2(['Comment', 'fg'], ['VertSplit', 'bg'])
  let s:IA2 = airline#themes#get_highlight2(['Comment', 'fg'], ['CursorLine', 'bg'])
  let s:IA3 = airline#themes#get_highlight2(['Comment', 'fg'], ['VertSplit', 'bg'])
  let g:airline#themes#today#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

  let iagroup = airline#themes#get_highlight2(['Comment', 'fg'], ['VertSplit', 'bg'])
  let g:airline#themes#today#palette.inactive_modified = {
        \ 'airline_c': [ iagroup[0], '', iagroup[2], '', '' ]
        \ }
endfunction

call airline#themes#today#refresh()


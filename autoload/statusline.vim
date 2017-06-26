func! statusline#current() abort
  return exists('g:actual_curbuf') && bufnr('%') == g:actual_curbuf
endf

func! statusline#bufname() abort
  return statusline#current() ? bufname('%') : ''
endf
func! statusline#bufname_nc() abort
  return !statusline#current() ? bufname('%') : ''
endf

func! statusline#filetype() abort
  return statusline#current() ? &filetype : ''
endf
func! statusline#filetype_nc() abort
  return !statusline#current() ? &filetype : ''
endf

func! statusline#before_filetype() abort
  return strlen(&filetype) ? '[' : ''
endf
func! statusline#after_filetype() abort
  return strlen(&filetype) ? ']' : ''
endf

func! statusline#branch() abort
  let l:branch = fugitive#head()
  if empty(branch)
    return ''
  else
    return '(' . l:branch . ')'
  endif
endf

let s:highlight_modified = 0

func! statusline#check_modified() abort
  if &modified && !s:highlight_modified
    let s:highlight_modified = 1
    call statusline#update_highlight()
  elseif !&modified && s:highlight_modified
    let s:highlight_modified = 0
    call statusline#update_highlight()
  endif
endf

func! statusline#update_highlight() abort
  let l:bg = pinnacle#extract_bg('StatusLine')
  let l:fg = pinnacle#extract_fg('StatusLine')

  if &modified
    let l:name_style = 'bold,italic'
    let l:type_style = 'italic'
  else
    let l:name_style = 'bold'
    let l:type_style = 'NONE'
  endif

  " StatusLine + name_style
  execute 'highlight! User1 ' .
        \ pinnacle#highlight({
        \   'bg':   l:bg,
        \   'fg':   l:fg,
        \   'term': l:name_style,
        \   'gui':  l:name_style
        \ })

  " StatusLine + type_style
  execute 'highlight! User2 ' .
        \ pinnacle#highlight({
        \   'bg':   l:bg,
        \   'fg':   l:fg,
        \   'term': l:type_style,
        \   'gui':  l:type_style
        \ })
endf

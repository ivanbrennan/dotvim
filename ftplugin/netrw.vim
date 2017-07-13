nmap <buffer> u <Plug>VinegarUp

if !exists('s:qkeys')
  let s:qkeys = map(split(execute('nmap q'), '\n'), 'split(v:val, "\\W\\+")[1]')
endif

for qkey in s:qkeys
  execute 'nunmap <buffer>' qkey
endfor

nnoremap <silent> <buffer> q :call bufwin#quit_window()<CR>

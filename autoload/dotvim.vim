let s:vimrc = resolve($MYVIMRC)
let s:vimrc_dir = fnamemodify(s:vimrc, ':h')

func! dotvim#edit(...)
  execute 'edit' (a:0 ? dotvim#path(a:1) : s:vimrc)
endf

func! dotvim#path(subpath)
  return s:vimrc_dir . '/' . a:subpath
endf

func! dotvim#list(arglead, _cmdline, _cursorpos)
  return map(globpath(s:vimrc_dir, a:arglead.'*', 0, 1), s:relative_path)
endf

let s:relative_path = { _idx, val -> fnamemodify(val,':p')[(s:prefix_len):] }
let s:prefix_len = len(s:vimrc_dir) + 1

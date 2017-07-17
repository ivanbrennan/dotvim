let s:vimrc = resolve($MYVIMRC)
let s:vimrc_dir = fnamemodify(s:vimrc, ':h')

func! dotvim#edit(...)
  execute 'edit' (a:0 ? dotvim#path(a:1) : s:vimrc)
endf

func! dotvim#path(subpath)
  return s:vimrc_dir . '/' . a:subpath
endf

func! dotvim#list(ArgLead, CmdLine, CursorPos)
  return map(globpath(s:vimrc_dir, a:ArgLead.'*', 0, 1), s:subpath_map)
endf

let s:subpath_map = { k,v -> fnamemodify(v,':p')[(s:leading_len):] }
let s:leading_len = len(s:vimrc_dir) + 1

let s:vimrc = resolve($MYVIMRC)
let s:vimrc_dir = fnamemodify(s:vimrc, ':h')

let s:sub_paths = [
      \ 'after',
      \ 'autoload',
      \ 'backup',
      \ 'colors',
      \ 'compiler',
      \ 'ftdetect',
      \ 'ftplugin',
      \ 'indent',
      \ 'info',
      \ 'init',
      \ 'init.vim',
      \ 'plugged',
      \ 'plugshot',
      \ 'syntax',
      \ 'tmp',
      \ 'todo.org',
      \ 'undo',
      \ 'view',
      \ 'vimrc'
      \]

let s:find_paths = '{'.join(s:sub_paths, ',').'}'

func! dotvim#edit(...)
  execute 'edit' (a:0 ? dotvim#path(a:1) : s:vimrc)
endf

func! dotvim#list(ArgLead, CmdLine, CursorPos)
  let findcmd = "find " . s:find_paths .  " -regex '".a:ArgLead."[^/]*' -exec ls -pd {} +"
  return system("cd " . s:vimrc_dir . " && " . findcmd)
endf

func! dotvim#path(subpath)
  return s:vimrc_dir . '/' . a:subpath
endf

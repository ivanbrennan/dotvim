func! dotvim#edit(...)
  execute 'edit '. (a:0 > 0 ? dotvim#path(a:1) : resolve($MYVIMRC))
endf

func! dotvim#list(A,L,P)
  let l:dir = dotvim#path()
  let l:paths = '{after,autoload,colors,compiler,ftdetect,ftplugin,indent,init,syntax,vimrc}'
  return system("cd ".l:dir." && find ". l:paths ." -type f \\( -name '*.vim' -or -name 'vimrc' \\) -print")
endf

func! dotvim#path(...)
  let l:dir = fnamemodify(resolve($MYVIMRC), ':h')
  return (a:0 > 0) ? l:dir.'/'.a:1 : l:dir
endf

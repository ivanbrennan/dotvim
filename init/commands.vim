command! -bang Let call RSpecLet('<bang>')

command! DotVimReload source $MYVIMRC | filetype detect
command! -complete=customlist,dotvim#list -nargs=? DotVim call dotvim#edit(<f-args>)

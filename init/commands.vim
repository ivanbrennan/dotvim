command! -bang Let call RSpecLet('<bang>')

command! -complete=customlist,dotvim#list -nargs=? DotVim call dotvim#edit(<f-args>)

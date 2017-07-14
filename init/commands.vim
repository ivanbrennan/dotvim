command! -bang Let call RSpecLet('<bang>')

command! -complete=custom,dotvim#list -nargs=? DotVim call dotvim#edit(<f-args>)

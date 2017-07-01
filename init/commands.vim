command! -bang Let call RSpecLet('<bang>')

command! -complete=custom,ListDotVimFiles -nargs=? EditDotVim call EditDotVim(<f-args>)

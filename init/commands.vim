command! -bang Let call RSpecLet('<bang>')

command! DotVimReload source $MYVIMRC | filetype detect
command! -complete=customlist,dotvim#list -nargs=? DotVim call dotvim#edit(<f-args>)

command ResizeDown  call resize#horizontal(1)
command ResizeUp    call resize#horizontal(-1)
command ResizeRight call resize#vertical(1)
command ResizeLeft  call resize#vertical(-1)

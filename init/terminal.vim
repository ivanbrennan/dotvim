" ::::::::: Terminal ::::::::::::::::::::::

fun! EnableKey(key, fnkey, code)
  execute 'set  '. a:fnkey .'='. a:code
  execute 'map  '. a:fnkey .' '. a:key
  execute 'map! '. a:fnkey .' '. a:key
endf

fun! EnableKeyCombos()
  let combos = [
        \['<C-CR>',      '<F13>', '[25~' ],
        \['<S-CR>',      '<F14>', '[27~' ],
        \['<C-Space>',   '<F15>', '[29~' ],
        \['<S-Space>',   '<F16>', '[30~' ],
        \['<C-BS>',      '<F17>', '[1;5P'],
        \['<M-Tab>',     '<F18>', '[1;5Q'],
        \['<M-S-Tab>',   '<F19>', '[1;5R'],
        \['<C-Up>',      '<F20>', '[1;5A'],
        \['<C-Down>',    '<F21>', '[1;5B'],
        \['<C-Right>',   '<F22>', '[1;5C'],
        \['<C-Left>',    '<F23>', '[1;5D'],
        \['<C-Tab>',     '<F24>', '[31~' ],
        \['<C-S-Tab>',   '<F25>', '[32~' ],
        \['<C-,>',       '<F26>', '[33~' ],
        \['<C-.>',       '<F27>', '[34~' ],
        \['<C-S-Space>', '<F28>', '[35~' ],
        \['<C-->',       '<F29>', '[36~' ],
        \['<C-S-CR>',    '<F30>', '[37~' ],
        \['<C-S-Up>',    '<F31>', '[1;6A'],
        \['<C-S-Down>',  '<F32>', '[1;6B'],
        \['<C-S-Right>', '<F33>', '[1;6C'],
        \['<C-S-Left>',  '<F34>', '[1;6D']
        \]

  for [key, fnkey, code] in combos
    call EnableKey( key, fnkey, code )
  endfor
endf

if &term =~ 'xterm\|screen\|builtin_gui'
  call EnableKeyCombos()
endif


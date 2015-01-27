" ::::::::: Terminal ::::::::::::::::::::::
"
" ··········· key codes ······· {{{1
if &term =~ 'xterm\|screen\|builtin_gui'
  fun! EnableKey(key, fnkey, code)
    execute 'set  '. a:fnkey .'='. a:code
    execute 'map  '. a:fnkey .' '. a:key
    execute 'map! '. a:fnkey .' '. a:key
  endf

  call EnableKey( '<C-CR>',      '<F13>', '[25~'  )
  call EnableKey( '<S-CR>',      '<F14>', '[27~'  )
  call EnableKey( '<C-Space>',   '<F15>', '[29~'  )
  call EnableKey( '<S-Space>',   '<F16>', '[30~'  )
  call EnableKey( '<C-BS>',      '<F17>', '[1;5P' )
  call EnableKey( '<M-Tab>',     '<F18>', '[1;5Q' )
  call EnableKey( '<M-S-Tab>',   '<F19>', '[1;5R' )
  call EnableKey( '<C-Up>',      '<F20>', '[1;5A' )
  call EnableKey( '<C-Down>',    '<F21>', '[1;5B' )
  call EnableKey( '<C-Right>',   '<F22>', '[1;5C' )
  call EnableKey( '<C-Left>',    '<F23>', '[1;5D' )
  call EnableKey( '<C-Tab>',     '<F24>', '[31~'  )
  call EnableKey( '<C-S-Tab>',   '<F25>', '[32~'  )
  call EnableKey( '<C-,>',       '<F26>', '[33~'  )
  call EnableKey( '<C-.>',       '<F27>', '[34~'  )
  call EnableKey( '<C-S-Space>', '<F28>', '[35~'  )
  call EnableKey( '<C-->',       '<F29>', '[36~'  )
  call EnableKey( '<C-S-CR>',    '<F30>', '[37~'  )
  call EnableKey( '<C-S-Up>',    '<F31>', '[1;6A' )
  call EnableKey( '<C-S-Down>',  '<F32>', '[1;6B' )
  call EnableKey( '<C-S-Right>', '<F33>', '[1;6C' )
  call EnableKey( '<C-S-Left>',  '<F34>', '[1;6D' )
endif


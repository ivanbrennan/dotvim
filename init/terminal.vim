" ::::::::: Terminal ::::::::::::::::::::::

fun! SetKeyCode(key, code, fnkey)
  execute 'set  '. a:fnkey .'='. a:code
  execute 'map  '. a:fnkey .' '. a:key
  execute 'map! '. a:fnkey .' '. a:key
endf

if &term =~ 'xterm\|screen\|builtin_gui'
  " ··········· keycodes ········ {{{1
  let s:keycodes = [
        \  [ '<S-Up>'      , '[1;2A' , '<F13>' ],
        \  [ '<C-Up>'      , '[1;5A' , '<F14>' ],
        \  [ '<C-S-Up>'    , '[1;6A' , '<F15>' ],
        \  [ '<S-Down>'    , '[1;2B' , '<F16>' ],
        \  [ '<C-Down>'    , '[1;5B' , '<F17>' ],
        \  [ '<C-S-Down>'  , '[1;6B' , '<F18>' ],
        \  [ '<S-Right>'   , '[1;2C' , '<F19>' ],
        \  [ '<C-Right>'   , '[1;5C' , '<F20>' ],
        \  [ '<C-S-Right>' , '[1;6C' , '<F21>' ],
        \  [ '<S-Left>'    , '[1;2D' , '<F22>' ],
        \  [ '<C-Left>'    , '[1;5D' , '<F23>' ],
        \  [ '<C-S-Left>'  , '[1;6D' , '<F24>' ],
        \  [ '<S-Space>'   , '[30~'  , '<F25>' ],
        \  [ '<C-Space>'   , '[29~'  , '<F26>' ],
        \  [ '<C-S-Space>' , '[35~'  , '<F27>' ],
        \  [ '<S-CR>'      , '[27~'  , '<F28>' ],
        \  [ '<C-CR>'      , '[25~'  , '<F29>' ],
        \  [ '<C-,>'       , '[33~'  , '<F30>' ],
        \  [ '<C-.>'       , '[34~'  , '<F31>' ],
        \  [ '<M-Tab>'     , '[1;5Q' , '<F32>' ],
        \  [ '<M-S-Tab>'   , '[1;5R' , '<F33>' ],
        \]
  " ····························· }}}1
  for [key, code, fnkey] in s:keycodes
    call SetKeyCode( key, code, fnkey )
  endfor

  unlet s:keycodes
endif

" extended mouse mode
if &term =~ '^screen'
  set ttymouse=xterm2
endif


" ::::::::: Terminal ::::::::::::::::::::::

fun! SetKeyCode(key, code, fnkey)
  execute 'set  '. a:fnkey .'='. a:code
  execute 'map  '. a:fnkey .' '. a:key
  execute 'map! '. a:fnkey .' '. a:key
endf

if &term =~ 'xterm\|screen\|builtin_gui'
  " ··········· keycodes ········ {{{1
  let s:keycodes = [
        \  [ '<C-CR>'      , '[25~'  , '<F13>' ],
        \  [ '<S-CR>'      , '[27~'  , '<F14>' ],
        \  [ '<C-Space>'   , '[29~'  , '<F15>' ],
        \  [ '<S-Space>'   , '[30~'  , '<F16>' ],
        \  [ '<C-BS>'      , '[1;5P' , '<F17>' ],
        \  [ '<M-Tab>'     , '[1;5Q' , '<F18>' ],
        \  [ '<M-S-Tab>'   , '[1;5R' , '<F19>' ],
        \  [ '<C-Up>'      , '[1;5A' , '<F20>' ],
        \  [ '<C-Down>'    , '[1;5B' , '<F21>' ],
        \  [ '<C-Right>'   , '[1;5C' , '<F22>' ],
        \  [ '<C-Left>'    , '[1;5D' , '<F23>' ],
        \  [ '<C-Tab>'     , '[31~'  , '<F24>' ],
        \  [ '<C-S-Tab>'   , '[32~'  , '<F25>' ],
        \  [ '<C-,>'       , '[33~'  , '<F26>' ],
        \  [ '<C-.>'       , '[34~'  , '<F27>' ],
        \  [ '<C-S-Space>' , '[35~'  , '<F28>' ],
        \  [ '<C-->'       , '[36~'  , '<F29>' ],
        \  [ '<C-S-CR>'    , '[37~'  , '<F30>' ],
        \  [ '<C-S-Up>'    , '[1;6A' , '<F31>' ],
        \  [ '<C-S-Down>'  , '[1;6B' , '<F32>' ],
        \  [ '<C-S-Right>' , '[1;6C' , '<F33>' ],
        \  [ '<C-S-Left>'  , '[1;6D' , '<F34>' ],
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


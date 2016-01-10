" ::::::::: Terminal ::::::::::::::::::::::

if has('nvim')
  " these hacks don't work in neovim, nor are they necessary if terminal is configured according to
  " the specification used by libtermkey/libtickit
  finish
endif

fun! SetKeyCode(key, code, fnkey)
  execute 'set  '. a:fnkey .'='. a:code
  execute 'map  '. a:fnkey .' '. a:key
  execute 'map! '. a:fnkey .' '. a:key
endf

if &term =~ 'xterm\|screen\|builtin_gui'
  " ··········· keycodes ········ {{{1
  " Codes conform to libtermkey (now in libtickit) specification.
  " Most modified keys are encoded as: CSI[codepoint];[modifier]u
  " See: http://www.leonerd.org.uk/hacks/fixterms for full spec.
  let s:keycodes = [
        \  [ '<S-Space>'   , '[32;2u' , '<F25>' ],
        \  [ '<C-S-Space>' , '[32;6u' , '<F27>' ],
        \  [ '<S-CR>'      , '[13;2u' , '<F28>' ],
        \  [ '<C-CR>'      , '[13;5u' , '<F29>' ],
        \  [ '<C-,>'       , '[44;5u' , '<F30>' ],
        \  [ '<C-.>'       , '[46;5u' , '<F31>' ],
        \  [ '<M-Tab>'     , '[9;3u'  , '<F32>' ],
        \  [ '<M-S-Tab>'   , '[1;3Z'  , '<F33>' ],
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


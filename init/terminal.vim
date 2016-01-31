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
        \  [ '<S-Space>'   , '[32;2u' , '<F13>' ],
        \  [ '<C-S-Space>' , '[32;6u' , '<F14>' ],
        \  [ '<S-CR>'      , '[13;2u' , '<F15>' ],
        \  [ '<C-CR>'      , '[13;5u' , '<F16>' ],
        \  [ '<C-,>'       , '[44;5u' , '<F17>' ],
        \  [ '<C-.>'       , '[46;5u' , '<F18>' ],
        \  [ '<M-Tab>'     , '[9;3u'  , '<F19>' ],
        \  [ '<M-S-Tab>'   , '[1;3Z'  , '<F20>' ],
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

  " Fix behavior of modified arrows in tmux.
  " TODO: Check whether this is necessary in neovim.
  set    <xUp>=[1;*A
  set  <xDown>=[1;*B
  set <xRight>=[1;*C
  set  <xLeft>=[1;*D
endif


" ::::::::: Terminal ::::::::::::::::::::::

if has('nvim')
  " these hacks don't work in neovim, nor are they necessary if terminal is configured according to
  " the specification used by libtermkey/libtickit
  finish
endif

func! SetKeyCode(key, escSeq, fnkey)
  execute 'set  '. a:fnkey .'='. a:escSeq
  execute 'map  '. a:fnkey .' '. a:key
  execute 'map! '. a:fnkey .' '. a:key
endf

if &term =~ 'xterm\|tmux\|screen\|builtin_gui'
  " ··········· keycodes ········ {{{1
  " Codes conform to libtermkey (now in libtickit) specification.
  " Most modified keys are encoded as: CSI[codepoint];[modifier]u
  " See: http://www.leonerd.org.uk/hacks/fixterms for full spec.
  let s:keycodes = [
        \  [ '<S-Space>'   , "\<Esc>[32;2u" , '<F13>' ],
        \  [ '<C-S-Space>' , "\<Esc>[32;6u" , '<F14>' ],
        \  [ '<S-CR>'      , "\<Esc>[13;2u" , '<F15>' ],
        \  [ '<C-CR>'      , "\<Esc>[13;5u" , '<F16>' ],
        \  [ '<C-,>'       , "\<Esc>[44;5u" , '<F17>' ],
        \  [ '<C-.>'       , "\<Esc>[46;5u" , '<F18>' ],
        \  [ '<M-Tab>'     , "\<Esc>[9;3u"  , '<F19>' ],
        \  [ '<M-S-Tab>'   , "\<Esc>[1;3Z"  , '<F20>' ],
        \  [ '<M-j>'       , "\<Esc>j"      , '<F21>' ],
        \  [ '<M-k>'       , "\<Esc>k"      , '<F22>' ],
        \  [ '<M-l>'       , "\<Esc>l"      , '<F23>' ],
        \  [ '<M-h>'       , "\<Esc>h"      , '<F24>' ],
        \  [ '<M-J>'       , "\<Esc>J"      , '<F25>' ],
        \  [ '<M-K>'       , "\<Esc>K"      , '<F26>' ],
        \  [ '<M-L>'       , "\<Esc>L"      , '<F27>' ],
        \  [ '<M-H>'       , "\<Esc>H"      , '<F28>' ],
        \  [ '<M-.>'       , "\<Esc>."      , '<F29>' ],
        \  [ '<M-CR>'      , "\<Esc>[13;3u" , '<F30>' ]
        \]
  " ····························· }}}1
  for [key, escSeq, fnkey] in s:keycodes
    call SetKeyCode( key, escSeq, fnkey )
  endfor

  unlet s:keycodes
endif

" extended mouse mode
if &term =~ '^\%(tmux\|screen\)'
  set ttymouse=xterm2

  " Fix behavior of modified arrows in tmux.
  set    <xUp>=[1;*A
  set  <xDown>=[1;*B
  set <xRight>=[1;*C
  set  <xLeft>=[1;*D

  " Fix true color in tmux
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
endif


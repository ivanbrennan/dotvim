" This file is sourced at the start of the system vimrc, allowing
" per-user configuration to be layered atop a configuration shared
" system-wide.
" See also:
"   /etc/nixos/environment/vim/vimrc (system-wide configuration)
"   ~/.vim/vimrc-after.vim (corresponding after-hook)

if exists('g:loaded_vimrc_before_hook') || &cp
  finish
endif
let g:loaded_vimrc_before_hook = 1

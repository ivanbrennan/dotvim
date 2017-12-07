" This file is sourced at the end of the system vimrc, allowing
" per-user configuration to be layered atop a configuration shared
" system-wide.
" See also:
"   ~/.vim/vimrc-before.vim (corresponding before-hook)
"   /etc/nixos/environment/vim/vimrc (system-wide configuration)

if exists('g:loaded_vimrc_after_hook') || &cp
  finish
endif
let g:loaded_vimrc_after_hook = 1

runtime! init/*.vim

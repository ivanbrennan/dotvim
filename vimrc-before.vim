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

set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gabebw/vim-spec-runner',         { 'on': ['<Plug>RunFocusedSpec', '<Plug>RunCurrentSpecFile'] }
Plug 'ivanbrennan/listical',           { 'on': ['<Plug>(listical_quickfix)', '<Plug>(listical_loclist)'], 'for': 'qf' }
Plug 'ivanbrennan/vmux'
Plug 'jelera/vim-javascript-syntax',   { 'for': 'javascript' }
Plug 'junegunn/vim-easy-align',        { 'on': ['<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)'] }
Plug 'mhinz/vim-grepper'
Plug 'regedarek/ZoomWin'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary',           { 'on': ['<Plug>Commentary', '<Plug>CommentaryLine'] }
Plug 'tpope/vim-eunuch',               { 'on': ['Chmod', 'Delete', 'Find', 'Locate', 'Mkdir', 'Move', 'Remove', 'Rename', 'SudoEdit', 'SudoWrite', 'Unlink', 'Wall'] }
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv',                { 'on': 'Rbenv' }
Plug 'vim-ruby/vim-ruby',              { 'for': 'ruby' }
Plug 'vim-scripts/Super-Shell-Indent', { 'for': 'sh' }
Plug 'wellle/targets.vim'
Plug 'wannesm/wmgraphviz.vim',         { 'for': 'dot' }
Plug 'wlangstroth/vim-racket'

call plug#end()

syntax enable

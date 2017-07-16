" ::::::::: vimrc :::::::::::::::::::::::::

set nocompatible

" ::::::::: vim-plug ::::::::::::::::::::::

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" ··········· plugins ········· {{{1
Plug 'AndrewRadev/splitjoin.vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'daddye/soda.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'FooSoft/vim-argwrap'
Plug 'gabebw/vim-spec-runner',         { 'on': ['<Plug>RunFocusedSpec', '<Plug>RunCurrentSpecFile'] }
Plug 'guns/xterm-color-table.vim'
Plug 'ivanbrennan/listical',           { 'on': ['<Plug>(listical_quickfix)', '<Plug>(listical_loclist)'], 'for': 'qf' }
Plug 'ivanbrennan/vmux'
Plug 'ivanbrennan/articulate'
Plug 'jelera/vim-javascript-syntax',   { 'for': 'javascript' }
Plug 'justinmk/vim-dirvish'
Plug 'jwhitley/vim-matchit'
Plug 'kchmck/vim-coffee-script',       { 'for': 'coffee' }
Plug 'mhinz/vim-grepper'
Plug 'nelstrom/vim-visual-star-search'
Plug 'ngmy/vim-rubocop'
Plug 'regedarek/ZoomWin'
Plug 'sjl/gundo.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary',           { 'on': ['<Plug>Commentary', '<Plug>CommentaryLine'] }
Plug 'tpope/vim-dispatch',             { 'on': 'Dispatch' }
Plug 'tpope/vim-eunuch',               { 'on': ['Chmod', 'Delete', 'Find', 'Locate', 'Mkdir', 'Move', 'Remove', 'Rename', 'SudoEdit', 'SudoWrite', 'Unlink', 'Wall'] }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv',                { 'on': 'Rbenv' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby',              { 'for': 'ruby' }
Plug 'vim-scripts/dbext.vim'
Plug 'vim-scripts/hexHighlight.vim',   { 'on': 'HexHighlight' }
Plug 'vim-scripts/Super-Shell-Indent', { 'for': 'sh' }
Plug 'wellle/targets.vim'
Plug 'wincent/pinnacle'
Plug 'ivanbrennan/loupe',              { 'branch': 'transient-hlmatch' }
Plug 'wlangstroth/vim-racket'
" ····························· }}}1

call plug#end()

" ::::::::: Initialization ::::::::::::::::

syntax enable

runtime! init/**.vim

silent! source ~/.vimrc.local


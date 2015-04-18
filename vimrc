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
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-runner',    { 'on': ['<Plug>RunFocusedSpec', '<Plug>RunCurrentSpecFile'] }
Plug 'eiginn/netrw'
Plug 'gabebw/vim-spec-runner',         { 'on': ['<Plug>RunFocusedSpec', '<Plug>RunCurrentSpecFile'] }
Plug 'guns/xterm-color-table.vim'
Plug 'ivanbrennan/listical',           { 'on': ['<Plug>QfxListical', '<Plug>LocListical'] }
Plug 'jwhitley/vim-matchit'
Plug 'kchmck/vim-coffee-script',       { 'for': 'coffee' }
Plug 'kien/ctrlp.vim'
Plug 'nelstrom/vim-qargs',             { 'on': 'Qargs' }
Plug 'nelstrom/vim-visual-star-search'
Plug 'regedarek/ZoomWin'
Plug 'rking/ag.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary',           { 'on': ['<Plug>Commentary', '<Plug>CommentaryLine'] }
Plug 'tpope/vim-dispatch',             { 'on': 'Dispatch' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv',                { 'on': 'Rbenv' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby',              { 'for': 'ruby' }
Plug 'vim-scripts/hexHighlight.vim',   { 'on': 'HexHighlight' }
" ····························· }}}1

call plug#end()

" ::::::::: Initialization ::::::::::::::::

runtime! init/**.vim

silent! source ~/.vimrc.local


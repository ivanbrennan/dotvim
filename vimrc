" ::::::::: vimrc :::::::::::::::::::::::::

set nocompatible

" ::::::::: vim-plug ::::::::::::::::::::::

call plug#begin('~/.vim/plugged')

" ··········· plugins ········· {{{1
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-runner'
Plug 'eiginn/netrw'
Plug 'gabebw/vim-spec-runner'
Plug 'guns/xterm-color-table.vim'
Plug 'ivanbrennan/listical'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'nelstrom/vim-qargs'
Plug 'nelstrom/vim-visual-star-search'
Plug 'regedarek/ZoomWin'
Plug 'rking/ag.vim'
Plug 'shawncplus/Vim-toCterm'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/hexHighlight.vim'
Plug 'jwhitley/vim-matchit'
Plug 'sjl/gundo.vim'
" ····························· }}}1

call plug#end()

" ::::::::: Initialization ::::::::::::::::

runtime! init/**.vim

silent! source ~/.vimrc.local


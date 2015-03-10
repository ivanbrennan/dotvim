" ::::::::: vimrc :::::::::::::::::::::::::

set nocompatible

" ::::::::: Vundle ::::::::::::::::::::::::

filetype off

set  runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ··········· plugins ········· {{{1
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'eiginn/netrw'
Plugin 'gabebw/vim-spec-runner'
Plugin 'guns/xterm-color-table.vim'
Plugin 'ivanbrennan/listical'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'nelstrom/vim-qargs'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'regedarek/ZoomWin'
Plugin 'rking/ag.vim'
Plugin 'shawncplus/Vim-toCterm'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/hexHighlight.vim'
Plugin 'jwhitley/vim-matchit'
Plugin 'sjl/gundo.vim'
" ····························· }}}1

call vundle#end()
filetype plugin indent on

" ::::::::: Initialization ::::::::::::::::

runtime! init/**.vim

silent! source ~/.vimrc.local


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
Plug 'itchyny/vim-haskell-indent',     { 'for': 'haskell' }
Plug 'ivanbrennan/iota'
Plug 'ivanbrennan/mline'
Plug 'ivanbrennan/listical',           { 'on': ['<Plug>(listical_quickfix)', '<Plug>(listical_loclist)'], 'for': 'qf' }
Plug 'ivanbrennan/optcycle',           { 'on': ['<Plug>(optcycle_colorscheme)', '<Plug>(optcycle_number)', '<Plug>(optcycle_foldcolumn)', '<Plug>(optcycle_foldmethod)', '<Plug>(optcycle_colorcolumn)'] }
Plug 'ivanbrennan/articulate'
Plug 'ivanbrennan/caliper',            { 'on': ['CaliperUp', 'CaliperDown', 'CaliperLeft', 'CaliperRight'] }
Plug 'ivanbrennan/vmux'
Plug 'ivanbrennan/realign',            { 'on': ['<Plug>(realign_method_chain)', '<Plug>(realign_electric_dot)', '<Plug>(realign_toggle_electric_dot)'], 'for': 'ruby' }
Plug 'jelera/vim-javascript-syntax',   { 'for': 'javascript' }
Plug 'junegunn/vim-easy-align',        { 'on': ['<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)'] }
Plug 'justinmk/vim-dirvish'
Plug 'jwhitley/vim-matchit'
Plug 'kana/vim-submode'
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
Plug 'ivanbrennan/loupe',              { 'branch': 'toggle-magic-string' }
Plug 'wannesm/wmgraphviz.vim',         { 'for': 'dot' }
Plug 'wlangstroth/vim-racket'

if has('nvim')
  Plug 'neovimhaskell/haskell-vim',    { 'for': 'haskell' }
endif
" ····························· }}}1

call plug#end()

" ::::::::: Initialization ::::::::::::::::

syntax enable

runtime! init/*.vim

silent! source ~/.vimrc.local


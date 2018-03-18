" This file is sourced early in the initialization process.
"
" I've extracted most customizations to into plugins organized using Vim 8's
" package feature. The only settings that need to remain in vimrc are those
" that must be set before loding other runtime files, plugins, or packages.

if exists('g:loaded_vimrc') | finish | endif
let g:loaded_vimrc = 1

" disable netrw (I'm using dirvish instead)
let g:loaded_netrwPlugin = 1

" don't let ZoomWin clobber <C-W>o
nmap <C-W>.    <Plug>ZoomWin
nmap <leader>. <Plug>ZoomWin

runtime! init/*.vim
silent! source ~/.vim/vimrc.local

" Code from:
" https://github.com/ConradIrwin/vim-bracketed-paste
" http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
" then https://coderwall.com/p/if9mda
" and then https://github.com/aaronjensen/vimfiles/blob/59a7019b1f2d08c70c28a41ef4e2612470ea0549/plugin/terminaltweaks.vim
" to fix the escape time problem with insert mode.
"
" Docs on bracketed paste mode:
" http://www.xfree86.org/current/ctlseqs.html
" Docs on mapping fast escape codes in vim
" http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim

" See: https://github.com/ConradIrwin/vim-bracketed-paste/pull/25
if 0 " sounds like the tmux code is no longer necessary?
  if !exists("g:bracketed_paste_tmux_wrap")
    let g:bracketed_paste_tmux_wrap = 1
  endif

  function! WrapForTmux(s)
    if !g:bracketed_paste_tmux_wrap || !exists('$TMUX') || system('tmux -V')[5] >= '2'
      return a:s
    endif

    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
  endfunction

  let &t_ti .= WrapForTmux("\<Esc>[?2004h")
  let &t_te .= WrapForTmux("\<Esc>[?2004l")
else
  let &t_ti .= "\<Esc>[?2004h"
  let &t_te .= "\<Esc>[?2004l"
endif

execute "set <F29>=\<Esc>[200~"
execute "set <F30>=\<Esc>[201~"

map  <expr> <F29> XTermPasteBegin("i")
imap <expr> <F29> XTermPasteBegin("")
vmap <expr> <F29> XTermPasteBegin("c")
cmap        <F29> <Nop>
cmap        <F30> <Nop>

function! XTermPasteBegin(ret)
  set pastetoggle=<F30>
  set paste
  return a:ret
endfunction

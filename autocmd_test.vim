function! s:inform(name) abort
  echomsg printf(
        \ "%s\t%s\t%%: %s [%d], <afile>: %s [%d]",
        \ reltimestr(reltime()),
        \ a:name,
        \ bufname('%'), bufnr('%'),
        \ bufname(expand('<afile>')), bufnr(expand('<afile>')),
        \)
endfunction

function! AutocmdLogEnable(names) abort
  augroup autocmd_order_test
    autocmd! *
    for name in a:names
      execute printf('autocmd %s * call s:inform(''%s'')', name, name)
    endfor
  augroup END
endfunction

function! s:disable() abort
  augroup autocmd_order_test
    autocmd! *
  augroup END
endfunction

command! AutocmdOrderTestDisable call s:disable()
command! AutocmdOrderTestEnable call AutocmdLogEnable([
      \ 'BufAdd',
      \ 'BufEnter',
      \ 'BufLeave',
      \ 'BufNew',
      \ 'BufRead',
      \ 'BufReadPre',
      \ 'BufWinEnter',
      \ 'BufWinLeave',
      \ 'CmdlineEnter',
      \ 'CmdlineLeave',
      \ 'CursorMoved',
      \ 'InsertEnter',
      \ 'WinEnter',
      \ 'WinLeave',
      \])

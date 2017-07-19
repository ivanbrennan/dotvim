let g:submode_keep_leaving_key = 1

" ·· navigate wrapped lines ··· {{{1
call submode#enter_with('wrapido', 'n', '', 'gj', 'gj')
call submode#enter_with('wrapido', 'n', '', 'gk', 'gk')

call submode#map('wrapido', 'n', '', 'j', 'gj')
call submode#map('wrapido', 'n', '', 'k', 'gk')

call submode#map('wrapido', 'n', '', 'h', 'h')
call submode#map('wrapido', 'n', '', 'l', 'l')

" ·· navigate panes ··········· {{{1
for key in ['<C-J>', '<C-K>', '<C-H>', '<C-L>']
  call submode#enter_with('panes', 'n', '', '<C-W>'.key, '<C-W>'.key)
  call submode#map('panes', 'n', '', key, '<C-W>'.key)
endfor

" ·· resize panes ············· {{{1
if has('nvim') " TODO: get this working in normal Vim (ctrl-arrows acting weird)
  func! IsEdgeWin(direction_key)
    let orig = winnr()
    silent! execute 'wincmd' a:direction_key
    let is_edge = winnr() == orig
    silent! execute orig 'wincmd w'
    return is_edge
  endf

  func! ResizeWin(direction)
    if a:direction == 'up'
      execute 'resize' IsEdgeWin('j') ? '+1' : '-1'
    elseif a:direction == 'down'
      execute 'resize' IsEdgeWin('j') ? '-1' : '+1'
    elseif a:direction == 'left'
      execute 'vertical resize' IsEdgeWin('l') ? '+1' : '-1'
    else
      execute 'vertical resize' IsEdgeWin('l') ? '-1' : '+1'
    end
  endf

  call submode#enter_with('resize', 'n', '', '<C-W><C-Up>',    ':call ResizeWin("up")<CR>')
  call submode#enter_with('resize', 'n', '', '<C-W><C-Down>',  ':call ResizeWin("down")<CR>')
  call submode#enter_with('resize', 'n', '', '<C-W><C-Left>',  ':call ResizeWin("left")<CR>')
  call submode#enter_with('resize', 'n', '', '<C-W><C-Right>', ':call ResizeWin("right")<CR>')

  call submode#map('resize', 'n', '', '<C-Up>',    ':call ResizeWin("up")<CR>')
  call submode#map('resize', 'n', '', '<C-Down>',  ':call ResizeWin("down")<CR>')
  call submode#map('resize', 'n', '', '<C-Left>',  ':call ResizeWin("left")<CR>')
  call submode#map('resize', 'n', '', '<C-Right>', ':call ResizeWin("right")<CR>')
else
  call submode#enter_with('resize', 'n', '', '<C-W>+', '<C-W>+')
  call submode#enter_with('resize', 'n', '', '<C-W>-', '<C-W>-')
  call submode#enter_with('resize', 'n', '', '<C-W>>', '<C-W>>')
  call submode#enter_with('resize', 'n', '', '<C-W><', '<C-W><')

  call submode#map('resize', 'n', '', '+', '<C-W>+')
  call submode#map('resize', 'n', '', '-', '<C-W>-')
  call submode#map('resize', 'n', '', '>', '<C-W>>')
  call submode#map('resize', 'n', '', '<', '<C-W><')
endif

let g:submode_timeout_len = 1500
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
if has('nvim') " Vim arrow keys refuse to stay in submode
  call submode#enter_with('resize', 'n', 's', '<C-W><C-Up>',    ':ResizeUp<CR>')
  call submode#enter_with('resize', 'n', 's', '<C-W><C-Down>',  ':ResizeDown<CR>')
  call submode#enter_with('resize', 'n', 's', '<C-W><C-Right>', ':ResizeRight<CR>')
  call submode#enter_with('resize', 'n', 's', '<C-W><C-Left>',  ':ResizeLeft<CR>')

  call submode#map('resize', 'n', 's', '<C-Up>',    ':ResizeUp<CR>')
  call submode#map('resize', 'n', 's', '<C-Down>',  ':ResizeDown<CR>')
  call submode#map('resize', 'n', 's', '<C-Right>', ':ResizeRight<CR>')
  call submode#map('resize', 'n', 's', '<C-Left>',  ':ResizeLeft<CR>')
endif

call submode#enter_with('resize-hjkl', 'n', '', '<C-W>.')
call submode#map('resize-hjkl', 'n', 's', 'k',    ':ResizeUp<CR>')
call submode#map('resize-hjkl', 'n', 's', 'j',  ':ResizeDown<CR>')
call submode#map('resize-hjkl', 'n', 's', 'l', ':ResizeRight<CR>')
call submode#map('resize-hjkl', 'n', 's', 'h',  ':ResizeLeft<CR>')

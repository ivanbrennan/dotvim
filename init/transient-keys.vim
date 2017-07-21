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
 map <SID>wn_  <Nop>

 " initiate
 map <C-W><C-J>  <C-W><C-J><SID>wn_
 map <C-W><C-K>  <C-W><C-K><SID>wn_
 map <C-W><C-H>  <C-W><C-H><SID>wn_
 map <C-W><C-L>  <C-W><C-L><SID>wn_

 " continue
 noremap <script> <SID>wn_<C-J>  <C-W><C-J><SID>wn_
 noremap <script> <SID>wn_<C-K>  <C-W><C-K><SID>wn_
 noremap <script> <SID>wn_<C-H>  <C-W><C-H><SID>wn_
 noremap <script> <SID>wn_<C-L>  <C-W><C-L><SID>wn_

" ·· resize panes ············· {{{1
if has('nvim') " Vim arrow keys refuse to stay in submode
  call submode#enter_with('resize', 'n', 's', '<C-W><C-Up>',    ':CaliperUp<CR>')
  call submode#enter_with('resize', 'n', 's', '<C-W><C-Down>',  ':CaliperDown<CR>')
  call submode#enter_with('resize', 'n', 's', '<C-W><C-Right>', ':CaliperRight<CR>')
  call submode#enter_with('resize', 'n', 's', '<C-W><C-Left>',  ':CaliperLeft<CR>')

  call submode#map('resize', 'n', 's', '<C-Up>',    ':CaliperUp<CR>')
  call submode#map('resize', 'n', 's', '<C-Down>',  ':CaliperDown<CR>')
  call submode#map('resize', 'n', 's', '<C-Right>', ':CaliperRight<CR>')
  call submode#map('resize', 'n', 's', '<C-Left>',  ':CaliperLeft<CR>')
endif

call submode#enter_with('resize-hjkl', 'n', '', '<C-W>.')
call submode#map('resize-hjkl', 'n', 's', 'k',    ':CaliperUp<CR>')
call submode#map('resize-hjkl', 'n', 's', 'j',  ':CaliperDown<CR>')
call submode#map('resize-hjkl', 'n', 's', 'l', ':CaliperRight<CR>')
call submode#map('resize-hjkl', 'n', 's', 'h',  ':CaliperLeft<CR>')

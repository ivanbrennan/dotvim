" ··········· rspec ···················· {{{1
command! -bang Let execute "normal! dd?\\v^%(\\s+let!\\?\\(.+)|%(\\s*%(context|describe)\\s(\"|').*\\1\\sdo\\s*)$\<CR>p==Ilet\<bang>(:\<Esc>ea)\<Esc>f=r{A }\<Esc>`'"

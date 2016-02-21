" ··········· rspec ···················· {{{1
command! -bang Let execute "normal! dd?\\v^\\s*%(context|describe) (\"|').*\\1 do$\<CR>p==Ilet\<bang>(:\<Esc>ea)\<Esc>f=r{A }\<Esc>`'"

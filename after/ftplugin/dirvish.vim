nnoremap <buffer><silent> p yy:vertical pedit +vertical\ resize\ <C-R>=round(&columns * 7 / 9.0)<CR> <C-R>=fnameescape(getreg('"',1,1)[0])<CR><CR>

nnoremap <buffer><silent> p   yy:pedit <c-r>=fnameescape(getreg('"',1,1)[0])<cr><cr>

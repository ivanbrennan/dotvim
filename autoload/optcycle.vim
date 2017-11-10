" ··········· line numbers ············· {{{1
func! optcycle#number()
  if &number == 0
    setl foldcolumn=0 number number?
  else
    setl foldcolumn=1 nonumber number?
  end
endf

" ··········· sign column ·············· {{{1
func! optcycle#signcolumn()
  if &signcolumn == 'auto'
    set signcolumn=no
  else
    set signcolumn=auto
  end
endf

" ··········· folding ·················· {{{1
func! optcycle#foldmethod()
  if &foldmethod == 'syntax'
    setl foldmethod=indent
  elseif &foldmethod == 'indent'
    setl foldmethod=marker
  elseif &foldmethod == 'marker'
    setl foldmethod=syntax
  endif

  if &filetype == 'ruby'
    if &foldmethod == 'syntax'
      let ruby_fold = 1
    elseif exists('ruby_fold')
      unlet ruby_fold
    endif
  endif

  set foldmethod?
endf

func! optcycle#foldcolumn(fold_max)
  if &foldcolumn < a:fold_max
    call s:foldcolumn_on(a:fold_max)
  else
    call s:foldcolumn_off()
  endif
endf

func! s:foldcolumn_on(fold_max)
  let w:use_num  = &l:number
  let w:use_rel  = &l:relativenumber
  let w:fold_min = &l:foldcolumn

  setl nonumber norelativenumber
  let &l:foldcolumn = a:fold_max
endf

func! s:foldcolumn_off()
  let [ &l:number, &l:relativenumber ] = [ w:use_num, w:use_rel ]
  let &l:foldcolumn = w:fold_min
endf

" ··········· colors ··················· {{{1
func! optcycle#colorscheme()
  if exists("g:colors_name")
    execute 'colorscheme' (g:colors_name == 'nord') ? 'blight' : 'nord'
  endif
endf

func! optcycle#colorcolumn()
  let width = ColorColumnStart()

  if &colorcolumn != ''
    set colorcolumn=
    let w:long_line_highlight = matchadd('ColorColumn', '\%>'.width.'v.', 128)
  elseif exists('w:long_line_highlight')
    call matchdelete(w:long_line_highlight)
    unlet w:long_line_highlight
  else
    let &colorcolumn=join(range(width+1, width+256),',')
  endif
endf


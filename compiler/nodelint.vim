"compiler to call nodelint on javascript file

if exists('current_compiler')
  finish
endif
let current_compiler = 'nodelint'

if exists(":CompilerSet") != 2
	command -nargs=* CompilerSet setlocal <args>
endif

if !exists('g:nodelint_onwrite')
    let g:nodelint_onwrite = 1
endif

if !exists('g:nodelint_lwindow')
    let g:nodelint_lwindow = 1
endif

if exists(':NodeLint') != 2
    command NodeLint :call NodeLint(0)
endif

"nodelint:  npm install -g nodelint@0.5.2
"the name of the syntastic reporter may need to be updated
"for future versions of nodelint
if executable('nodelint')

  let s:nodelint_reporter = ''

  "check for custom reporter -- it will override nodelint version (if any)
  if exists('g:NodelintReporter')
    let s:nodelint_reporter = g:NodelintReporter
  else
    "try to find the syntastic reporter in npm modules
    if $NODE_PATH != '' "npm is installed
	  let s:node_paths = split($NODE_PATH, ':')
	  while len(s:node_paths) && s:nodelint_reporter == ''
		let s:node_path = remove(s:node_paths, 0)
        let s:nodelint_path = finddir('nodelint', s:node_path . "**")
  	    let s:nodelint_reporter = findfile('vim.js', s:nodelint_path . "**" )
  	    if s:nodelint_reporter
		  "cache the value for next time
	      let g:NodelintReporter = s:nodelint_reporter
		endif
	  endwhile
    endif
  endif

  "use a reporter if we found one, otherwise use nodelint default
  let s:nodelint_reporter_option = s:nodelint_reporter == '' ? '' : '--reporter\ ' . s:nodelint_reporter
  
  "search upwards from the file to see if the project has a "nodelint-config"
  let s:config = findfile("nodelint-config.js", ".;")
  
  if s:config == ""
    " if there is a global from .vimrc, use that...
    if exists('g:NodelintConfig')
      let s:config = g:NodelintConfig
    endif
  endif

  " use config file if any found, or default
  let s:config_option = s:config == '' ? '' : '--config\ ' . s:config

  execute 'setlocal efm=%fline\ %l\ column\ %c\ Error:\ %m'

  execute 'setlocal makeprg=nodelint\ %\ ' . s:config_option . '\ ' . s:nodelint_reporter_option

endif


if g:nodelint_onwrite
    augroup javascript
        au!
        au BufWritePost * call NodeLint(1)
    augroup end
endif

function! NodeLint(saved)

    if !a:saved && &modified
        " Save before running
        write
    endif	

	"shellpipe
    if has('win32') || has('win16') || has('win95') || has('win64')
        setlocal sp=>%s
    else
        setlocal sp=>%s\ 2>&1
    endif

	silent lmake
	
	"auto open the location window unless g:NodelintPassive is true
	if !(exists('g:NodelintPassive') && g:NodelintPassive)
		:lwindow
	endif
	
endfunction

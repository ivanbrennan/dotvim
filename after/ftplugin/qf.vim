" Adjust quickfix statusline to show the command that was run and total line count:
setlocal stl=%{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%l·%L\ 

set colorcolumn=""

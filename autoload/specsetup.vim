func! specsetup#Vmux()
  VmuxPrimary
  let g:spec_runner_dispatcher = "call system(\"tmux send -t " . g:vmux_primary . " C-L '{command}' ENTER\")"
endf

func! specsetup#Vtux()
  let g:spec_runner_dispatcher = "VtrSendCommand! {command}"
  echo 'g:spec_runner_dispatcher = "' . g:spec_runner_dispatcher . '"'
endf

func! specsetup#Fifo()
  let g:spec_runner_dispatcher = "silent !echo clear > test_commands && echo {command} > test_commands"
  echo 'g:spec_runner_dispatcher = "' . g:spec_runner_dispatcher . '"'
endf

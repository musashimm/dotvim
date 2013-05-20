command! -complete=shellcmd -nargs=0 SaveAndSend call s:SaveAndSend()
function! s:SaveAndSend()
  let fname = bufname("%")
  if empty(fname)
    let fname = "~/tmp/temp_file_" . strftime("%Y%m%d_%H%M%S") . ".txt"
  end
  if &modified
    execute "w ".fnameescape(fname)
  end
  execute "!~/bin/sendMail.sh %"
endfunction

command! ReformatAndClean call s:ReformatAndClean()

function! s:ReformatAndClean()
  normal mz
  %s/\v\s+$//e
  %s/\v\t+//eg
  normal gg=G
  normal `z
endfunction

nnoremap <silent> ,f :ReformatAndClean<cr>

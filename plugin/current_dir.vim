function! CurrentDirectory()
  let l:currd = getcwd()
  let l:fields = split(l:currd,"/")
  let l:length = len(l:fields)
  if l:length
    return l:fields[-1]
  else
    return "/"
  endif
endfunction

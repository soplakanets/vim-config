" Minimum autosave interval in seconds.
let g:AUTOSAVE_TIMEOUT=1

function! UpdateTime()
  let b:autosave_start_time=localtime()
endfunction

function! Save()
  if ((localtime() - b:autosave_start_time) >= g:AUTOSAVE_TIMEOUT)
    update
  endif
endfunction

function! IsUnderScm()
  if isdirectory("./.git") || isdirectory("./.svn")
    return 1
  else
    return 0
  endif
endfunction

if IsUnderScm()
  au BufRead,BufNewFile * call UpdateTime()
  au BufWritePre * call UpdateTime()
  au CursorHold * call Save()
endif

call UpdateTime()


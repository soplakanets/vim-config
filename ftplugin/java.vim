" Execute file being edited with <Ctrl-M>:
map <buffer> <C-m> :w<CR>:make<CR> :!~/.vim/bin/execute-java-class %<CR>

" C-Style identation
set cindent

" 2 spaces for tabs in python.
setlocal shiftwidth=2
setlocal softtabstop=2


if exists("current_compiler")
    finish
endif
let current_compiler = "javac"

" Javac defaults to printing output on stderr and no options can convert,
" so we have to set 'shellpipe'
setlocal shellpipe=2>
" 2> works on Win NT and UNIX
setlocal makeprg=javac\ %
setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#


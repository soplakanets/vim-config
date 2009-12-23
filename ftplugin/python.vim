" Execute file being edited with <Ctrl-M>:
map <buffer> <C-m> :w<CR>:!/usr/bin/env python % <CR>
set omnifunc=pythoncomplete#Complete

set completeopt-=preview

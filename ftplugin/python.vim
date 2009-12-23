" Execute file being edited with <Ctrl-M>:
map <buffer> <C-m> :w<CR>:!/usr/bin/env python % <CR>

" Use omni completion method from Python plugin.
set omnifunc=pythoncomplete#Complete

" Do not show PyDoc in asplit at window top. Annoying.
set completeopt-=preview

" 2 spaces for tabs in python.
setlocal shiftwidth=2
setlocal softtabstop=2


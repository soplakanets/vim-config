" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Show current and last used command.
set showcmd
" Show current mode.
set showmode

" Enable filetype plugin and file-type specific indenting.
filetype plugin indent on
" Enable syntax highlighting.
syntax on

" Highlight search matches.
set hlsearch
" Incremental search. Search items highlighted as you type.
set incsearch
" Ingore case by default on search, etc.
set ic

" Display line numbers.
set nu

set smartindent

" Tab = 4 spaces
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Make cmdline tab completion similar to bash.
set wildmode=list:longest
" Enable ctrl-n and ctrl-p to scroll thru matches.
set wildmenu

" Display tabs and trailing spaces.
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅


" HOTKEYS
" Easy tab navigation.
map <Leader>1 :tabnext 1<CR>
map <Leader>2 :tabnext 2<CR>
map <Leader>3 :tabnext 3<CR>
map <Leader>4 :tabnext 4<CR>
map <Leader>5 :tabnext 5<CR>
map <Leader>6 :tabnext 6<CR>
map <Leader>7 :tabnext 7<CR>
map <Leader>8 :tabnext 8<CR>
map <Leader>9 :tabnext 9<CR>

map <Leader>t :tabnew<CR>


" PLUGIN SETTINGS

" VCSCommand
" Disbale coloring in git diff command.
let VCSCommandGitDiffOpt='--no-color'



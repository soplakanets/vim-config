" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set background=dark

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
set smartcase

" Display line numbers.
set number

set ruler

" Status line formatting
set statusline=%<%f%h%m%r\ 0x%b\ %{&encoding}\ \ %l,%c%V  
set laststatus=2

set smartindent

" Tab = 4 spaces
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Make cmdline tab completion similar to bash.
set wildmode=list:longest
" Enable ctrl-n and ctrl-p to scroll thru matches.
set wildmenu

" Set syntax highlighting for buffer that comes from MySQL client called by \e
au BufNewFile,BufRead *tmp/sql* set syntax=sql


function! SuperCleverTab() 
    " check if at beginning of line or after a space 
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$' 
      return "\<Tab>" 
    else 
       " do we have omni completion available 
       if &omnifunc != ''  
          " use omni-completion 1. priority 
          return "\<C-X>\<C-O>" 
       elseif &dictionary != ''  
          " no omni completion, try dictionary completion
          return "\<C-X>\<C-K>" 
       else 
          " no omni completion or dictionary completion 
          " use known-word completion 
          return "\<C-N>" 
      endif 
    endif 
endfunction 

" bind function to the tab key
inoremap <Tab> <C-R>=SuperCleverTab()<CR>


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

if has("gui_running")
    " Don't use antialising.
    set antialias!
    set guifont=Monaco:h14
    colorscheme desert
    " Use all vertical and gorizontal space.
    set fuoptions=maxvert,maxhorz,background:Normal
    " Disable right sclorllbar.
    set guioptions-=r
    " Disable left scrollbar.
    set guioptions-=L
    " Hide toolbar by default.
    set guioptions-=T
endif

" Auto re-generate ctags file on save.
" Can take long time on large directories.
au BufWritePost *.py silent! !ctags -R &


" Initialize plugins from 'bundle' directory.
call pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect
set nocompatible

" What is the console background? Sets apropriate color scheme
set background=light

" Show current and last used command
set showcmd

" Show current mode
set showmode

" Enable filetype plugin and file-type specific indenting
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Highlight search matches
set hlsearch

" Incremental search. Search items highlighted as you type
set incsearch
set smartcase

" Display line numbers
set number

set ruler

" Status line formatting
set statusline=%<%f%h%m%r\ 0x%b\ %{&encoding}\ \ %l,%c%V  
" Always show status line
set laststatus=2

" 'Smart' identation
set smartindent


" Tab = 4 spaces
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" No annoying bells
set noerrorbells
set visualbell
set t_vb=

" Make cmdline tab completion similar to bash.
set wildmode=list:longest
" Enable ctrl-n and ctrl-p to scroll thru matches.
set wildmenu

" Set syntax highlighting for buffer that comes from MySQL client called by \e
au BufNewFile,BufRead *tmp/sql* set syntax=sql

" Detect JSON files
au BufRead,BufNewFile *.json setfiletype javascript 

" Detect .ejs files as HTML
au BufRead,BufNewFile *.ejs setfiletype html 

" Ruby syntax for Vagrant config files.
au BufRead,BufNewFile Vagrantfile setfiletype ruby

" Try to use file template when creating new file
autocmd! BufNewFile * silent! 0r ! ~/.vim/bin/template %


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

" Easy split windows bavigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <Leader>t :tabnew<CR>
map <Leader>n :NERDTreeToggle<CR>


" PLUGIN SETTINGS

" VCSCommand
" Disbale coloring in git diff command.
let VCSCommandGitDiffOpt='--no-color'

if has("gui_running")
    set background=dark
    if has("gui_macvim")
        set fuopt+=maxhorz
        set guifont=Menlo\ Regular:h18
    else
        set guifont=Inconsolata\ Medium\ 16
    endif

    colorscheme desert
    
    " Disable right sclorllbar.
    set guioptions-=r
    " Disable left scrollbar.
    set guioptions-=L
    " Hide toolbar by default.
    set guioptions-=T
    
    " Always show tab bar
    set showtabline=2
endif

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" Highlight lines longer than 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

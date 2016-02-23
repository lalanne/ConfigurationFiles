"handling plugins
execute pathogen#infect()

"color scheme
syntax enable
set background=dark
set t_Co=16
colorscheme solarized

"General
set ruler               "shows line and column of the cursor
set nocompatible        "be improved
set tabstop=4           "a tab is four spaces          
set shiftwidth=4        "number of spaces to use when auto indent
set expandtab           "insert spaces where tabs are inserted
set smartindent
set autoindent         
set showbreak=↪
set hlsearch            "highlight search terms
set incsearch           "show search matches as you type
set showmatch           "show matching parenthesis

if version >= 703
    set relativenumber  "show relative line numbers
else
    set number          "show line numbers
endif

set autochdir           "set working directory as the one of the file you are editing

set visualbell
set backspace=indent,eol,start      "allows you to delete previously enter characters
                                    "with backspace key
 
syntax on

filetype on             "detecting file type that is being edited
filetype plugin on      "load the right plugins for a filetype
filetype plugin indent on           "indenting intelligence is enable depending on
                                    "file type

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

"project compilation and execution C++, via a Makefile
map <F11> :w<CR> :!clear; make && ./tests<CR>
"single file compilation and execution C++
map <F8> : !c++ % && ./a.out <CR>
"single file compilation and execution C++
map <F7> : !gcc % && ./a.out <CR>

nnoremap - <C-w>s 
nnoremap \| <C-w>v 

"SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"

"vim airline (powerline)
set laststatus=2 
let g:airline_powerline_fonts=1 
let g:airline_theme='dark' 
"tabs airline
let g:airline#extensions#tabline#enabled = 1
                  
if !exists('g:airline_symbols') 
    let g:airline_symbols = {} 
endif 

let g:airline_symbols.space = "\ua0"  

"Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
autocmd BufEnter *.cpp nested TagbarOpen
autocmd BufEnter *.hpp nested TagbarOpen
autocmd BufEnter *.c nested TagbarOpen
autocmd BufEnter *.h nested TagbarOpen

"CtrlP
nnoremap <leader>p :CtrlP<CR>

"For MacVIM to show the symbols of powerline airline
set guifont=Source\ Code\ Pro\ for\ Powerline

"Folding by syntax
set foldmethod=syntax
set nofoldenable "no fold when open
set foldlevel=2

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

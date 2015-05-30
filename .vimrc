execute pathogen#infect()

syntax enable

"background color
if has('gui_running')
  set background=light
else
  set background=light
endif

"color scheme
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"

"colorscheme solarized
colorscheme molokai
"let g:molokai_original = 1 
"let g:rehash256 = 1

"TagBar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarOpen<CR>
nnoremap <leader>ll :TagbarClose<CR>

"General
set ruler "shows line and column of the cursor
set nocompatible      " be improved
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent
set autoindent
set cursorline
set showbreak=↪
set autoindent  
set hlsearch
set incsearch
set showmatch
set number 
set autochdir
set list
set visualbell
set listchars=extends:❯,precedes:❮
syntax on

filetype on
filetype plugin on

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

"SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"

"clang
let g:clang_user_options='|| exit 0'
let g:clang_close_preview=1
highlight OverLength ctermbg=red ctermfg=white guibg=#592929

"set line width
"set colorcolumn=90
"match OverLength /\%91v.\+/


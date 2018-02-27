call plug#begin('~/.config/nvim/plugged')

Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim', { 'on':  'CtrlP' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-syntastic/syntastic'
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'arakashic/nvim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'vim-scripts/a.vim'
"Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'icymind/NeoSolarized'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tarekbecker/vim-yaml-formatter'
Plug 'Shougo/denite.nvim'

call plug#end()

"truecolors
set termguicolors

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"colorscheme molokai
colorscheme NeoSolarized
set background=dark
let g:neosolarized_contrast = "normal"
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

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
set cursorline          "highlight currentline
"set list                "show special characters
"set listchars=eol:¬     "show end of line
"set listchars=tab:▸\ ,eol:¬ "show tabs and end of line

if version >= 703
    set relativenumber  "show relative line numbers
    set nu              "show current line number in current line not 0
else
    set number          "show line numbers
endif

set autochdir           "set working directory as the one of the file you are editing

set visualbell
set backspace=indent,eol,start      "allows you to delete previously enter characters
                                    "with backspace key
 
"gitgutter
let g:gitgutter_override_sign_column_highlight = 0

"limit column
highlight OverLength ctermbg=red ctermfg=green guibg=#592929
match OverLength /\%86v.\+/
set colorcolumn=86

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"CtrlP
nnoremap <leader>p :CtrlP<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

syntax on

filetype on             "detecting file type that is being edited
filetype plugin on      "load the right plugins for a filetype
filetype plugin indent on           "indenting intelligence is enable depending on
                                    "file type

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

nnoremap - <C-w>s 
nnoremap \| <C-w>v A

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"

"vim airline (powerline)
set laststatus=2 
let g:airline_powerline_fonts=0
let g:airline_theme='molokai'
"tabs airline
let g:airline#extensions#tabline#enabled = 1

" the separator used on the left side
let g:airline_left_sep=''
" the separator used on the right side 
let g:airline_right_sep=''

                  
if !exists('g:airline_symbols') 
    let g:airline_symbols = {} 
endif 

let g:airline_symbols.space = "\ua0"  

"no backupfile
set nobackup
set noswapfile

"Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
autocmd BufEnter *.cpp nested TagbarOpen
autocmd BufEnter *.hpp nested TagbarOpen
autocmd BufEnter *.c nested TagbarOpen
autocmd BufEnter *.h nested TagbarOpen
autocmd BufEnter *.js nested TagbarOpen
autocmd BufEnter *.py nested TagbarOpen

"For MacVIM to show the symbols of powerline airline
set guifont=Source\ Code\ Pro\ for\ Powerline

"Folding by syntax
set foldmethod=syntax
set nofoldenable "no fold when open
set foldlevel=2

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_ballons=has('ballon_eval')

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_sh_checkers=['sh','shellcheck','checkbashisms']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"yaml formatter
let g:yaml_formatter_indent_collection=1

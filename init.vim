call plug#begin('~/.config/nvim/plugged')

Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim', { 'on':  'CtrlP' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'neomake/neomake'
Plug 'vim-syntastic/syntastic'
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
"Plug 'Shougo/unite.vim'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'fatih/vim-go'
Plug 'vim-scripts/a.vim'
Plug 'arakashic/nvim-colors-solarized'

call plug#end()

"truecolors
set termguicolors

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=light
"colorscheme solarized
colorscheme molokai

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
set list                "show special characters
set listchars=tab:▸\ ,eol:¬ "show tabs and end of line

if version >= 703
    set relativenumber  "show relative line numbers
    set nu              "show current line number in current line not 0
else
    set number          "show line numbers
endif

"limit column
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%86v.\+/

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

"CtrlP
nnoremap <leader>p :CtrlP<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

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
"autocmd BufEnter *.cpp nested TagbarOpen
"autocmd BufEnter *.hpp nested TagbarOpen
"autocmd BufEnter *.c nested TagbarOpen
"autocmd BufEnter *.h nested TagbarOpen

"neomake
"autocmd! BufWritePost * Neomake
"let g:neomake_open_list = 2


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





call plug#begin('~/.config/nvim/plugged')

Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim', { 'on':  'CtrlP' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'

call plug#end()

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

if version >= 703
    set relativenumber  "show relative line numbers
    set nu              "show current line number in current line not 0
else
    set number          "show line numbers
endif

"" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

"CtrlP
nnoremap <leader>p :CtrlP<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"" Use deoplete.
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
autocmd BufEnter *.cpp nested TagbarOpen
autocmd BufEnter *.hpp nested TagbarOpen
autocmd BufEnter *.c nested TagbarOpen
autocmd BufEnter *.h nested TagbarOpen

"neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_open_list = 2


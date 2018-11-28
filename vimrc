call plug#begin('~/.config/nvim/plugged')

" symbols bar
Plug 'majutsushi/tagbar'

" File explorer bar
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Fuzzy search of files
Plug 'kien/ctrlp.vim', { 'on':  'CtrlP' }

" Git integration
Plug 'tpope/vim-fugitive'

" Airline bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Lintern/Syntax
Plug 'vim-syntastic/syntastic'

" Show errors/warnings in the side of the editor
Plug 'airblade/vim-gitgutter'

" Parenthesis
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'

" JSON
Plug 'elzr/vim-json'

" TOML
Plug 'cespare/vim-toml'

" YAML
Plug 'tarekbecker/vim-yaml-formatter'

" Docker
Plug 'ekalinin/Dockerfile.vim'

" Rustlang
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" protocol buffers
Plug 'uarun/vim-protobuf'

" Golang
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" autocompletion general
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" autocompletion (also a linter - diagnostics) C++
Plug 'vim-scripts/a.vim'
" Plug 'Shougo/neoinclude.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer', 'for': 'cpp' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'


call plug#end()

"truecolors
set termguicolors

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme molokai
"colorscheme NeoSolarized
"set background=light
"let g:neosolarized_contrast = "normal"
"let g:neosolarized_bold = 1
"let g:neosolarized_underline = 1
"let g:neosolarized_italic = 1
"set t_8f=^[[38;2;%lu;%lu;%lum
"set t_8b=^[[48;2;%lu;%lu;%lum

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

let g:syntastic_cpp_compiler = 'c++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_c_config_file = '.syntastic_cpp_config'
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'

"yaml formatter
let g:yaml_formatter_indent_collection=1

"go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_addtags_transform = "camelcase"
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)

"let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

"rust
set hidden
let g:racer_cmd = "/Users/lalanne/.cargo/bin/racer"
let g:racer_experimental_completer=1
let $RUST_SRC_PATH="/Users/lalanne/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src"
let g:rustfmt_autosave=1

"cpp
let g:cpp_member_variable_highlight = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"" turn on completion in comments
let g:ycm_complete_in_comments=1
"" load ycm conf by default
let g:ycm_confirm_extra_conf=0
"" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
"" only show completion as a list instead of a sub-window
"set completeopt-=preview
"" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=1
"" don't cache completion items
let g:ycm_cache_omnifunc=0
"" complete syntax keywords
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" clang_format
let g:clang_format#code_style="google"
let g:clang_format#auto_format=1

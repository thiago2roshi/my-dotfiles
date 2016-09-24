" custom frankstein vim config

" ###### PLUGIN {{{
" iniciando vim-plug
call plug#begin('~/.config/nvim/plugged')
" agora pode colocar os plugins

" filesystem tree
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree'

" colorscheme
Plug 'morhetz/gruvbox'

" status line para combinar com o powerline do zsh
Plug 'vim-airline/vim-airline'

" ACK for VIM
Plug 'mileszs/ack.vim'

" Tabular use for VIM
Plug 'godlygeek/tabular'

Plug 'jistr/vim-nerdtree-tabs.git'

"" Custom bundles
"" PHP Bundle
Plug 'arnaud-lb/vim-php-namespace'

"" HTML Bundle
Plug 'amirh/HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" Add plugins to &runtimepath
call plug#end()
"###### }}}

" ##### ViM configs {{{

syntax on
set encoding=utf8
set t_Co=256                   " This is may or may not needed.
set background=dark            " dark-mode gruvbox
set noswapfile                 " No annoying swap files
set autochdir                  " Auto change dir to file directory
set autoindent                 " Auto indent
set backspace=indent,eol,start " backspace intuitive
set cursorline                 " highlight line
set ignorecase                 " ignore case sensitive
set number                     " show line numbers
set title                      " Title Bar
set incsearch                  " Show search results as you type
set hlsearch                   " Highlight search matches
set nobackup                   " dont backup files
set nowritebackup              " redudacy ^
set undofile                   " Persistent Undo
set undolevels=500             " Persist levels
set undoreload=500             " Persist reloads
nnoremap <space> za             " space open/close folds


" cool tab
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

filetype indent on
set directory=$HOME/.cache/vim//,. " Cache dir
"
" ##### }}}

" ##### Other things {{{
colorscheme gruvbox   " colorscheme
autocmd vimenter * NERDTree " open NERDTree automatic
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1 " vim-airline com pwrLine font
"
" Improve Neovim startup time by disabling python and host check
let g:python_host_skip_check= 1
let g:loaded_python_provider = 1
let g:loaded_python3_provider = 1
" fold/dobras
set foldlevelstart=200
set foldlevel=200 
"##### }}}

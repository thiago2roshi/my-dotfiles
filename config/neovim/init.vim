" iniciando vim-plug
call plug#begin('~/.config/nvim/plugged')
"" agora pode colocar os plugins
"
" filesystem tree
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree'
" colorscheme
Plug 'morhetz/gruvbox'
" status line para combinar com o powerline do zsh
Plug 'vim-airline/vim-airline'
"
" Add plugins to &runtimepath
call plug#end()
"
syntax on
set t_Co=256   " This is may or may not needed.
" colorscheme
colorscheme gruvbox
set background=dark   " dark-mode gruvbox
let g:airline_theme='gruvbox'
" vim-airline com pwrLine font
let g:airline_powerline_fonts=1

" ===========
" Some inspirations
" ===========

" No annoying swap files"
set noswapfile

" Persistent Undo, Vim remembers everything even after the file is closed.
set undofile
set undolevels=500
set undoreload=500

" Show search results as you type
set incsearch

" Highlight search matches
set hlsearch

" Improve Neovim startup time by disabling python and host check
let g:python_host_skip_check= 1
let g:loaded_python_provider = 1
let g:loaded_python3_provider = 1

" Auto change dir to file directory
set autochdir

" Make Neovim more python [PEP8] friendly
" Pressing <tab> results in four spaces
" (useful for indenting code)

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

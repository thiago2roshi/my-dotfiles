" iniciando vim-plug
call plug#begin('~/.config/nvim/plugged')
"" agora pode colocar os plugins
"
" filesystem tree
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
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
colorscheme gruvbox
set background=dark   " dark-mode gruvbox
let g:airline_theme='gruvbox'
" vim-airline com pwrLine font
let g:airline_powerline_fonts=1

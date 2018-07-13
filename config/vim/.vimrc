" custom frankstein vim config
" tranks for gitHUB, reddit and Aurelio Jargas for convince me for use *nix

" ##### ViM configs {{{
set nocompatible                " ViM remove 'compatibility' with VI

set nospell spelllang=pt,en        " added spellchecking: Thanks @fabio from https://www.vivaolinux.com.br/
" Fix common typos
cab W w | cab Q q | cab Wq wq | cab WQ wq

set encoding=utf8
set fileencoding=utf8           " file write encode
set t_Co=16                    " This is may or may not needed.
set background=dark             " dark-mode

set autochdir                   " Auto change dir to file directory
set visualbell                  " no sound bell
set ttimeoutlen=50              " reduce timeout keycode (50ms) for fast ESC

"set nobackup                   " dont backup files
"set nowritebackup              " redudacy ^
"set noswapfile                 " No annoying swap files
set undolevels=500              " Persist levels
set undoreload=500              " Persist reloads
set history=50                  " keep 50 lines history

" ===========
if has ('win32')
    set nobackup
    set nowritebackup
    set noswapfile
    set noundofile
else
    set backup
    set swapfile
    set undofile                                " Persistent Undo
    silent execute '!mkdir -p $HOME/.cache/vim/backup'
    set backupdir=$HOME/.cache/vim/backup//     "backup store folder
    silent execute '!mkdir -p $HOME/.cache/vim/undo'
    set undodir=$HOME/.cache/vim/undo//           "undo folder
endif

syntax on
if has("autocmd")
    filetype plugin on
    filetype indent plugin on
    filetype indent on
endif


" ##### }}}


" #### ViM KeyBinds {{{
" space open/close folds
nnoremap <space> za
" save session
nnoremap <leader>s :mksession
" prevent lazy hold shift in cmd - ':WQ' for example
nnoremap ;  :
" prevent lazy hold shift in cmd - ':WQ' for example

" Tabular / align text by character
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" ####  }}}}
" 

" #### ViM Ui {{{{

colorscheme shblah
set title                       " Title Bar
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display mode
set cursorline                  " highlight line
set backspace=indent,eol,start  " backspace intuitive
set number                      " show line numbers
set relativenumber              " show linenumber relative
set ignorecase                  " ignore case sensitive
set incsearch                   " Show search results as you type
set hlsearch                    " Highlight search matches

if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
endif 

if has('statusline')
    set laststatus=2            "Always show the status line

    " Broken down into easily includeable segments
    set statusline=%<%f\                                " Filename
    " set statusline+=\ [%{getcwd()}]                     " Current dir
    set statusline+=%w%h%m%r                            " Options
    set statusline+=%{fugitive#statusline()}            " Git Hotness
    set statusline+=\ [%{&ff}/%Y]                       " Filetype
    " set statusline+=\ [%{strftime(\"%l:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}]\ 
                                                        " Current time
    " set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=[tabs=%{&ts}]
    set statusline+=%=%-14.(line:%l,col:%c%V%)\ %p%%    " Right aligned file nav info
endif

" hightlight whitespace chars
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

" WildMenu
set wildmenu
set wildignorecase
set wildmode=longest,list:longest
"" set ignore file extensions for WildMenu
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

"""Netrw_menu  ////// Using CtrlP for now
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 12
"augroup ProjectDrawer
"      autocmd!
"        autocmd VimEnter * :Vexplore
"    augroup END
"
"
" #### }}}}

" ##### formatting {{{
set nowrap              " no break/wrap long lines 
set smartindent         " adjust indent in new lines
set autoindent          " Auto indent

set smarttab            " make tab insert indedents instead of tabs at beginning fo a line
set expandtab           " tabs is spaces, no tabs

set shiftwidth=4        " indent N spaces
set tabstop=4           " same up 
set softtabstop=4       " backspace delete indentation
set textwidth=80

" remove tralling whitespaces
  autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre  <buffer> :call  setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


" fold/dobras
"set foldmethod=indent
"set foldnestmax=2

"##### }}}

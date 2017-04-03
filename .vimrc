" Color settings
syntax enable
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Numberline settings
set number
set numberwidth=4

" Indent settings
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set shiftround

" Search settings
set incsearch
set smartcase
set hlsearch

" Remove ESC delay in Vim
set timeoutlen=1000 ttimeoutlen=0

" Swap, backup, and undo directories
set directory=~/.vim/temp//
set backupdir=~/.vim/temp//
set undodir=~/.vim/undodir//
set undofile

"set smartindent
"filetype on
"filetype plugin on
"set wildmenu
"set wildmode=list:longest,full
"set hlsearch
"set ruler

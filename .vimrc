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
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
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

" Map Y to yank until EOL
map Y y$
" Map <C-L> (redraw screen) to also :noh
nnoremap <C-L> :nohl<CR><C-L>

set ruler
set wildmenu
set showcmd

"filetype on

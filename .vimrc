" Color settings
syntax enable
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Numberline settings
set number
set relativenumber
set numberwidth=4
set cursorline

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

" Highlight text paste 80 columns
"match ColorColumn "\%80v."
match ColorColumn "\%>80v.\+"

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
nnoremap H gT
nnoremap L gt

set ruler
set wildmode=longest,list,full
set wildmenu
set laststatus=2
hi StatusLine ctermbg=232 ctermfg=241
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"filetype on

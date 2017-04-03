syntax enable
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Numberline settings
set number
set numberwidth=4

" Tab settings
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

" Increases responsiveness of ESC
set timeoutlen=1000 ttimeoutlen=0

"set laststatus=2
"set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

" Swap and backup directory
"set directory^=~/.vim//

" Persistent undo
"set undodir=~/.vim//
"set undofile

"set smartindent
"filetype on
"filetype plugin on
"set wildmenu
"set wildmode=list:longest,full
"set hlsearch
"set ruler

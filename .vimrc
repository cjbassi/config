syntax enable

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

" Swap and backup directory
set directory^=~/.vim//

" Persistent undo
35 set undodir=~/.vim//
36 set undofile

" Enables tab switching
nnoremap H gT
nnoremap L gt

if $TERM == "xterm-256color"
	set t_Co=256
endif

set laststatus=2
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

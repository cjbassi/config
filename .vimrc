" Color settings
syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Numberline settings
set number
set relativenumber
set numberwidth=4
set cursorline

" Indent settings
set tabstop=4
set autoindent
set shiftwidth=4
set shiftround

" Search settings
set incsearch
set smartcase
set hlsearch

" Highlight text past 80 columns
call matchadd('ColorColumn', '\%>80v.\+')

" Shows indents
"set list listchars=tab:\|\ ,
"highlight Tabs ctermbg=234
"call matchadd('Tabs', '\t')

" Highlight trailing whitspace
highlight ExtraWhitespace ctermbg=red
call matchadd('ExtraWhitespace', '\s\+\%#\@<!$')

" Remove ESC delay in Vim
set timeoutlen=1000 ttimeoutlen=0

" Makes ESC not move cursor left
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" Swap, backup, and undo directories
set directory=~/.vim/temp//
set backupdir=~/.vim/temp//
set undodir=~/.vim/undodir//
set undofile

" Map Y to yank until EOL
map Y y$

" Map <C-L> (redraw screen) to also :noh
nnoremap <C-L> :nohl<CR><C-L>

" Map H and L to navigate tabs
nnoremap H gT
nnoremap L gt

" Tab settings in command bar
set wildmode=longest:full,full
set wildmenu

" StatusLine settings
set ruler
set laststatus=2
hi StatusLine ctermbg=232 ctermfg=241
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

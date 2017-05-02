" Colors
syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Keybinds
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
nnoremap H gT
nnoremap L gt

" Remove ESC delay in Vim
set timeoutlen=1000 ttimeoutlen=0

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

" Tab settings in command bar
set wildmode=longest:full,full
set wildmenu
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

" Makes ESC not move cursor left
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" Highlight text past 80 columns
call matchadd('ColorColumn', '\%>80v.\+')

" Highlight trailing whitspace
highlight ExtraWhitespace ctermbg=red
call matchadd('ExtraWhitespace', '\s\+\%#\@<!$')

" Swap, backup, and undo directories
set directory=~/.vim/temp//
set backupdir=~/.vim/temp//
set undodir=~/.vim/undodir//
set undofile
set undolevels=100 " Limits undo level to 100, limit file size

" StatusLine settings
set ruler
set laststatus=2
hi StatusLine ctermbg=232 ctermfg=241
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Shows indents
"set list listchars=tab:\|\ ,
"highlight Tabs ctermbg=234
"call matchadd('Tabs', '\t')

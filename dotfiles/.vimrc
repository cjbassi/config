" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'google/vim-searchindex'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-syntastic/syntastic'

Plug 'altercation/vim-colors-solarized'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" You complete me
" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
" Initialize plugin system

call plug#end()

" Colors
syntax enable
set t_Co=256
set background=dark

let g:solarized_termcolors=256
colorscheme solarized

filetype plugin indent on

" Disables comments on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Opens new panes on the right
set splitright

" Keybinds
map Y y$
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
nnoremap H gT
nnoremap L gt
nnoremap <C-J> i<CR><Esc>k$

set cursorline

" Remove ESC delay in Vim
set timeoutlen=1000 ttimeoutlen=0

" Numberline settings
set number
set relativenumber
set numberwidth=4

" Tab settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" Indent settings
set autoindent

" Search settings
set incsearch
set ignorecase
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
"call matchadd('ColorColumn', '\%>80v.\+')
augroup colorcolumn
    au!
    au VimEnter,WinEnter * call matchadd('ColorColumn', '\%81v.\+', 100)
augroup END

" Highlight trailing whitspace
highlight ExtraWhitespace ctermbg=red
"call matchadd('ExtraWhitespace', '\s\+\%#\@<!$')
augroup whitespace
    au!
    au VimEnter,WinEnter * call matchadd('ExtraWhitespace', '\s\+\%#\@<!$')
augroup END

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

set clipboard=unnamedplus

execute "set <M-h>=\eh"
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
execute "set <M-l>=\el"

"nnoremap <silent> <M-h> <C-w>h
"nnoremap <silent> <M-j> <C-w>j
"nnoremap <silent> <M-k> <C-w>k
"nnoremap <silent> <M-l> <C-w>l

" Shows indents
"set list listchars=tab:\|\ ,
"highlight Tabs ctermbg=234
"call matchadd('Tabs', '\t')

"auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent ! curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
map <Leader>x :call RangerExplorer()<CR>

set updatetime=250

set scrolloff=1
set sidescrolloff=5
set display+=lastline
set encoding=utf-8
set formatoptions+=j " Delete comment character when joining commented lines"
set autoread
set tabpagemax=50
set history=1000

if has('path_extra')
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
if !empty(&viminfo)
    set viminfo^=!
endif
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

set sessionoptions-=options
set complete-=i
set nrformats-=octal

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

function! s:setup_paste() abort
  let s:paste = &paste
  set paste
  augroup unimpaired_paste
    autocmd!
    autocmd InsertLeave *
          \ if exists('s:paste') |
          \   let &paste = s:paste |
          \   unlet s:paste |
          \ endif |
          \ autocmd! unimpaired_paste
  augroup END
endfunction

nnoremap <silent> <Plug>unimpairedPaste :call <SID>setup_paste()<CR>

nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O

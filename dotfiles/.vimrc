call plug#begin('~/.vim/plugged')

Plug 'google/vim-searchindex'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'

" Plug 'bling/vim-bufferline'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

"Plug 'raimondi/delimitmate'
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'christoomey/vim-tmux-navigator'

Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors

"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'
set noshowmode

" if &background == "dark"
"     let s:base03 = "NONE"
"     let s:base02 = "NONE"
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds

map Y y$
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
nnoremap H gT
nnoremap L gt
nnoremap <C-J> i<CR><Esc>k$
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"inoremap <CR> <CR>x<BS>
"nnoremap o ox<BS>
"nnoremap O Ox<BS>

" yo and yO to set paste and nopaste
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings

filetype plugin indent on
set autoindent
set splitright " Opens new panes on the right
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disables comments on new lines
set cursorline
set timeoutlen=1000 ttimeoutlen=0 " Remove ESC delay in Vim
set scrolloff=1
set sidescrolloff=5
set display+=lastline
set encoding=utf-8
set formatoptions+=j " Delete comment character when joining commented lines"
set autoread
set tabpagemax=50
set history=1000

set sessionoptions-=options
set complete-=i
set nrformats-=octal

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

" Search settings
set incsearch
set ignorecase
set smartcase
set hlsearch

" Tab completion settings in command bar
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

" StatusLine settings
set ruler
set laststatus=2
hi StatusLine ctermbg=232 ctermfg=241
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting

" Highlight text past 80 columns
augroup colorcolumn
    au!
    au VimEnter,WinEnter * call matchadd('ColorColumn', '\%81v.\+', 100)
augroup END

" Highlight trailing whitspace
highlight ExtraWhitespace ctermbg=red
augroup whitespace
    au!
    au VimEnter,WinEnter * call matchadd('ExtraWhitespace', '\s\+\%#\@<!$')
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" External stuff

" Swap, backup, and undo
set directory=~/.vim/temp//
set backupdir=~/.vim/temp//
set undodir=~/.vim/undodir//
set undofile
set undolevels=100 " Limits undo level to 100, limits file size

set clipboard=unnamedplus

execute "set <M-h>=\eh"
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
execute "set <M-l>=\el"

inoremap è <Esc>h
inoremap ê <Esc>j
inoremap ë <Esc>k
inoremap ì <Esc>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent ! curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" vim-tmux-nagivagor
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" gitgutter
set updatetime=250

" Ranger explorer
function RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
map <Leader>x :call RangerExplorer()<CR>

" bufferline
" let g:bufferline_active_buffer_left = ''
" let g:bufferline_active_buffer_right = ''
" let g:bufferline_modified = ' [+]'
" let g:bufferline_show_bufnr = 0
" let g:bufferline_echo = 0
" autocmd VimEnter *
"     \ let &statusline='%{bufferline#refresh_status()}'
"         \ .bufferline#get_status_string()

" Airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

" delimimate
"let delimitMate_expand_cr = 1

" lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo'  ],
      \              [ 'column'  ],
      \              [ 'filetype'  ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component': {
      \   'lineinfo': "%{printf('%03d/%03d', line('.'),  line('$'))}",
      \   'column': "%{printf('%02d', col('.'))}"
      \ },
      \ }
function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
" let g:lightline.tab = {
"       \ 'active': [],
"       \ 'inactive': [],
"       \ }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [] }
let g:lightline.tabline_separator = { 'left': '', 'right': '' }
let g:lightline.tabline_subseparator = { 'left': '|', 'right': '|' }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Todo

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

" Shows indents
"set list listchars=tab:\|\ ,
"highlight Tabs ctermbg=234
"call matchadd('Tabs', '\t')

"call matchadd('ColorColumn', '\%>80v.\+')

call plug#begin('~/.vim/plugged')

Plug 'google/vim-searchindex'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jwilm/i3-vim-focus'

Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Plug 'easymotion/vim-easymotion'
"Plug 'justinmk/vim-sneak'

call plug#end()

"" <Leader>f{char} to move to {char}
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)
"noremap s s
"noremap S S

"" s{char}{char} to move to {char}{char}
"" nmap s <Plug>(easymotion-overwin-f2)

"" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)

"" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)

"" nmap s <Plug>(easymotion-s2)
"" nmap t <Plug>(easymotion-t2)

"nmap / <Plug>(easymotion-sn)
"xmap / <Esc><Plug>(easymotion-sn)\v%V
"omap / <Plug>(easymotion-tn)
"nnoremap g/ /
""let g:sneak#streak = 1
"let g:sneak#label = 1
"map f <Plug>Sneak_f
"map F <Plug>Sneak_F
"map t <Plug>Sneak_t
"map T <Plug>Sneak_T
""let g:sneak#label_esc = "\<Esc>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visuals

syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" 244
hi Normal guibg=NONE ctermbg=NONE
hi StatusLine ctermbg=232 ctermfg=241
set noshowmode
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds

"nnoremap <leader>b :ls<CR>:b<space>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF ~<CR>
nnoremap <silent> <leader>gd :Gvdiff<CR>
" nnoremap <silent> <leader>w :%s/\s\+$//gc<CR>
nnoremap <silent> <leader>w :StripWhitespace<CR>

map Y y$
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

nnoremap H gT
nnoremap L gt

nnoremap <C-J> i<CR><Esc>k$

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

nnoremap <silent> o o<Esc>
" nnoremap <silent> O O<Esc> :<C-u>execute "normal! " . v:count1 . "k"<CR>
" nnoremap <silent> O :<C-u>exe "normal! " . v:count1 . "O" \| if v:count == 0exe "normal! " . (v:count - 1) . "k" \| echo (v:count1) (v:count)<CR>
" nnoremap <silent> O O<Esc> :call <SID>o_fixer(v:count)<CR>
nnoremap <silent> O :<C-u>exe "normal! " . v:count . "O" \| :call <SID>o_fixer(v:count)<CR>
function! s:o_fixer(var)
    if a:var > 0
        :exe "normal! " . (a:var - 1) . "k"
    endif
endfunction

nmap <silent> j gj
nmap <silent> k gk

" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

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
nnoremap <silent> <leader>i :call <SID>setup_paste()<CR>i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings

filetype plugin indent on
set encoding=utf-8

set splitbelow
set splitright " Opens new panes on the right
autocmd FileType help wincmd L "Opens help pane on the right

set scrolloff=1
set sidescrolloff=5

set timeoutlen=1000 ttimeoutlen=0 " Remove ESC delay in Vim
set display+=lastline
set formatoptions+=j " Delete comment character when joining commented lines"
set autoread
set tabpagemax=50
set history=1000
set hidden
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disables comments on new lines
autocmd BufRead,BufNewFile *.md setlocal spell
set nowrap

set sessionoptions-=options
set complete-=i
set nrformats-=octal

" Numberline settings
set number
set relativenumber
set numberwidth=3

" Indent settings
set autoindent
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
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting

if !exists('g:vimpager.enabled') && &modifiable

    " Highlight text past 80 columns
    augroup colorcolumn
        au!
        au VimEnter,WinEnter * call matchadd('ColorColumn', '\%81v.\+', 100)
    augroup END

    " " Highlight trailing whitspace
    " highlight ExtraWhitespace ctermbg=red
    " augroup whitespace
    "     au!
    "     au VimEnter,WinEnter * call matchadd('ExtraWhitespace', '\s\+\%#\@<!$')
    " augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" External stuff

" Swap, backup, and undo
set directory=~/.vim/temp//
set backupdir=~/.vim/temp//
set undodir=~/.vim/undodir//
set undofile
set undolevels=100 " Limits undo level to 100, limits file size

" set clipboard=unnamed
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

" vim-tmux-nagivagor
    " let g:tmux_navigator_no_mappings = 1
    " nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
    " nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
    " nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
    " nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" map gwl :call Focus('right', 'l')<CR>
" map gwh :call Focus('left', 'h')<CR>
" map gwk :call Focus('up', 'k')<CR>
" map gwj :call Focus('down', 'j')<CR>

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
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit' }

" gitgutter
set updatetime=250

" Ranger explorer
function! RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun
map <Leader>r :call RangerExplorer()<CR>

" lightline
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'filename' ] ],
    \   'right': [ [ 'lineinfo'  ],
    \              [ 'column'  ],
    \              [ 'filetype'  ] ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'filename' ] ],
    \   'right': [ [ 'lineinfo'  ],
    \              [ 'column'  ],
    \              [ 'filetype'  ] ]
    \ },
    \ 'tabline': {
    \   'left': [ [ 'tabs' ] ],
    \   'right': []
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

" vimpager
if exists('g:vimpager.enabled')
    let g:vimpager = {}
    let g:less     = {}
    let g:less.enabled = 0
    set nonumber
    set norelativenumber
"    nunmap j
"    nunmap k
endif

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
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

" delimimate
"let delimitMate_expand_cr = 1
"let g:AutoPairsFlyMode = 1

"inoremap <CR> <CR>x<BS>
"nnoremap o ox<BS>
"nnoremap O Ox<BS>

"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'

" if &background == "dark"
"     let s:base03 = "NONE"
"     let s:base02 = "NONE"
" endif

" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'plasticboy/vim-markdown'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'raimondi/delimitmate'
" Plug 'lifepillar/vim-solarized8'
" Plug 'bling/vim-bufferline'
" Plug 'vim-airline/vim-airline'
" Plug 'powerline/powerline'
" Plug 'itchyny/lightline-powerful'
" Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'PeterRincker/vim-bumblebee'
" Plug 'jiangmiao/auto-pairs'

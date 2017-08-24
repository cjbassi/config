" call plug#begin('~/.local/share/nvim/plugged')
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'ntpeters/vim-better-whitespace'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-unimpaired'
Plug 'craigemery/vim-autotag'
Plug 'Yggdroot/indentLine'
Plug 'haya14busa/vim-asterisk'
Plug 'chrisbra/Colorizer'
Plug 'kshenoy/vim-signature'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-eunuch'
" Plug 'vim-scripts/EnhancedJumps'

Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

Plug 'google/vim-searchindex'
Plug 'haya14busa/incsearch.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-smooth-scroll'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-airline-colornum'

Plug 'edkolev/promptline.vim'

Plug 'altercation/vim-colors-solarized'

Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'sentientmachine/erics_vim_syntax_and_color_highlighting'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visuals
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

hi LineNr ctermbg=NONE ctermfg=237
hi Normal ctermbg=NONE
hi StatusLine ctermbg=232 ctermfg=241

set cursorline

let g:indentLine_color_term = 239


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <Space> <Nop>
let mapleader=" "
set notimeout
set ttimeout

map <silent> <leader>f <Plug>(easymotion-j)
map <silent> <leader>F <Plug>(easymotion-k)

nnoremap <silent> <leader>o o
nnoremap <silent> <leader>O O

nnoremap <silent> <leader>d S<Esc>

nnoremap <silent> <leader>wh :wincmd h<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>
nnoremap <silent> <leader>wk :wincmd k<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>
nnoremap <silent> <leader>wd :q<CR>
nnoremap <silent> <leader>wv :vs<CR>
nnoremap <silent> <leader>ws :split<CR>

nnoremap <silent> <leader>eal :edit ~/config/dotfiles/.aliases<CR>
nnoremap <silent> <leader>ea1 :edit ~/config/arch/arch1.sh<CR>
nnoremap <silent> <leader>ea2 :edit ~/config/arch/arch2.sh<CR>
nnoremap <silent> <leader>ea3 :edit ~/config/arch/arch3.sh<CR>
nnoremap <silent> <leader>eg :edit ~/Dropbox/notes/technology/programming_guide.md<CR>
nnoremap <silent> <leader>ep :edit ~/config/polybar/config<CR>
nnoremap <silent> <leader>ev :edit ~/config/nvim/init.vim<CR>
nnoremap <silent> <leader>ei3 :edit ~/config/i3/config<CR>
nnoremap <silent> <leader>ez :edit ~/config/dotfiles/.zshrc<CR>

nnoremap <silent> <leader>qq :qa<CR>
nnoremap <silent> <leader>qx :x<CR>:qa<CR>
nnoremap <silent> <leader>q! :q!<CR>:qa<CR>

nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>bx :w<CR>:bdelete<CR>
nnoremap <silent> <leader>bd :bdelete<CR>
nnoremap <silent> <leader>bD :bdelete!<CR>
nnoremap <silent> <leader>bf :FZF ~<CR>
nnoremap <silent> <leader>bs :w<CR>
nnoremap <silent> <leader>bS :wa<CR>
nnoremap <silent> <leader>bn :enew<CR>
nnoremap <silent> <leader>br :edit<CR>
nnoremap <silent> <leader>bm :Rename
nnoremap <silent> <leader>bM :Move

nnoremap <silent> <leader>gd :Gvdiff<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gbrowse<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <silent> <leader>gm :Gmove

nnoremap <silent> <leader>pi :source ~/config/nvim/init.vim <bar> :nohlsearch<CR>:PlugInstall<CR>
nnoremap <silent> <leader>pu :source ~/config/nvim/init.vim <bar> :nohlsearch<CR>:PlugUpdate<CR>
nnoremap <silent> <leader>pc :source ~/config/nvim/init.vim <bar> :nohlsearch<CR>:PlugClean<CR>

nnoremap <silent> <leader>ts :set spell!<CR>
nnoremap <silent> <leader>tw :set wrap!<CR>
nnoremap <silent> <leader>tW :StripWhitespace<CR>
" nnoremap <silent> <leader>th :nohlsearch<CR>
nnoremap <leader>th :tab help 
nnoremap <silent> <leader>tr :retab<CR>
noremap <silent> <leader>tf :call Format()<CR>
nnoremap <silent> <leader>tt :Tags<CR>
nnoremap <silent> <leader>tl :LivedownToggle<CR>
nnoremap <silent> <leader>tc :ColorToggle<CR>

function! Format()
    if &ft == 'mail'
        :exe "normal! " . "gggqG\<C-o>\<C-o>"
    else
        :Autoformat<CR>
    endif
endfunction

map q: <Nop>
map * <Plug>(asterisk-z*)
map # <Nop>
map <Enter> <Nop>
map <Backspace> <Nop>

nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
nnoremap s "_s
vnoremap s "_s
nnoremap S "_S
vnoremap S "_S

nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

" Paste over word without yanking it {
function! RestoreRegister()
    let @" = s:restore_reg
    if &clipboard == "unnamedplus"
        let @+ = s:restore_reg
    endif
    return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()
" }

map Y y$
nnoremap Q @@
" nnoremap <silent> <C-l> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
nnoremap <silent> <C-l> zz
nnoremap <silent> \ :nohlsearch<CR>

nnoremap H gT
nnoremap L gt

nnoremap <C-J> i<CR><Esc>k$

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

nnoremap <silent> o o<Esc>

nnoremap <silent> O :<C-u>exe "normal! " . v:count . "O" \| :call O_fixer(v:count)<CR>
function! O_fixer(count)
    if a:count > 0
        :exe "normal! " . (a:count - 1) . "k"
    endif
endfunction

nmap <silent> j gj
nmap <silent> k gk

nnoremap <silent> gG G

" allows incsearch highlighting for range commands
cnoremap $y <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
set encoding=utf-8

set lazyredraw
set nostartofline

autocmd VimResized * wincmd =

set splitbelow
set splitright
" cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

set scrolloff=1
set sidescrolloff=5

set timeoutlen=1000 ttimeoutlen=0 " Remove ESC delay in Vim

set noshowmode
set noshowcmd

set linebreak
set display+=lastline
set formatoptions+=j " Delete comment character when joining commented lines"
set autoread
set tabpagemax=50
set history=1000
set hidden
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disables comments on new lines

autocmd BufRead,BufNewFile *.md,*.txt
            \ let b:indentLine_enabled = 0 |
            " if &modifiable
            "     \ setlocal spell |
            " fi

            " \ let b:cursorword = 1 |

set nowrapscan

set foldmethod=indent
set nofoldenable

set spellcapcheck=

set sessionoptions-=options
set complete-=i
set nrformats-=octal

set number
" set numberwidth=4

set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

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

if !exists('g:vimpager.enabled') && &modifiable

    " Highlight text past 80 columns
    augroup colorcolumn
        au!
        au VimEnter,WinEnter * call matchadd('ColorColumn', '\%81v.\+', 100)
    augroup END

endif

" Swap, backup, and undo
set directory=~/.config/nvim/swap//
set backupdir=~/.config/nvim/backup//
set undodir=~/.config/nvim/undo//
set undofile
" set undolevels=100 " Limits undo level to 100, limits file size

" set clipboard=unnamed
set clipboard=unnamedplus


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smooth scroll

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 4)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 4)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 8)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 8)<CR>


" Airline

let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse = 0
let g:airline_theme='powerlineish'

let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_nr = 1

let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline_section_y = airline#section#create([' ', '%02c'])
let g:airline_section_z = airline#section#create(['☰  ', "%{printf('%03d/%03d', line('.'),  line('$'))}"])

let airline#extensions#promptline#snapshot_file = "~/.promptline.sh"
let g:airline#extensions#promptline#enabled = 1


" Promptline

let g:promptline_preset = {
        \'a' : [ promptline#slices#host({ 'only_if_ssh': 1 }) ],
        \'b' : [ promptline#slices#cwd() ],
        \'c' : [ promptline#slices#jobs() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'z' : [ promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
" PromptlineSnapshot! ~/config/dotfiles/.promptline.sh airline


" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_echo_current_error = 0


" FZF

" set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND = 'sudo ag --hidden --ignore .git -g ""'
let $FZF_DEFAULT_OPTS='--height 40% --reverse --border --preview "head -100 {}"'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit' }

function! s:fzf_statusline()
  " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=233
    highlight fzf2 ctermfg=246 ctermbg=233
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fzf
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()


" gitgutter

set updatetime=250


" vimpager

if exists('g:vimpager.enabled')
    let g:vimpager = {}
    let g:less     = {}
    let g:less.enabled = 0

    let g:indentLine_enabled = 0

    set nonumber
    set norelativenumber
    " unmap j
    " unmap k
endif

" incsearch.vim

map ? <Nop>
map / <Plug>(incsearch-stay)


" easymotion

map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)
"nmap f <Plug>(easymotion-overwin-f2)

map t <Plug>(easymotion-t)
map T <Plug>(easymotion-T)


" vim-operator-flashy

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Old stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if has('path_extra')
"     setglobal tags-=./tags tags-=./tags; tags^=./tags;
" endif
" if !empty(&viminfo)
"     set viminfo^=!
" endif
" Load matchit.vim, but only if the user hasn't installed a newer version.
" if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
"     runtime! macros/matchit.vim
" endif

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
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'itchyny/lightline.vim'
" Plug 'yonchu/accelerated-smooth-scroll'

" nnoremap <silent> O O<Esc> :<C-u>execute "normal! " . v:count1 . "k"<CR>
" nnoremap <silent> O :<C-u>exe "normal! " . v:count1 . "O" \| if v:count == 0exe "normal! " . (v:count - 1) . "k" \| echo (v:count1) (v:count)<CR>
" nnoremap <silent> O O<Esc> :call <SID>o_fixer(v:count)<CR>

" " lightline
" let g:lightline = {
"     \ 'active': {
"     \   'left': [
"     \               [ 'mode', 'paste' ],
"     \               [ 'gitbranch', 'filename' ],
"     \               [ 'syntastic' ],
"     \   ],
"     \   'right': [
"     \               [ 'lineinfo'  ],
"     \               [ 'column'  ],
"     \               [ 'filetype'  ],
"     \   ],
"     \ },
"     \ 'inactive': {
"     \   'left': [
"     \               [ 'mode', 'paste' ],
"     \               [ 'gitbranch', 'filename' ],
"     \   ],
"     \   'right': [
"     \               [ 'lineinfo'  ],
"     \               [ 'column'  ],
"     \               [ 'filetype'  ],
"     \   ],
"     \ },
"     \ 'tabline': {
"     \   'left': [
"     \               [ 'tabs' ],
"     \   ],
"     \   'right': [
"     \   ],
"     \ },
"     \ 'component_function': {
"     \   'filename': 'LightlineFilename',
"     \   'gitbranch': 'fugitive#head',
"     \   'syntastic': 'SyntasticError',
"     \ },
"     \ 'component': {
"     \   'lineinfo': "%{printf('%03d/%03d', line('.'),  line('$'))}",
"     \   'column': '%02c',
"     \ },
"     \ }
" function! LightlineFilename()
"     let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
"     let modified = &modified ? ' +' : ''
"     return filename . modified
" endfunction

" function! s:setup_paste() abort
"     let s:paste = &paste
"     set paste
"     augroup unimpaired_paste
"         autocmd!
"         autocmd InsertLeave *
"             \ if exists('s:paste') |
"             \   let &paste = s:paste |
"             \   unlet s:paste |
"             \ endif |
"             \ autocmd! unimpaired_paste
"     augroup END
" endfunction
" nnoremap <silent> <Plug>unimpairedPaste :call <SID>setup_paste()<CR>
" nnoremap <silent> <leader>i :call <SID>setup_paste()<CR>i

" let g:indentLine_bgcolor_term = 202

" let g:powerline_pycmd = "py3"
" set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim


" let g:ac_smooth_scroll_du_sleep_time_msec=0
" let g:ac_smooth_scroll_fb_sleep_time_msec=0
" let g:ac_smooth_scroll_enable_accelerating=0

" let g:EasyOperator_line_do_mapping = 0

" map <Leader>l  <Plug>(easyoperator-line-select)
" map <Leader>dl <Plug>(easyoperator-line-delete)
" map <Leader>pl <Plug>(easyoperator-line-yank)

" let g:easytags_events = ['BufWritePost']

" " Ranger explorer
" function! RangerExplorer()
"     exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
"     if filereadable('/tmp/vim_ranger_current_file')
"         exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
"         call system('rm /tmp/vim_ranger_current_file')
"     endif
"     redraw!
" endfun

" nnoremap <silent> S ddkA<Enter>
" nnoremap <silent> o :call Forward_line(v:count)<CR>
" function! Forward_line(count) abort
"    :exe "normal! " . "A"i
" endfunction

" function! IndentWithI()
"     if len(getline('.')) == 0
"         return "\"_cc"
"     else
"         return "i"
"     endif
" endfunction
" nnoremap <expr> i IndentWithI()

" syn match myExCapitalWords +\<\w*[A-Z]\K*\>+ contains=@NoSpell
" syn match myExCapitalWords +\<\w*[A-Z]\K*\>\|'s+ contains=@NoSpell

" Ignore CamelCase words when spell checking
" fun! IgnoreCamelCaseSpell()
"   syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
"   syn cluster Spell add=CamelCase
" endfun
" autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()

    " " Highlight trailing whitspace
    " highlight ExtraWhitespace ctermbg=red
    " augroup whitespace
    "     au!
    "     au VimEnter,WinEnter * call matchadd('ExtraWhitespace', '\s\+\%#\@<!$')
    " augroup END

" let g:fzf_buffers_jump = 1

" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }

" nnoremap d "_d
" vnoremap d "_d
" nnoremap D "_D
" vnoremap D "_D

" nnoremap <Tab> i<Tab><Esc>

" Plug 'itchyny/vim-cursorword'

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'ntpeters/vim-better-whitespace'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'shime/vim-livedown'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-unimpaired'
Plug 'craigemery/vim-autotag'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/vim-cursorword'
Plug 'haya14busa/vim-asterisk'
Plug 'ap/vim-css-color'

Plug 'google/vim-searchindex'
Plug 'haya14busa/incsearch.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-smooth-scroll'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-airline-colornum'
Plug 'edkolev/promptline.vim'
Plug 'altercation/vim-colors-solarized'

Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

" Plug '~/Dropbox/projects/vim-airline-colornum'

call plug#end()

map <Leader>f <Plug>(easymotion-j)
map <Leader>F <Plug>(easymotion-k)

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$


nnoremap <silent> gwh :wincmd h<CR>
nnoremap <silent> gwj :wincmd j<CR>
nnoremap <silent> gwk :wincmd k<CR>
nnoremap <silent> gwl :wincmd l<CR>

set notimeout
set ttimeout

let g:indentLine_color_term = 239
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

nmap <silent> <C-p> :LivedownToggle<CR>

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 4)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 4)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 8)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 8)<CR>


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

map Q <Nop>
map q: <Nop>
map * <Plug>(asterisk-z*)
map # <Nop>
map <Enter> <Nop>
map <Backspace> <Nop>

" nnoremap d "_d
" vnoremap d "_d
" nnoremap D "_D
" vnoremap D "_D
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

noremap zh zH
noremap zl zL


" Ranger explorer
function! RangerExplorer()
    exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
    if filereadable('/tmp/vim_ranger_current_file')
        exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
        call system('rm /tmp/vim_ranger_current_file')
    endif
    redraw!
endfun

"nnoremap <leader>b :ls<CR>:b<space>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>c :bdelete<CR>
nnoremap <silent> <leader>d :Gvdiff<CR>
nnoremap <silent> <leader>e :FZF ~<CR>
" nnoremap <silent> <leader>w :%s/\s\+$//gc<CR>
nnoremap <silent> <leader>i :source /home/cjbassi/.vimrc <bar> :nohlsearch<CR>:PlugInstall<CR>
" nnoremap <silent> <Leader>r :call RangerExplorer()<CR>
nnoremap <silent> <Leader>r :terminal ranger<CR>
nnoremap <silent> <leader>s :StripWhitespace<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>v :source /home/cjbassi/.vimrc<CR>
nnoremap <silent> <leader>w :set wrap!<CR>

map Y y$
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

nnoremap H gT
nnoremap L gt

nnoremap <C-J> i<CR><Esc>k$

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

nnoremap <silent> o o<Esc>

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

nnoremap <Tab> I<Tab><Esc>

nnoremap <silent> O :<C-u>exe "normal! " . v:count . "O" \| :call O_fixer(v:count)<CR>
function! O_fixer(count)
    if a:count > 0
        :exe "normal! " . (a:count - 1) . "k"
    endif
endfunction

nmap <silent> j gj
nmap <silent> k gk

" allows incsearch highlighting for range commands
cnoremap $y <CR>:t''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $d <CR>:d<CR>``

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings

filetype plugin indent on
set encoding=utf-8

autocmd VimResized * wincmd =

set splitbelow
set splitright " Opens new panes on the right
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

set scrolloff=1
set sidescrolloff=5

set linebreak
set timeoutlen=1000 ttimeoutlen=0 " Remove ESC delay in Vim
set display+=lastline
set formatoptions+=j " Delete comment character when joining commented lines"
set autoread
set tabpagemax=50
set history=1000
set hidden
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disables comments on new lines

autocmd BufRead,BufNewFile *.md,*.txt
            \ let b:indentLine_enabled = 0 |
            \ let b:cursorword = 1 |
            \ setlocal spell |

set noshowcmd

set foldmethod=indent
set nofoldenable

" syn match myExCapitalWords +\<\w*[A-Z]\K*\>+ contains=@NoSpell
" syn match myExCapitalWords +\<\w*[A-Z]\K*\>\|'s+ contains=@NoSpell

" Ignore CamelCase words when spell checking
" fun! IgnoreCamelCaseSpell()
"   syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
"   syn cluster Spell add=CamelCase
" endfun
" autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()

set spellcapcheck=

set sessionoptions-=options
set complete-=i
set nrformats-=octal

" Numberline settings
set number
" set relativenumber
set numberwidth=4

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
set directory=~/.config/nvim/swap//
set backupdir=~/.config/nvim/backup//
set undodir=~/.config/nvim/undo//
set undofile
" set undolevels=100 " Limits undo level to 100, limits file size

" set clipboard=unnamed
set clipboard=unnamedplus

" execute "set <M-h>=\eh"
" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"
" execute "set <M-l>=\el"

inoremap è <Esc>h
inoremap ê <Esc>j
inoremap ë <Esc>k
inoremap ì <Esc>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings

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

let g:promptline_preset = {
        \'b' : [ promptline#slices#cwd() ],
        \'c' : [ promptline#slices#jobs() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'z' : [ promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}



" nnoremap <silent> <M-h> :echo "hi"<CR>
" nnoremap <silent> <M-j> :echo "hi"<CR>
" nnoremap <silent> <M-k> :echo "hi"<CR>
" nnoremap <silent> <M-l> :echo "hi"<CR>




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
let g:syntastic_auto_jump = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_echo_current_error = 0

" function! SyntasticError() abort
"   if exists('b:syntastic_loclist') && has_key(b:syntastic_loclist, 'errors') && len(b:syntastic_loclist.errors())
"     return substitute(substitute(substitute(substitute(b:syntastic_loclist.errors()[0].text, '%', '%%', 'g'), '\[Char\]', 'String', 'g'), '\%(note: \|\(.*unable to load package\|In the second argument of\|Declared at: \| or explicitly provide\).*\|‘\|’\|Perhaps you .*\| (imported from[^)]*)\|(visible) \|It could refer to either.*\|It is a member of the .*\|In the expression:.*\|Probable cause:.*\|GHC\.\w\+\.\|In the [a-z]\+ argument of.*\|integer-gmp:\|Data\.\w\+\.\)', '', 'g'), 'Found\zs:.*\zeWhy not:', '. ', '')
"   endif
"   return ''
" endfunction

" function! SyntasticWarning() abort
"   if exists('b:syntastic_loclist') && has_key(b:syntastic_loclist, 'warnings') && has_key(b:syntastic_loclist, 'errors')
"         \ && len(b:syntastic_loclist.warnings()) && !len(b:syntastic_loclist.errors())
"     return substitute(substitute(substitute(substitute(substitute(b:syntastic_loclist.warnings()[0].text, '%', '%%', 'g'), '\[Char\]', 'String', 'g'), '\.hs:\d\+:\d\+-\d\+\zs.*', '', ''), '\(\(Defaulting the following constraint\|: Patterns not matched\| except perhaps to import instances from \).*\|forall [a-z]\. \|GHC\.\w\+\.\|integer-gmp:\|Data\.\w\+\.\)', '', 'g'), 'Found\zs:.*\zeWhy not:', '. ', '')
"   endif
"   return ''
" endfunction



" FZF
" set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND = 'sudo ag --hidden --ignore .git -g ""'
let $FZF_DEFAULT_OPTS='--height 40% --reverse --border --preview "head -100 {}"'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit' }

" let g:fzf_buffers_jump = 1

" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }

function! s:fzf_statusline()
  " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=233
    highlight fzf2 ctermfg=246 ctermbg=233
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fzf
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" gitgutter
set updatetime=250

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
"nmap f <Plug>(easymotion-overwin-f2)
map F <Plug>(easymotion-F)

map t <Plug>(easymotion-t)
map T <Plug>(easymotion-T)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Todo

" if has('path_extra')
"     setglobal tags-=./tags tags-=./tags; tags^=./tags;
" endif
" if !empty(&viminfo)
"     set viminfo^=!
" endif
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
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'itchyny/lightline.vim'
" Plug 'yonchu/accelerated-smooth-scroll'

" nnoremap <silent> O O<Esc> :<C-u>execute "normal! " . v:count1 . "k"<CR>
" nnoremap <silent> O :<C-u>exe "normal! " . v:count1 . "O" \| if v:count == 0exe "normal! " . (v:count - 1) . "k" \| echo (v:count1) (v:count)<CR>
" nnoremap <silent> O O<Esc> :call <SID>o_fixer(v:count)<CR>

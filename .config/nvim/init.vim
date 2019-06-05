" Plugins {{{1

call plug#begin('~/.local/share/nvim/plugged')

" closers {{{2

" Plug 'tpope/vim-endwise'
" Plug 'ozelentok/vim-closer'

" editing {{{2

Plug 'matze/vim-move'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'

" folding {{{2

Plug 'nelstrom/vim-markdown-folding'
Plug 'matze/vim-ini-fold'
Plug 'benknoble/vim-auto-origami'
Plug 'tmhedberg/SimpylFold'
Plug 'digitalrounin/vim-yaml-folds'
Plug 'cjbassi/improved-foldtext.vim'
" Plug 'Konfekt/FastFold'

" formatting/linting {{{2

Plug 'editorconfig/editorconfig-vim'

" fzf {{{2

Plug 'junegunn/fzf.vim'

" Git {{{2

Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/github-complete.vim'

" Markdown {{{2

Plug 'dkarter/bullets.vim' " for toggling checkboxes

" motion {{{2

Plug 'terryma/vim-smooth-scroll'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-edgemotion'
Plug 'justinmk/vim-ipmotion'

" searching {{{2

" Plug 'haya14busa/vim-asterisk'
" Plug 'google/vim-searchindex'

" snippets {{{2

Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" syntax {{{2

Plug 'plasticboy/vim-markdown'
Plug 'chr4/nginx.vim'
Plug 'rhysd/vim-gfm-syntax'  " GitHub markdown
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
" Plug 'joeky888/Global.vim'

" Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'mboughaba/i3config.vim'
Plug 'cjbassi/i3-vim-syntax'

" textobjects {{{2

Plug 'kana/vim-textobj-user'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'coderifous/textobj-word-column.vim'
  Plug 'kana/vim-textobj-entire'
  Plug 'glts/vim-textobj-comment'
  Plug 'kana/vim-textobj-function'

" utilities {{{2

Plug 'farmergreg/vim-lastplace'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-unimpaired'
Plug 'mbbill/undotree'
Plug 'tpope/vim-eunuch'  " unix tools
Plug 'cjbassi/fullscreen-help.vim'
Plug 'cjbassi/cursor-stop.vim'

" visuals {{{2

" Plug 'whatyouhide/vim-lengthmatters'
Plug 'ntpeters/vim-better-whitespace'
Plug 'chrisbra/Colorizer'
Plug 'kshenoy/vim-signature'  " shows marks
Plug 'chriskempson/base16-vim'
Plug 'kana/vim-operator-user'
  Plug 'haya14busa/vim-operator-flashy'
Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ntpeters/vim-airline-colornum'

" }}}

call plug#end()

" Visuals {{{1

syntax enable

set background=dark
set termguicolors

colorscheme base16-solarized-dark

" changes some default colors for base16-solarized
call g:Base16hi("String",         "2aa198", "", "", "", "", "")
call g:Base16hi("Identifier",     "268bd2", "", "", "", "", "")
call g:Base16hi("Statement",      "b58900", "", "", "", "NONE", "") " bolded
call g:Base16hi("Type",           "268bd2", "", "", "", "", "")
call g:Base16hi("Special",        "dc322f", "", "", "", "", "")
call g:Base16hi("Delimiter",      "dc322f", "", "", "", "", "")
call g:Base16hi("Conditional",    "859900", "", "", "", "", "")
call g:Base16hi("Keyword",        "859900", "", "", "", "", "")
call g:Base16hi("Todo",           "d33682", "NONE", "", "", "Bold", "")

call g:Base16hi("Error",          "dc322f", "", "", "", "", "")

call g:Base16hi("pythonOperator", "859900", "", "", "", "", "")
call g:Base16hi("pythonRepeat",   "859900", "", "", "", "", "")
call g:Base16hi("pythonInclude",  "859900", "", "", "", "", "")
call g:Base16hi("pythonStatement","859900", "", "", "", "", "")

set cursorline

hi EndOfBuffer guifg=bg

" TODO
hi javaScript ctermfg=244 guifg=244

" highlights shebang
autocmd FileType * syn match Shebang "\%^#!.*$"
hi Shebang guifg=#cb4b16

" highlight jsonc comments
autocmd FileType json syntax match Comment +\/\/.\+$+


" Keybinds {{{1

map Y y$
nnoremap <silent> gG G
nnoremap Q @q
" updates diffs, clears statusline, clears highlights
nnoremap <silent> , :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

nnoremap <silent> j gj
nnoremap <silent> k gk

" keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" nnoremap <silent> <C-S-h> :wincmd H<CR>
" nnoremap <silent> <C-S-j> :wincmd J<CR>
" nnoremap <silent> <C-S-k> :wincmd K<CR>
" nnoremap <silent> <C-S-l> :wincmd L<CR>


" leader {{{2

map <Space> <Nop>
let mapleader=" "
set notimeout
set ttimeout

" for searching man pages
nnoremap <leader>/ /\C^\s*

noremap <leader>: :<C-f>i

nnoremap <leader>j i<CR><Esc>k$hl
nnoremap <leader>k J
nnoremap <leader>K Jx

nnoremap <silent> <leader>c :q<CR>

nnoremap <silent> <leader>S :SudoEdit<bar>nnoremap <buffer> <silent> <leader>w :SudoWrite<CR>

nnoremap <silent> <leader>tc :ToggleCheckbox<CR>
nnoremap <silent> <leader>tC :ColorToggle<CR>
nnoremap <leader>th :Help<Space>
nnoremap <leader>tr :%s/
nnoremap <silent> <leader>ts :silent ! ws '%' &<CR>
nnoremap <silent> <leader>tu :UndotreeToggle<CR>
nnoremap <leader>tU :UltiSnipsEdit<Space>
nnoremap <silent> <leader>tv :source ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>tw :set wrap!<CR>
nnoremap <silent> <leader>tx :Chmod +x<CR>


" buffers {{{3

nnoremap <silent> <leader>bx :w<CR>:Bclose<CR>
nnoremap <silent> <leader>bd :Bclose<CR>
nnoremap <silent> <leader>bD :Bclose!<CR>
nnoremap <silent> <leader>bf :FZF<CR>
nnoremap <silent> <leader>bF :FZF ~<CR>
nnoremap <silent> <leader>bn :enew<CR>
nnoremap <silent> <leader>br :edit<CR>
nnoremap <leader>bm :Rename<Space>
nnoremap <leader>bM :Move<Space>


" write/quit {{{3

noremap <silent> <C-s> :silent w<CR>
nnoremap <silent> <leader>q :qa<CR>
nnoremap <silent> <leader>C :cq<CR>
nnoremap <silent> <leader>x :silent w<CR>:qa<CR>
nnoremap <silent> <leader>! :Bclose!<CR>:qa<CR>

nnoremap <silent> <leader>w :silent w<CR>zv
nnoremap <silent> <leader>W :silent wa<CR>


" editing {{{3

nnoremap <silent> <leader>o o
nnoremap <silent> <leader>O O

nnoremap <silent> <leader>d S<Esc>

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>


" movement {{{3

map <silent> <leader>f <Plug>(easymotion-j)
map <silent> <leader>F <Plug>(easymotion-k)

" previous buffer
nnoremap <silent> <Tab> :b#<CR>

nnoremap <silent> <leader>l :Lines<CR>


" files {{{3

nnoremap <silent> <leader>ebr :edit ~/config/.config/waybar/style.css<CR> :edit ~/config/.config/waybar/config<CR>
nnoremap <silent> <leader>eec :edit ~/config/dotfiles/.editorconfig<CR>
nnoremap <silent> <leader>eer :edit ~/config/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>egc :edit ~/config/.config/git/config<CR>
nnoremap <silent> <leader>ei1 :edit ~/config/installation/install1.sh<CR>
nnoremap <silent> <leader>ei2 :edit ~/config/installation/install2.sh<CR>
nnoremap <silent> <leader>ei3 :edit ~/config/installation/install3.sh<CR>
nnoremap <silent> <leader>esc :edit ~/config/other/shell/commands.fish<CR>
nnoremap <silent> <leader>ese :edit ~/config/other/shell/env.sh<CR>
nnoremap <silent> <leader>esr :edit ~/config/.config/fish/config.fish<CR>
nnoremap <silent> <leader>etr :edit ~/config/.config/alacritty/alacritty.yml<CR>
nnoremap <silent> <leader>ewr :edit ~/config/.config/sway/config<CR>

nnoremap <silent> <leader>eM :edit Makefile<CR>


" git {{{3

nnoremap <silent> <leader>gd :Gvdiff<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gbrowse<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <leader>gm :Gmove<Space>


" vim-plug {{{3

nnoremap <silent> <leader>pi :source ~/.config/nvim/init.vim <bar> :nohlsearch<CR>:PlugInstall<CR>
nnoremap <silent> <leader>pu :source ~/.config/nvim/init.vim <bar> :nohlsearch<CR>:PlugUpdate<CR>
nnoremap <silent> <leader>pc :source ~/.config/nvim/init.vim <bar> :nohlsearch<CR>:PlugClean<CR>


" }}}

" unmaps {{{2

autocmd VimEnter * map # <Nop>
autocmd VimEnter * map ? <Nop>
autocmd VimEnter * map q: <Nop>
autocmd VimEnter * map <Enter> <Nop>
autocmd VimEnter * map <Backspace> <Nop>


" prevent yanking {{{2

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

" pasting over something doesn't yank it
xnoremap p pgvy


" o and O {{{2

" 'o' and 'O' add lines without inserting

nnoremap <silent> o o<Esc>

nnoremap <silent> O :<C-u>exe "normal! " . v:count . "O" \| :call O_fixer(v:count)<CR>
function! O_fixer(count)
  if a:count > 0
    :exe "normal! " . (a:count - 1) . "k"
  endif
endfunction


" centering screen {{{2

noremap <silent> ; zz

noremap zj zjzz
noremap zk zkzz
noremap zv zvzz
noremap zM zMzz
noremap zm zmzz

" }}}

" Settings {{{1

filetype plugin indent on

set encoding=utf-8

set mouse=a

set laststatus=2

" Completion window height
set pumheight=10

" TODO
" set concealcursor = "nc"
" set conceallevel=0

" startup message, n and N, and file info on load
set shortmess=IsF

" screen movement commands don't move cursor to start of line
set nostartofline

set splitbelow
set splitright

" how many lines from end of screen to start scrolling
set scrolloff=1
set sidescrolloff=5

" for search and replace incrementally
set inccommand=nosplit

" Remove ESC delay in Vim
set timeoutlen=1000 ttimeoutlen=0

set noshowmode
set noshowcmd
set noruler

" Wraps lines on linebreak
set linebreak

" TODO
set display+=lastline

" Delete comment character when joining commented lines"
set formatoptions+=j
set autoread
set tabpagemax=50
set history=1000
set hidden

set clipboard=unnamedplus

" Spell checking doesn't check capitalization
set spellcapcheck=

set sessionoptions-=options
set complete-=i
set nrformats-=octal

set nowrap

set iskeyword-=_
" set iskeyword="a-z" TODO

autocmd FileType PKGBUILD setlocal ft=sh
autocmd BufNewFile,BufRead *.service set filetype=systemd
autocmd FileType plaintex setlocal ft=tex
autocmd BufNewFile,BufRead *.ts,*.tsx set filetype=javascript.jsx

autocmd FileType markdown setlocal spell

" Disables comments on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Resizes window splits on vim resize
autocmd VimResized,TabEnter * wincmd =

" TODO
" autocmd VimResized normal ,


" diff {{{2

if &diff
  highlight! link DiffText MatchParen
endif

set diffopt+=vertical


" folding {{{2

set foldenable

set foldmethod=marker
autocmd FileType go,c,cpp,java,javascript setlocal foldmethod=syntax
autocmd FileType * normal zR

set foldcolumn=2
set foldlevel=0
set foldnestmax=1

set foldminlines=0

" TODO
" autocmd InsertLeave,WinEnter * let &l:foldmethod=g:oldfoldmethod
" autocmd InsertEnter,WinLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod=manual

" set foldclose=all
" set foldopen=all

" autocmd BufReadPost * normal zR

" noremap zk zczkza

nnoremap <silent> z] :<C-u>silent! normal! zc<CR>zjzozz
nnoremap <silent> z[ :<C-u>silent! normal! zc<CR>zkzo[zzz

" TODO
" autocmd BufRead * normal zv;

" autocmd FileType * normal! zv
" autocmd BufReadPre,FileReadPre * normal! zv


" numberline {{{2

set number
set numberwidth=4


" indent {{{2

set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround


" searching {{{2

set incsearch
set ignorecase
set smartcase
set hlsearch
set nowrapscan


" wildmenu {{{2

set wildmode=longest:full,full
set wildmenu
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*


" swap, backup, and undo {{{2

set directory=~/.local/state/nvim/swap//
set backupdir=~/.local/state/nvim/backup//
set undodir=~/.local/state/nvim/undo//
set undofile

" }}}

" Plugin Settings {{{1

" Bullets.vim {{{2

let g:bullets_set_mappings = 0


" fzf {{{2

let $FZF_DEFAULT_COMMAND = 'fd -H --type f'

imap <C-f> <plug>(fzf-complete-path)

let g:fzf_layout = { 'down': '40%' }
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

function! s:fzf_statusline()
  highlight fzf1 guifg=normal guibg=#002b36
  highlight fzf2 guifg=normal guibg=#002b36
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fzf
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

let g:fzf_colors =
      \ { 'fg':      ['#839496'],
      \ 'bg':      ['#002b36'],
      \ 'hl':      ['#268bd2'],
      \ 'fg+':     ['#eee8d5'],
      \ 'bg+':     ['#073642'],
      \ 'hl+':     ['#268bd2'],
      \ 'info':    ['#b58900'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['#b58900'],
      \ 'pointer': ['#2aa198'],
      \ 'marker':  ['#2aa198'],
      \ 'spinner': ['#2aa198'],
      \ 'header':  ['#268bd2'] }


" overlength.vim {{{2

let overlength#default_overlength = 80
let g:overlength#default_to_textwidth = 0

" autocmd FileType man call overlength#toggle()
" autocmd FileType markdown call overlength#toggle()
" autocmd FileType text call overlength#toggle()


" UltiSnips {{{2

let g:UltiSnipsExpandTrigger =          "<tab>"
let g:UltiSnipsJumpForwardTrigger =     "<C-l>"
let g:UltiSnipsJumpBackwardTrigger =    "<C-h>"
" let g:UltiSnipsListSnippets =           "<C-s>"

let g:snips_author = "cjbassi"

let g:ultisnips_python_style = "google"

let g:ultisnips_javascript = {
      \ 'semi': 'never',
      \ }

autocmd FileType snippets set foldlevel=0


" vim-airline {{{2

let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse = 0
let g:airline_theme='solarized'
" let g:airline_theme='base16_solarized'
let g:airline_solarized_bg='dark'
" let g:solarized_base16=1

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
let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'y', 'z', 'error', 'warning' ]
      \ ]


" let g:airline_section_c = airline#section#create(['%{expand ("%:~")}'])
" let g:airline_section_c = airline#section#create(['%{system(\'pwd\')}'])

let g:airline_section_y = airline#section#create([' ', '%02c'])
let g:airline_section_z = airline#section#create(['☰  ', "%{printf('%03d/%03d', line('.'),  line('$'))}"])

let airline#extensions#promptline#snapshot_file = "~/.promptline.sh"
let g:airline#extensions#promptline#enabled = 1


" vim-asterisk{{{2

" map *  <Plug>(asterisk-z*)
" map g* <Plug>(asterisk-gz*)


" vim-auto-origami {{{2

augroup autofoldcolumn
  au!
  au FileWritePost,BufWinEnter * let &foldcolumn = auto_origami#Foldcolumn()
augroup END


" vim-easy-align {{{2

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" vim-easymotion {{{2

map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)

map t <Plug>(easymotion-t)
map T <Plug>(easymotion-T)


" vim-gitgutter {{{2

set updatetime=250

" unmaps leader keys
let g:gitgutter_map_keys = 0

highlight GitGutterAdd guibg=#073642
highlight GitGutterChange guibg=#073642
highlight GitGutterDelete guibg=#073642
highlight GitGutterChangeDelete guibg=#073642

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hS <Plug>GitGutterUndoHunk

nmap <Leader>hd <Plug>GitGutterPreviewHunk

omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual


" vim-ipmotion {{{2

let g:ip_skipfold=1


" vim-json {{{2

let g:vim_json_syntax_conceal = 0
let g:vim_json_warnings=0


" vim-lastplace {{{2

let g:lastplace_open_folds = 0


" vim-markdown {{{2

let g:vim_markdown_conceal = 0

" including java makes spelling not work
let g:markdown_fenced_languages = ['html', 'cpp', 'python', 'bash=sh']

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0


" vim-markdown-folding {{{2

let g:markdown_fold_style = 'nested'


" vim-move {{{2

let g:move_key_modifier = 'S'


" vim-operator-flashy{{{2

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

let g:operator#flashy#group = get(g:, 'operator#flashy#group', 'TermCursor')


" vim-signature  {{{2

let g:SignatureMap = {
      \ 'Leader'             :  "m",
      \ 'PlaceNextMark'      :  "m,",
      \ 'ToggleMarkAtLine'   :  "m.",
      \ 'PurgeMarksAtLine'   :  "m-",
      \ 'DeleteMark'         :  "dm",
      \ 'PurgeMarks'         :  "m<Space>",
      \ 'PurgeMarkers'       :  "m<BS>",
      \ 'GotoNextLineAlpha'  :  "",
      \ 'GotoPrevLineAlpha'  :  "",
      \ 'GotoNextSpotAlpha'  :  "`]",
      \ 'GotoPrevSpotAlpha'  :  "`[",
      \ 'GotoNextLineByPos'  :  "]'",
      \ 'GotoPrevLineByPos'  :  "['",
      \ 'GotoNextSpotByPos'  :  "]`",
      \ 'GotoPrevSpotByPos'  :  "[`",
      \ 'GotoNextMarker'     :  "]-",
      \ 'GotoPrevMarker'     :  "[-",
      \ 'GotoNextMarkerAny'  :  "]=",
      \ 'GotoPrevMarkerAny'  :  "[=",
      \ 'ListBufferMarks'    :  "m/",
      \ 'ListBufferMarkers'  :  "m?"
      \ }


" vim-smooth-scroll {{{2

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 4)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 4)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 8)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 8)<CR>


" vim-textobj-comment {{{2

let g:textobj_comment_no_default_key_mappings = 1

xmap ax <Plug>(textobj-comment-a)
omap ax <Plug>(textobj-comment-a)

xmap ix <Plug>(textobj-comment-i)
omap ix <Plug>(textobj-comment-i)

xmap aX <Plug>(textobj-comment-big-a)
omap aX <Plug>(textobj-comment-big-a)


" vim-vertical-move {{{2

map [v <Plug>(edgemotion-k)
map ]v <Plug>(edgemotion-j)

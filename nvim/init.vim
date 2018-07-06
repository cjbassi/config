" Plugins {{{1

call plug#begin('~/.local/share/nvim/plugged')

" todo {{{2

Plug 'lervag/vimtex'

Plug '~/drive/programming/jumplist-contained.vim'

" Plug 'LucHermitte/VimFold4C'

" Plug 'OmniSharp/omnisharp-vim'
" , { 'dir': '~/.local/share/nvim/plugged/omnisharp-vim/server', 'do': 'msbuild' }

" Plug 'tpope/vim-sleuth'

Plug 'Shougo/echodoc.vim'

" Plug 'Konfekt/FastFold'

Plug 'google/vim-searchindex'

" Plug 'sentientmachine/erics_vim_syntax_and_color_highlighting'

" Plug 'j16180339887/Global.vim'


" closers {{{2

Plug 'tpope/vim-endwise'
Plug 'ozelentok/vim-closer'


" completion {{{2

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Rip-Rip/clang_complete'
Plug 'zchee/deoplete-jedi'
Plug 'racer-rust/vim-racer'
Plug 'Shougo/neco-vim'


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


" formatting/linting {{{2

" Plug 'w0rp/ale'

Plug 'Chiel92/vim-autoformat'

Plug 'Vimjas/vim-python-pep8-indent'

Plug 'editorconfig/editorconfig-vim'


" fzf {{{2

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" Git {{{2

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'airblade/vim-gitgutter'

Plug 'rhysd/github-complete.vim'


" language-servers {{{2

Plug 'ternjs/tern_for_vim', { 'dir': '~/.local/share/nvim/plugged/tern_for_vim', 'do': 'npm install' }
Plug 'moll/vim-node'

Plug 'davidhalter/jedi-vim'


" Markdown {{{2

Plug 'dkarter/bullets.vim' " for toggling checkboxes

Plug 'cjbassi/grip.vim'


" motion {{{2

Plug 'terryma/vim-smooth-scroll'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-edgemotion'
Plug 'justinmk/vim-ipmotion'


" searching {{{2

" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/vim-asterisk'


" snippets {{{2

Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'


" syntax {{{2

Plug 'plasticboy/vim-markdown'

Plug 'chr4/nginx.vim'

Plug 'kovetskiy/sxhkd-vim'

Plug 'othree/javascript-libraries-syntax.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components'

Plug 'hail2u/vim-css3-syntax'

Plug 'rhysd/vim-gfm-syntax'  " GitHub markdown

" Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'mboughaba/i3config.vim'
Plug 'cjbassi/i3-vim-syntax'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'elzr/vim-json'

Plug 'cespare/vim-toml'  " for TOML files

Plug 'rust-lang/rust.vim'

Plug 'ekalinin/Dockerfile.vim'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }


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
Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-unimpaired'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mbbill/undotree'
Plug 'tpope/vim-eunuch'  " unix tools
Plug 'tpope/vim-sleuth'  " for indent size
Plug 'cjbassi/fullscreen-help.vim'
Plug 'cjbassi/cursor-stop.vim'


" vim-airline {{{2

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-airline-colornum'


" visuals {{{2

" Plug 'tjdevries/overlength.vim'
" Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'kshenoy/vim-signature'  " shows marks
Plug 'chriskempson/base16-vim'
Plug 'kana/vim-operator-user'
" Plug 'haya14busa/vim-operator-flashy'
Plug 'cjbassi/vim-operator-flashy'

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


" Keybinds {{{1

map Y y$
nnoremap <silent> gG G
nnoremap Q @q
" updates diffs, clears statusline, clears highlights
nnoremap <silent> , :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" switch tabs
nnoremap H gT
nnoremap L gt

nmap <silent> j gj
nmap <silent> k gk

" backwards deleting in insert mode adds to undo list
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

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

nnoremap <silent> <leader>T :silent !terminal<CR>

nnoremap <silent> <leader>tc :ToggleCheckbox<CR>
nnoremap <silent> <leader>tC :ColorToggle<CR>
nnoremap <silent> <leader>tf :Autoformat<CR>
nnoremap <leader>th :Help<Space>
nnoremap <leader>tr :%s/
nnoremap <silent> <leader>tR :RangerCurrentFile<CR>
nnoremap <silent> <leader>ts :silent ! ws '%' &<CR>
nnoremap <silent> <leader>tt :VimtexCompile<CR>
nnoremap <silent> <leader>tu :UndotreeToggle<CR>
nnoremap <leader>tU :UltiSnipsEdit<Space>
nnoremap <silent> <leader>tv :source ~/config/nvim/init.vim<CR>
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


" movement {{{3

map <silent> <leader>f <Plug>(easymotion-j)
map <silent> <leader>F <Plug>(easymotion-k)

nnoremap <silent> ' :Buffers<CR>
nnoremap <silent> <Tab> :b#<CR>

nnoremap <silent> <leader>l :Lines<CR>


" files {{{3

nnoremap <silent> <leader>eal :edit ~/config/dotfiles/.aliases<CR>
nnoremap <silent> <leader>edi :edit ~/drive/notes/other/dictionary.md<CR>
nnoremap <silent> <leader>eec :edit ~/config/dotfiles/.editorconfig<CR>
nnoremap <silent> <leader>een :edit ~/config/dotfiles/.zshenv<CR>
nnoremap <silent> <leader>ehf :edit ~/.histfile<CR>
nnoremap <silent> <leader>egc :edit ~/config/dotfiles/.gitconfig<CR>
nnoremap <silent> <leader>ei1 :edit ~/config/installation/install1.sh<CR>
nnoremap <silent> <leader>ei2 :edit ~/config/installation/install2.sh<CR>
nnoremap <silent> <leader>ei3 :edit ~/config/installation/install3.sh<CR>
nnoremap <silent> <leader>ekb :edit ~/config/sxhkd/sxhkdrc<CR>
nnoremap <silent> <leader>emr :edit ~/config/mutt/muttrc<CR>
nnoremap <silent> <leader>epb :edit ~/config/polybar/config<CR>
nnoremap <silent> <leader>err :edit ~/.config/ranger/rc.conf<CR>
nnoremap <silent> <leader>etr :edit ~/config/alacritty/alacritty.yml<CR>
nnoremap <silent> <leader>evr :edit ~/config/nvim/init.vim<CR>
nnoremap <silent> <leader>ewm :edit ~/config/i3/config<CR>
nnoremap <silent> <leader>exr :edit ~/config/dotfiles/.xinitrc<CR>
nnoremap <silent> <leader>ezr :edit ~/config/dotfiles/.zshrc<CR>

nnoremap <silent> <leader>eM :edit Makefile<CR>


" git {{{3

nnoremap <silent> <leader>gd :Gvdiff<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gbrowse<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <leader>gm :Gmove<Space>


" vim-plug {{{3

nnoremap <silent> <leader>pi :source ~/config/nvim/init.vim <bar> :nohlsearch<CR>:PlugInstall<CR>
nnoremap <silent> <leader>pu :source ~/config/nvim/init.vim <bar> :nohlsearch<CR>:PlugUpdate<CR>
nnoremap <silent> <leader>pc :source ~/config/nvim/init.vim <bar> :nohlsearch<CR>:PlugClean<CR>


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

autocmd FileType man call ManFileType()
function! ManFileType()
  setlocal nonumber
  setlocal norelativenumber
endfunction

autocmd FileType plaintex setlocal ft=tex

autocmd FileType mail setlocal spell textwidth=0 wrap
autocmd FileType markdown setlocal spell

" Disables comments on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd VimResized,TabEnter * wincmd =

autocmd VimResized normal ,

autocmd BufNewFile,BufRead *.ts,*.tsx set filetype=javascript.jsx


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

" autocmd InsertLeave,WinEnter * let &l:foldmethod=g:oldfoldmethod
" autocmd InsertEnter,WinLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod=manual

" set foldclose=all
" set foldopen=all

" autocmd BufReadPost * normal zR

" noremap zk zczkza

nnoremap <silent> z] :<C-u>silent! normal! zc<CR>zjzozz
nnoremap <silent> z[ :<C-u>silent! normal! zc<CR>zkzo[zzz


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

set directory=~/.config/nvim/swap//
set backupdir=~/.config/nvim/backup//
set undodir=~/.config/nvim/undo//
set undofile

" }}}

" Plugin Settings {{{1

" ALE {{{2

autocmd FileType markdown let b:ale_enabled=0

let g:ale_linters = {
      \   'cpp': ['clang'],
      \   'javascript': ['eslint'],
      \}

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

let g:ale_set_loclist=1
let g:ale_set_quickfix=1

let g:ale_set_highlights=1

highlight ALEErrorSign guifg=#dc322f guibg=#073642
highlight ALEWarningSign guifg=#b58900 guibg=#073642


" Bullets.vim {{{2

let g:bullets_set_mappings = 0


" " Deoplete{{{2

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_refresh_always = 0
" inoremap <C-j> <C-n>
" inoremap <C-k> <C-p>
" let g:deoplete#auto_complete_start_length = 2
" let g:deoplete#max_abbr_width = 50

" autocmd VimEnter * inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction

" autocmd CompleteDone * silent! pclose!

" if has("patch-7.4.314")
"   set shortmess+=c
" endif

" call deoplete#custom#source('around', 'matchers', ['matcher_fuzzy',
"       \ 'matcher_length'])

" let g:clang_library_path='/usr/lib'
" let g:deoplete#sources#jedi#show_docstring = 1

" set completeopt-=preview


" fzf {{{2

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


" set rtp+=/usr/bin/fzf
" set rtp+=~/.fzf
" let g:fzf_layout = { 'window': '10split enew' }


" grip.vim {{{2

nnoremap <silent> <C-p> :call Grip()<CR>


" incsearch.vim{{{2

" autocmd FileType * map / <Plug>(incsearch-stay)

" let g:incsearch#auto_nohlsearch = 1

" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)

" map <C-j> <Over>(incsearch-scroll-f)
" map <C-k> <Over>(incsearch-scroll-b)


" indentLine {{{2

autocmd BufRead,BufNewFile *.md,*.txt
      \ let b:indentLine_enabled = 0 |

let g:indentLine_color_term = 239


" overlength.vim {{{2

let overlength#default_overlength = 80
let g:overlength#default_to_textwidth = 0

" autocmd FileType man call overlength#toggle()
" autocmd FileType markdown call overlength#toggle()
" autocmd FileType text call overlength#toggle()


" tern_for_vim {{{2

autocmd FileType javascript nnoremap <buffer> <C-]> :TernDef<CR>


" UltiSnips{{{2

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
" let g:airline_theme='powerlineish'
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


" vim-autoformat {{{2

let g:autoformat_remove_trailing_spaces = 0
" let g:formatdef_my_custom_javascript = '"js-beautify -a -s ".&shiftwidth'
" let g:formatters_javascript = ['my_custom_javascript']


" vim-easy-align {{{2

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" vim-easymotion{{{2

map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)

map t <Plug>(easymotion-t)
map T <Plug>(easymotion-T)


" vim-gitgutter{{{2

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


" vim-go {{{2

let g:go_fmt_fail_silently = 0

let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 0

let g:go_doc_keywordprg_enabled = 0


" vim-ipmotion {{{2

let g:ip_skipfold=1


" vim-javascript {{{2

let g:javascript_plugin_flow = 1


" vim-jedi {{{2

let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#goto_definitions_command = "<C-]>"


" vim-json{{{2

let g:vim_json_syntax_conceal = 0


" vim-jsx {{{2

let g:jsx_ext_required = 0


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


" vim-node {{{2

set runtimepath^=~/.loca/share/nvim/plugged/vim-node


" vim-operator-flashy{{{2

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" let g:operator#flashy#group = get(g:, 'operator#flashy#group', 'TermCursor')


" vim-racer {{{2

let g:racer_cmd = "/usr/bin"


" vim-ranger {{{2

let g:ranger_map_keys = 0


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

" }}}
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


" vimtex {{{2

let g:vimtex_view_method='zathura'

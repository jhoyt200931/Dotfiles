"
"     ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
"    ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
"     ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
"      ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"       ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"       ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"       ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"         ░░   ▒ ░░      ░     ░░   ░ ░
"          ░   ░         ░      ░     ░ ░
"         ░                           ░

"#####################"
"###### PLUGINS ######"
"#####################"

" Automatic vim-plug installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Specify plugin directory
call plug#begin('~/.local/share/nvim/plugged')

Plug 'pantharshit00/vim-prisma'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'davidyorr/vim-es6-unused-imports'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/fzf'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'

" Initialize plugin system
call plug#end()

"#######################"
"###### BRAIN LAG ######"
"#######################"

" Common spelling errors
iab teh the
iab Teh The
iab improt import
iab cont const
iab retrun return

" coc-spell-checker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

"#############################"
"###### GENERAL CONFIGS ######"
"#############################"

" CoC config
let g:coc_global_extension = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-json',
	\ ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Enable syntax and plugins
syntax enable
filetype on
filetype plugin on
filetype indent on

" Disable vi mode
set nocompatible

" Better splits
set splitbelow
set splitright

" Set encoding
set encoding=utf8

" If hidden is not set, textEdit might fail
set hidden

" Better display for messages
set cmdheight=2

" Better diagnostic messages
set updatetime=300

" Remove |ins-completion-menu| messages
set shortmess+=c

" Hide mode (shown in status line)
set noshowmode

" When a file has been changed outside of Vim, automatically read it again
set autoread

" Always show current position
set ruler

" When a bracket is inserted, briefly jump to the matching one
set showmatch

" Tenths of a second to show the matching paren
set mat=2

" Switching this option off most likely breaks plugins, someone told me...
set magic

" Don't show signcolumn
set signcolumn=no

" Highlight search results
set hlsearch

" Number of columns occupied by a tab character
set tabstop=2

" See multiple spaces as tabstops so <BS> does the right thing
set softtabstop=2

" Softtabstop == tabstop, noexpandtab && always force use of tabs
set noexpandtab

" Width for autoindents
set shiftwidth=2

" Indent a new line the same amount as the line just typed
set autoindent

" Add relative line numbers
"set relativenumber number

" Add just line numbers
set number

" Prevent cursor jumping
set lazyredraw

" Enable cursor line, disable cursor column
set cursorline
set nocursorcolumn

" Sets unix as standard filetype
set ffs=unix,dos,mac

" Wrap lines
set wrap

" Maximum items in completion suggest popup menu
set pumheight=10

" Don't make a any backups before overwriting a file
set nobackup
set nowritebackup

" Don't use a swapfile for the buffer
set noswapfile

" Increase max memory to show syntax highlighting for large files
set maxmempattern=20000

" Don't show preview [sratch] window
set completeopt-=preview

"############################"
"###### AUTOCMDS, ETC #######"
"############################"

" Syntax highlighting for TS/TSX
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" Auto resize panes
autocmd VimResized * wincmd =

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Open NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Check for unused es6 imports
autocmd BufWinEnter *.ts,*.tsx,*.js,*.jsx execute "ES6ImportsHighlight"
autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx execute "ES6ImportsHighlight"

" Set es6 unused import plugin colors
let g:es6_imports_gui_fg_color="#475763"
let g:es6_imports_gui_bg_color="#192C3B"

" File specific rules
augroup filespecific
	autocmd!
	au BufRead,BufNewFile *.ts set ft=typescript
	au BufRead,BufNewFile *.prisma set ft=prisma
	au FileType go set noet nolist
	au FileType python setl ts=4
augroup END

"#####################################"
"###### THEME & PLUGIN SETTINGS ######"
"#####################################"

" Set colors to gui
set termguicolors

" Set theme
colorscheme debris

" Source NERDTree filetype highlighting
source ~/.config/nvim/plugin/nerdtree.vim

" Set list characters
set list
set listchars=
set listchars+=tab:›\ ,
set listchars+=trail:•,

" Set end of buffer and vertsplit to empty
set fillchars+=eob:\ ,
set fillchars+=vert:\ ,

" Disable nvim-typescript diagnostics as they override ALE signs
let g:nvim_typescript#diagnostics_enable = 0

" ALE settings
let g:ale_sign_info= "•"
let g:ale_sign_error = "•"
let g:ale_sign_warning = "•"
let g:ale_sign_style_error = "•"
let g:ale_sign_style_warning = "•"
let g:ale_fixers = {
	\ 'javascript': ['eslint'],
	\ 'css': ['prettier'],
	\ 'scss': ['prettier']
	\}
let g:ale_fix_on_save = 1

" Rust auto-format
let g:rustfmt_autosave = 1

" NERDTree settings
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeDirArrowExpandable = "•"
let g:NERDTreeDirArrowCollapsible = "•"
let g:NERDTreeWinSize = 31

"#########################"
"###### KEYBINDINGS ######"
"#########################"

" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" Go to type defintion
nmap <silent> gy <Plug>(coc-type-definition)

" Go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" Go to reference
nmap <silent> gr <Plug>(coc-references)

" Quick fix current line
nmap <leader>qf <Plug>(coc-fix-current)

" Bind JK to normal mode
inoremap jk <ESC>

" Tab to to jump
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Enter to complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Map nerdtreetoggle to ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Navigate between linter errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-h> :ALEHover<CR>

" Map Esc to exit Terminal
tnoremap <Esc> <C-\><C-n>

" Move line up
nmap <M-j> :m+<CR>==
imap <M-j> <Esc>:m+<CR>==gi=gi
vmap <M-j> :m'>+<CR>gv=gv

" Move line down
nmap <M-k> :m-2<CR>==
imap <M-k> <Esc>:m-2<CR>==gi=gi
vmap <M-k> :m-2<CR>gv=gv

" Add uppercase variants to save/write
:command W w
:command Q q
:command Wq wq
:command WQ wq

" Fzf
nnoremap <C-p> :FZF<CR>

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap ; :

" Fugitive lifehack
nnoremap <leader>gvd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Disable arrow keys to prevent cowardice
map <Up> <Nop>
map! <Up> <Nop>
map <Down> <Nop>
map! <Down> <Nop>
map <Left> <Nop>
map! <Left> <Nop>
map <Right> <Nop>
map! <Right> <Nop>

" Clipboard
set clipboard+=unnamedplus

" Vimdiff colors
hi DiffAdd guibg=#12181d
hi DiffChange guibg=#12181d
hi DiffText guibg=#12181d
hi DiffDelete guibg=#12181d


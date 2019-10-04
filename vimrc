" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'
Plug 'sjl/gundo.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"
" COLORS
"

colorscheme aurora

" enable syntax processing
syntax on

"
" SPACES AND TABS
"

" number of visual spaces per tab
set tabstop=4

" number of spaces in tab when editing
set softtabstop=4

set expandtab       " tabs are spaces

"
" UI CONFIG
"
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype plugin indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

"
" SEARCHING
"
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight (by default <leader> is backslash, may want to
" make it a comma?)
nnoremap <leader><space> :nohlsearch<cr>

"
" FOLDING
"
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

"
" MOVEMENT
"
" move vertically by visual line these two allow us to move around lines visually. so if there's a very long line that gets visually wrapped to two lines, j won't skip over the "fake" part of the visual line in favor of the next 'real' line.
nnoremap j gj
nnoremap k gk
" highlight last inserted text
" this one is pretty cool. it visually selects the block of characters you added last time you were in insert mode.
nnoremap gV `[v`]

"
" LEADER SHORTCUTS
"
let mapleader="."       " leader is dot
" jk is escape
" The workaround if you ever need to enter this rare sequence of keys is to enter the j, wait for the leader-check timeout to fade, and then enter the k.
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>eb :vsp ~/.bashrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" save session - After saving a Vim session, you can reopen it with vim -S
nnoremap <leader>s :mksession<CR>


"" get the defaults that most users want.
"source $vimruntime/defaults.vim
"
""these are already done by the defaults above
""filetype plugin indent on
""syntax on
"
"set encoding=utf-8
""set clipboard=unnamedplus
"set spell spelllang=en_us
"
"" when started as "evim", evim.vim will already have done these settings, bail
"" out.
"if v:progname =~? "evim"
"  finish
"endif
"
"set backup		" keep a backup file (restore to previous version)
"if has('persistent_undo')
"  set undofile	" keep an undo file (undo changes after closing)
"endif
"
"if &t_co > 2 || has("gui_running")
"  " switch on highlighting the last used search pattern.
"  set hlsearch
"endif
"
"" put these in an autocmd group, so that we can delete them easily.
"augroup vimrcex
"  au!
"
"  " for all text files set 'textwidth' to 78 characters.
"  autocmd filetype text setlocal textwidth=78
"augroup end
"
"" add optional packages.
""
"" the matchit plugin makes the % command work better, but it is not backwards
"" compatible.
"" the ! means the package won't be loaded right away but when plugins are
"" loaded during initialization.
"if has('syntax') && has('eval')
"  packadd! matchit
"endif

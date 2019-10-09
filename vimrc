" PLUGINS {{{
        " Plugins will be downloaded under the specified directory.
        call plug#begin('~/.vim/plugged')

        " Declare the list of plugins.
        Plug 'sjl/gundo.vim' " graphical undo
        Plug 'ctrlpvim/ctrlp.vim' " find file in dir
        "Plug 'dense-analysis/ale' " async syntax checker/fixer
        "Plug 'python-mode/python-mode' " python plugin
        Plug 'scrooloose/nerdtree' " tree viewer
        
        " PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
        Plug 'junegunn/fzf', { 'do': './install --all' }
        "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        "Plug '~/.fzf'

        " ALE is probably better, but requires Vim 8+, so switch when it's
        " available
        Plug 'vim-syntastic/syntastic'
        Plug 'google/yapf' " python code formatter

        call plug#end()
" }}}

" COLORS {{{
        colorscheme aurora
        " enable syntax processing
        syntax on
" }}}

" SPACES AND TABS {{{

        " number of visual spaces per tab
        set tabstop=4

        " number of spaces in tab when editing
        "set softtabstop=4

        set expandtab       " tabs are spaces
" }}}

" UI CONFIG {{{
        set number              " show line numbers
        set showcmd             " show command in bottom bar
        set cursorline          " highlight current line
        filetype plugin indent on      " load filetype-specific indent files
        set wildmenu            " visual autocomplete for command menu
        set lazyredraw          " redraw only when we need to.
        set showmatch           " highlight matching [{()}]
" }}}

" SEARCHING {{{
        set incsearch           " search as characters are entered
        set hlsearch            " highlight matches
        " turn off search highlight (by default <leader> is backslash, may want to
        " make it a comma?)
        nnoremap <leader><space> :nohlsearch<cr>
" }}}

" FOLDING {{{
        set foldenable          " enable folding
        set foldlevelstart=10   " open most folds by default
        set foldnestmax=10      " 10 nested fold max
        " space open/closes folds
        "nnoremap <space> za
        set foldmethod=indent   " fold based on indent level
" }}}

" MOVEMENT {{{
        " move vertically by visual line these two allow us to move around lines visually. so if there's a very long line that gets visually wrapped to two lines, j won't skip over the "fake" part of the visual line in favor of the next 'real' line.
        nnoremap j gj
        nnoremap k gk
        " highlight last inserted text
        " this one is pretty cool. it visually selects the block of characters you added last time you were in insert mode.
        nnoremap gV `[v`]
" }}}

" LEADER SHORTCUTS {{{
        let mapleader="\<space>"       " leader is dot
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

        " open ag.vim - The Silver Searcher is a fantastic command line tool to search source code in a project. It's wicked fast. The command line tool is named ag (like the element silver). Thankfully there is a wonderful Vim plugin ag.vim which lets you use ag without leaving Vim and pulls the results into a quickfix window for easily jumping to the matches. Here I've mapped it to ,a.
        "nnoremap <leader>a :Ag
" }}}

" CTRL-P {{{
        "telling CtrlP to order matching files top to bottom with ttb. 
        let g:ctrlp_match_window = 'bottom,order:ttb'
        "tell CtrlP to always open files in new buffers with let ctrlp_switch_buffer=0. 
        let g:ctrlp_switch_buffer = 0
        "change the working directory during a Vim session and make CtrlP respect that change.
        let g:ctrlp_working_path_mode = 0
        "let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

" AUTOGROUPS {{{
        "augroup configgroup
        "    autocmd!
        "    autocmd VimEnter * highlight clear SignColumn
        "    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
        "                \:call <SID>StripTrailingWhitespaces()
        "    autocmd FileType java setlocal noexpandtab
        "    autocmd FileType java setlocal list
        "    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
        "    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
        "    autocmd FileType php setlocal expandtab
        "    autocmd FileType php setlocal list
        "    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
        "    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
        "    autocmd FileType ruby setlocal tabstop=2
        "    autocmd FileType ruby setlocal shiftwidth=2
        "    autocmd FileType ruby setlocal softtabstop=2
        "    autocmd FileType ruby setlocal commentstring=#\ %s
        "    autocmd FileType python setlocal commentstring=#\ %s
        "    autocmd BufEnter *.cls setlocal filetype=java
        "    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
        "    autocmd BufEnter Makefile setlocal noexpandtab
        "    autocmd BufEnter *.sh setlocal tabstop=2
        "    autocmd BufEnter *.sh setlocal shiftwidth=2
        "    autocmd BufEnter *.sh setlocal softtabstop=2
        "augroup END
        "This is a slew of commands that create language-specific settings for certain filetypes/file extensions. It is important to note they are wrapped in an augroup as this ensures the autocmd's are only applied once. In addition, the autocmd! directive clears all the autocmd's for the current group.
" }}}

" BACKUPS {{{
        set backup		" keep a backup file (restore to previous version)
        if has('persistent_undo')
          set undofile	" keep an undo file (undo changes after closing)
        endif
        "set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
        "set backupskip=/tmp/*,/private/tmp/*
        "set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
        "set writebackup
        "backup and writebackup enable backup support. As annoying as this can be, it is much better than losing tons of work in an edited-but-not-written file.
" }}}

" CUSTOM FUNCTIONS {{{
        " toggle between number and relativenumber
        "function! ToggleNumber()
        "    if(&relativenumber == 1)
        "        set norelativenumber
        "        set number
        "    else
        "        set relativenumber
        "    endif
        "endfunc
        "
        "" strips trailing whitespace at the end of files. this
        "" is called on buffer write in the autogroup above.
        "function! <SID>StripTrailingWhitespaces()
        "    " save last search & cursor position
        "    let _s=@/
        "    let l = line(".")
        "    let c = col(".")
        "    %s/\s\+$//e
        "    let @/=_s
        "    call cursor(l, c)
        "endfunction
" }}}

"" get the defaults that most users want.
"source $vimruntime/defaults.vim
"
""these are already done by the defaults above
""filetype plugin indent on
""syntax on

set encoding=utf-8
"set clipboard=unnamedplus
"set spell spelllang=en_us

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

" ORGANIZATION {{{
        " tell vim to fold sections by markers, rather than indentation
        "set foldmethod=marker
        " close every fold by default so that we have a high level view when we open our vimrc
        "set foldlevel=0
        " tell Vim to check just the final line of the file for a modeline
        set modelines=1
" }}}
" vim:foldmethod=marker:foldlevel=0

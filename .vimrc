" ABOUT:
    " Maintainer: Marco "Anedom" Modena
    " Date: 17/02/2017
    " Version: 1.0.0

" VUNDLE:
    set nocompatible    " disable vi compatibility
    filetype off    " required
    set rtp+=~/.vim/bundle/Vundle.vim   " vundle path
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'   " vundle manages vundle
    Plugin 'tpope/vim-commentary'   " commentary plugin
    Plugin 'tommcdo/vim-lion'   " lion plugin
    Plugin 'tpope/vim-surround' " surround plugin
    Plugin 'tpope/vim-fugitive' " fugitive plugin
    Plugin 'scrooloose/nerdtree'    " nerdtree plugin
    Plugin 'pangloss/vim-javascript'    " JS plugin
    Plugin 'mxw/vim-jsx'    " JSX plugin
    call vundle#end()

" BASIC: 
    syntax enable   " enable syntax processing
    filetype plugin on  " enable plugin files 
    filetype indent on  " load type specific indent files
    set autoread    " update when file is changed outside   
    set history=500 " history of 500 memory
    set mousehide   " hides mouse when typing

" STYLE:    
    set tabstop=4   " num of spaces to tab when visualizing
    set softtabstop=4   " num of spaces to tab when editing
    set expandtab   " changes tabs to (4) spaces
    set smarttab    " same
    set shiftwidth=4    " indent space
    set lbr " linebreak
    set tw=500  " linebreak at 500
    set ai  " auto indent
    set si  " smart indent
    set wrap    " wrap lines

" UI:
    set number  " numbered lines
    set lazyredraw  " faster macros
    set showmatch   " show equivalent {[(
    set foldcolumn=1    " add space to the left
    set background=dark

" SEARCH:
    set incsearch   " search as entered
    set showcmd " show current command
    set ignorecase  " ignore case when searching
    set path+=**    " enable fuzzy search
    set wildmenu    " enable options menu

" FOLDING:
    set foldenable  " enable folding
    set foldlevelstart=10   " opens most folds by default
    set foldmethod=indent   " indent based fold
   
" LEADER:
    let mapleader=","   " leader is comma
    let g:mapleader="," " same

" BACKUPS:
    set nobackup    " disable backups
    set noswapfile  " same
    set nowb    " same

" STATUS LINE:
    set cmdheight=2 " cmd height
    set laststatus=2    " always show status line
    set statusline=
    set statusline+=%#todo#
    set statusline+=\ %<%f
    set statusline+=\ [%{&ff}/%Y]
    set statusline+=%*
    set statusline+=\ CWD:\ %r%{getcwd()}
    set statusline+=%=
    set statusline+=FLAGS:\ [%n%h%m%r%w]
    set statusline+=\ \ LINE:\ %l

" SNIPPETS:
    " base HTML code
    nnoremap ,html :-1read /home/anedom/.vim/snippets/basehtml.html<CR>5jwf>a

" MISC:
    " toggle paste mode
    map <leader>pp :setlocal paste!<cr>
    
    " Smart way to move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l
    
    " allows cursor change in tmux mode
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
   
    " fast saves
    nmap <leader>w :w!<cr>

    " easy escaping to normal model
    imap jj <esc>

    " autoquit if only nerdtree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" HELPER FUNCTIONS:
    " Windows Compatible
    if has('win32') || has('win64')
        set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif

" NERDTREE:
    " keymaps
    map <leader>nn :NERDTreeToggle<CR>
    map <leader>nf :NERDTreeFind<CR>

    " position
    let g:NERDTreeWinPos = "right"

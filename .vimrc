" ABOUT:
    " Maintainer: Marco "Anedom" Modena
    " Date: 17/02/2017
    " Version: 1.0.0

" BASIC:
    set nocompatible    " disable vi compatibility
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

" PLUGINS:
    " pathogen plugin manager
    call pathogen#infect()
    call pathogen#helptags()

" BACKUPS:
    set nobackup    " disable backups
    set noswapfile  " same
    set nowb    " same

" STATUS LINE:
    set cmdheight=2 " cmd height
    set laststatus=2    " always show status line
    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" SNIPPETS:
    " base HTML code
    nnoremap ,html :-1read /home/anedom/.vim/snippets/basehtml.html<CR>5jwf>a

" MISC:
    " toggle paste mode
    map <leader>pp :setlocal paste!<cr>

" HELPER FUNCTIONS:
    " Returns true if paste mode is enabled 
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
    endif
        return ''
    endfunction

     " Windows Compatible
        " On Windows, also use '.vim' instead of 'vimfiles'
        " this makes synchronization across (heterogeneous) systems easier.
        if has('win32') || has('win64')
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif

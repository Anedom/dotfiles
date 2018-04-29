" ABOUT:
    " Maintainer: Marco "Anedom" Modena
    " Date: 17/02/2017
    " Version: 2.2

" VUNDLE:
    set nocompatible    " disable vi compatibility
    filetype off    " required
    set rtp+=~/.vim/bundle/Vundle.vim   " vundle path
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'   " vundle manages vundle
    Plugin 'tpope/vim-commentary'   " commentary plugin
    Plugin 'tpope/vim-fugitive' " fugitive plugin
    Plugin 'tpope/vim-git'  " git plugin
    Plugin 'scrooloose/nerdtree'    " nerdtree plugin
    Plugin 'pangloss/vim-javascript'    " JS plugin
    Plugin 'mxw/vim-jsx'    " JSX plugin
    Plugin 'vim-syntastic/syntastic'    " syntastic plugin
    Plugin 'tpope/vim-surround' " surround plugin
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'elzr/vim-json'  " JSON Plugin
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
    set t_Co=256
    set noshowmode

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
    set laststatus=2    " always show sl
    set statusline= " starts sl
    set statusline+=[%{toupper(mode())}]
    set statusline+=\ %f\   " filename
    set statusline+=[%{getcwd()}]\  " cwd
    set statusline+=%m%r\   "flags
    set statusline+=%{fugitive#statusline()}\   " adds git info
    set statusline+=%=  " devider
    set statusline+=[%{&ff}/%Y]\    " filetype
    set statusline+=%-14.(line:%l,col:%c%V%)\ %p%%

" SNIPPETS:
    " base HTML code
    nnoremap ,html :-1read /home/anedom/.vim/snippets/basehtml.html<CR>5jwf>a

" AUTOCOMMANDS:
    " JSON:
    augroup json_autocmd
        autocmd!
        autocmd! BufRead,BufNewFile *.json set filetype=json
        autocmd FileType json set autoindent
        autocmd FileType json set formatoptions=tcq2l
        autocmd FileType json set textwidth=78 shiftwidth=2
        autocmd FileType json set softtabstop=2 tabstop=8
        autocmd FileType json set expandtab
        autocmd FileType json set foldmethod=syntax
    augroup END

    " Remove trailing whitespaces
    augroup remove_trailing_whitespace
        autocmd!
        autocmd BufWritePre * :%s/\s\+$//e
    augroup end

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

    " better movement
    nnoremap j gj
    nnoremap k gk

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

" SYNTASTIC:
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

" FUGITIVE:
    nnoremap <leader>gd :Gdiff<cr>
    nnoremap <leader>gs :Gstatus<cr>
    nnoremap <leader>gw :Gwrite<cr>
    nnoremap <leader>ga :Gadd<cr>
    nnoremap <leader>gb :Gblame<cr>
    nnoremap <leader>gci :Gcommit<cr>
    nnoremap <leader>ge :Gedit<cr>
    nnoremap <leader>gm :Gmove
    nnoremap <leader>gr :Gread<cr>
    nnoremap <leader>grm :Gremove<cr>
    nnoremap <leader>gp :Git push

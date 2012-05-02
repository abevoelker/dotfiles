set nocompatible      " We're running Vim, not Vi!
filetype off

" Use Vundle to manage plugins
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My Vundles here:
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim.git'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/csapprox'
Bundle 'derekwyatt/vim-scala'
Bundle 'kchmck/vim-coffee-script'

" Load Tim Pope's pathogen script for easier plugin management
call pathogen#runtime_append_all_bundles()

" Post-plugin stuff here:
filetype plugin indent on

" Override default bd with Kwbd plugin to preserve window
cnoreabbrev bd Kwbd

" Enable Ruby Extensions
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" My own custom garbage here
set t_Co=256
color wombat
set guifont=Consolas\ 10 " Don't forget to pull in from ~/.fonts
set number       " Enable line numbers
set shiftwidth=2 " Indent lines by 2 spaces
set autoindent
" Eww, tabs by default? let's use spaces instead
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set pastetoggle=<F2> " F2 for pasting without auto-indent

" Better split navigation
" Taken from http://vimbits.com/bits/10
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Keep backup/swap garbage out of working dir
set backupdir=~/.vimbackup,/tmp
set directory=~/.vimswap,/tmp

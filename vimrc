
" Override default bd with Kwbd plugin to preserve window
cnoreabbrev bd Kwbd

" Enable Ruby Extensions
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" My own custom garbage here
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

" Keep backup/swap garbage out of working dir
set backupdir=~/.vimbackup,/tmp
set directory=~/.vimswap,/tmp

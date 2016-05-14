set shell=/bin/sh             " make fish happy
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'francoiscabrol/ranger.vim'
Plugin 'bling/vim-airline'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'vim-scripts/indentpython.vim'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Basic settings
set nocompatible                " Eliminate backward-compatability
set number                      " Enable line numbers
set ruler                       " Turn on the ruler
syntax on                       " Syntax highlighting

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=79
set autoindent

" Flagging unnecessary whitespaces
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" File
set fileformat=unix
set encoding=utf-8

" Other settings
set mouse=a                     " Use mouse
set showmatch                   " Show corresponding parenthesis
set incsearch                   " Display results while searching
set hls                         " Hightlight search

" Color scheme
colorscheme sweyla

" Global - source navigation plugin 
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Ranger
map <C-i> :call OpenRanger()<CR>

" Command-T: manage buffers
nnoremap ,b :CommandTBuffer<CR>

" Replace tabs by 4 spaces
map <F2> :retab 
" Disappearing hightlighted found words
map <F3> :noh

" Vim airline
let g:airline#extensions#tabline#enabled = 1
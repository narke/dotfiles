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
Plugin 'wincent/command-t'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required, file type based indentation
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
set backspace=indent,eol,start  " Allows backspacing over indent, line breaks and start of insert
set number                      " Enable line numbers
set ruler                       " Turn on the ruler
syntax on                       " Syntax highlighting

" Indentation using tabs
set tabstop=8
set shiftwidth=8
set autoindent
set textwidth=79                " Be aware of 80 colons

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

" Make disappear hightlighted found words
map <F2> :noh

"  ________________
" < Plugins config >
"  ----------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||

" Global : source navigation plugin
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Ranger
map <C-i> :call OpenRanger()<CR>

" Command-T: manage buffers
nnoremap ,b :CommandTBuffer<CR>

" Vim airline: status bar
set laststatus=2                              " Always show statusbar
let g:airline_detect_paste=1                  " Show PASTE if in paste mode
let g:airline#extensions#tabline#enabled=1    " Show airline for tabs too

" Syntastic : syntax checking
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol="▲"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode="passive"
augroup END

nnoremap <leader>S :SyntasticToggleMode<CR>

" GitGutter : shows a git diff
hi clear SignColumn      " Required after having changed the colorscheme
let g:gitgutter_signs=0  " Turn off signs by default
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only=1

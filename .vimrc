" jvc26 vimrc

" Use pathogen for vim packages, fore reload after pathogen
filetype off
call pathogen#infect()

filetype plugin indent on

" Don't need old vi backwards compatibility
set nocompatible

" Elongate the history
set history=1000

" Set teminal title
set title

" Turn the filetype plugin on - filetype specific plugins
set ofu=syntaxcomplete#Complete

" Visual Settings
set showmatch " Show matching brackets
set mat=5 " How long to flash matching brackets
set visualbell 

" Tabs and indents
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set smarttab

" Always turn syntax highlighting on
syntax enable
set background=dark
colorscheme solarized

set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number

"Search functions
set hlsearch

" Cryptic name, but allows *hiding* of buffers rather than closing
set hidden

"Activate pasting, so we don't get stacks of horrible indents.
set pastetoggle=<F2>

" Disable arrow keys to force use of h,j,k,l
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Make j and k do expected action on long, wrapped lines
nnoremap j gj
nnoremap k gk

" Don't update the display when running macros
set lazyredraw

" No need for backup files
set nobackup

" Optional options, which are version dependent.
" relativenumber is only available >2.3
if has('relativenumber')
    set relativenumber
endif

" Set the tex_flavour for LaTeX
let g:tex_flavor='xelatex'
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'
let g:Tex_CompileRule_dvi='xelatex -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps='xelatex -interaction=nonstopmode $*'

" If we have any user/machine specific settings source them
if filereadable('~/.vim/user.vim')
    source ~/.vim/user.vim
endif

if filereadable('~/.vim/machine.vim')
    source ~/.vim/machine.vim
endif

" Handle funny TERM quirks in vim
if $TERM =~ '^screen-256color'
    nmap <Esc>OH <Home>
    imap <Esc>OH <Home>
    nmap <Esc>OF <End>
    imap <Esc>OF <End>
endif

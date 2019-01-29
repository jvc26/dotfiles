" jvc26 vimrc
" Recently pulled some of vim-sensible from @tpope
" https://github.com/tpope/vim-sensible
filetype off

" Use Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle should manage Vundle
Plugin 'gmarik/Vundle.vim'

" Bundle my vim plugins
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/MatchTag'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'

" End Vundle
call vundle#end()

filetype plugin indent on

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

" Sensible defaults from @tpope
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
endif

if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
        let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
    endif
endif

set autoread
set autowrite
set fileformats+=mac

if &history < 1000
    set history=1000
endif

set viminfo^=!

" Linenumber
set relativenumber

" Cryptic name, but allows *hiding* of buffers rather than closing
set hidden

"Activate pasting, so we don't get stacks of horrible indents.
set pastetoggle=<F2>

" Disable arrow keys
noremap <Up> <Nop>
inoremap <Up> <Nop>
noremap <Down> <Nop>
inoremap <Down> <Nop>
noremap <Left> <Nop>
inoremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Right> <Nop>

" Make j and k do expected action on long, wrapped lines
nnoremap j gj
nnoremap k gk

" Don't update the display when running macros
set lazyredraw

" Dump swap files under ~/.local/share/vim/swap: platform dependent
let s:dir = has('win32') ? '~/Application Data/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : '~/.local/share/vim'
if isdirectory(expand(s:dir))
    if &directory =~# '^\.,'
        let &directory = expand(s:dir) . '/swap//,' . &directory
    endif
    if &backupdir =~# '^\.,'
        let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
    endif
    if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
        let &undodir = expand(s:dir) . '/undo//,' . &undodir
    endif
endif

if exists('+undofile')
    set undofile
endif

" Handle funny TERM quirks in vim
set t_Co=16

let g:Powerline_symbols = 'fancy'
let g:airline_theme = 'solarized'

" == Neocomplete options ==
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

autocmd FileType markdown nested NeoComplCacheLock

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" == Vim-go ==
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt"

au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>t <Plug>(go-def-tab)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap  <leader>r  <Plug>(go-run)
au FileType go nmap  <leader>b  <Plug>(go-build)
au FileType go nmap <Leader>d <Plug>(go-doc)

" == Include windows and explorer ==
let g:netrw_liststyle = 3
nnoremap <Leader><Leader> :Tlist<CR><C-W>h<C-W>s:e .<CR><C-W>l:let g:netrw_chgwin=winnr()<CR><C-W>h

nmap <F8> :TagbarToggle<CR>

" == Tagbar ==
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
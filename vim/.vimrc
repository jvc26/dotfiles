" jvc26 vimrc
filetype off

" Use Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle should manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Bundle my vim plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'

" End Vundle
call vundle#end()

filetype plugin indent on

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

" Cryptic name, but allows *hiding* of buffers rather than closing
set hidden

"Activate pasting, so we don't get stacks of horrible indents.
set pastetoggle=<F2>

" Make j and k do expected action on long, wrapped lines
nnoremap j gj
nnoremap k gk

" Don't update the display when running macros
set lazyredraw

" Handle funny TERM quirks in vim
set t_Co=256

set relativenumber 

let g:Powerline_symbols = 'fancy'
let g:airline_theme = 'solarized'

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

" Don't litter swp files everywhere
set backupdir=~/.cache
set directory=~/.cache

" File format preferences
autocmd FileType go setlocal noet ts=4 sw=4
autocmd FileType html setlocal et ts=2 sw=2
autocmd FileType htmldjango setlocal et ts=2 sw=2
autocmd FileType scss setlocal et ts=2 sw=2
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType markdown setlocal tw=80 et ts=2 sw=2
autocmd FileType text setlocal tw=80
autocmd FileType python setlocal et ts=4 sw=4
autocmd FileType tex hi Error ctermbg=NONE

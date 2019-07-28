" The Basics
syntax on
set number
set nocompatible              " be iMproved, required
filetype off                  " required
:set ignorecase
:set smartcase

" Tabs and spaces
" Set default to 4 space tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Override 4 space indent for langs that prefer 2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=2 sts=2 sw=2
autocmd Filetype python3 setlocal ts=2 sts=2 sw=2
autocmd Filetype py setlocal ts=2 sts=2 sw=2
autocmd Filetype haskell,hs setlocal ts=2 sts=2 sw=2


" Vundle, baby
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Core vim plugins
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'qpkorr/vim-bufkill'

" Plugins for The Aesthetic
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'
Plugin 'Nequo/vim-allomancer'
Plugin 'kien/rainbow_parentheses.vim'

" The legend Tim Pope
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-surround'

" Minimalism plugins
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" lang-specific plugins below
" Rust plugins
Plugin 'rust-lang/rust.vim'

" Clojure plugins
Plugin 'guns/vim-clojure-static'

" js + ts plugins
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'elmcast/elm-vim'

" Haskell plugins
Plugin 'alx741/vim-hindent'
Plugin 'neovimhaskell/haskell-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" End Vundle


" Core vim and plugin config
" Generic tab config
map <C-n> :bnext<CR>
map <C-m> :bprevious<CR>
nnoremap <Leader>f <C-w>

" NERDTree config 
map <C-b> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=60
let g:NERDTreeShowHidden=1

" Fugitive + plugins config
let g:github_enterprise_urls = ['https://github.ibm.com']

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" YCM config
let g:ycm_min_num_of_chars_for_completion = 2

" Goyo + Limelight config
let g:limelight_coneceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
map <C-g> :Goyo<CR>

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_loadcmd_toggle = 0
let g:rbpt_max = 16
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" End core config


" Aesthetic configuration
set termguicolors
let base16colorspace=256
" colo allomancer
" colorscheme base16-onedark
" colorscheme base16-tomorrow-night-eighties
colorscheme base16-eighties




" lang-specific config below
" js and ts config
autocmd FileType typescript JsPreTmpl
autocmd FileType typescript syn clear foldBraces
autocmd FileType typescript syn clear foldBraces
autocmd FileType typescript JsPreTmpl

" Clojure config
autocmd FileType clojure nnoremap <Leader>e :Eval<CR>
autocmd FileType clojure nnoremap <Leader>w :%Eval<CR>

" Rust config
autocmd FileType rust let g:rustfmt_autosave = 1
autocmd FileType rust nnoremap <Leader>w :!cargo run<CR>
autocmd FileType rust nnoremap <Leader>c :!cargo check<CR>
autocmd FileType rust nnoremap <Leader>t :!cargo test<CR>

" Python config
autocmd Filetype python,python3,py nnoremap <Leader>w :!python %<CR>

" Haskell config
autocmd Filetype haskell,hs nnoremap <Leader>w :!stack run<CR>

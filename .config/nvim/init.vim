" ======================
" | neovim config file |
" | Author: Risorg     |
" ======================
"        _             _           
"  _ __ | |_   _  __ _(_)_ __  ___ 
" | '_ \| | | | |/ _` | | '_ \/ __|
" | |_) | | |_| | (_| | | | | \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/
" |_|            |___/             
"{{{
" Required_Packages:
" -> Cabal: hoogle      (vim-hoogle)
" -> Cabal: hlint       (ALE haskell linting)
" -> clang              (ALE C/C++ linting)
" -> shellcheck         (ALE Bash/Shell linting)

" ==== PLUGIN SETTINGS ====
" Haskell_vim:

let g:haskell_classic_highlighting = 1
" 4 spaces of indentation
let g:haskell_indent_let = 4

"""""""""""""""""""""""""""
" Lightline:

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ }
      \ }

""""""""""""""""""""""""""""""""""""""""""
" ALE:
"
let g:ale_completion_enabled = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_linters = {
\   'cpp': ['clang'],
\   'bash':['shellcheck'],
\   'ruby':['ruby'],
\   'awk':['gawk'],
\   'haskell':['ghc', 'hlint'],
\   'rust':['rustc'],
\}

""""""""""""""""""""""""""""""""""""""""""

" ==== PLUGINS ====
call plug#begin('~/.config/nvim/plugged')
     Plug 'tpope/vim-surround'              " Surround text in vim
     Plug 'tpope/vim-repeat'                " Add repeat functionality to many actions
     Plug 'junegunn/goyo.vim'               " Distraction free text centering
     Plug 'itchyny/lightline.vim'           " Alternative status bar
     Plug 'dkasak/gruvbox'                  " Gruvbox Colorscheme
     Plug 'sjl/badwolf'                     " Badwolf Colorscheme
     Plug 'christophermca/meta5'            " Tron inspired colorscheme
     Plug 'joshdick/onedark.vim'            " One dark (Atom) Colorscheme
     Plug 'tpope/vim-fugitive'              " Vim git wrapper
     Plug 'w0rp/ale'                        " Code linting
     Plug 'ngmy/vim-rubocop'                " Rubocop vim plugin for Ruby code repair
     Plug 'ervandew/supertab'               " Use Tab for autocompletion
     Plug 'neovimhaskell/haskell-vim'       " Haskell syntax highlighting
     Plug 'Twinside/vim-hoogle'             " Vim Hoogle query plugin
     Plug 'godlygeek/tabular'               " Text filtering and alignment
call plug#end()
"}}}
"                                  _ 
"   __ _  ___ _ __   ___ _ __ __ _| |
"  / _` |/ _ \ '_ \ / _ \ '__/ _` | |
" | (_| |  __/ | | |  __/ | | (_| | |
"  \__, |\___|_| |_|\___|_|  \__,_|_|
"  |___/  
"{{{
set nu relativenumber " Enable line (+ relative) numbers
set background=dark " Set the background theme to dark
syntax on " Enable syntax highlighting
filetype plugin indent on " Enable plugin indentation
colorscheme badwolf " Set the colorscheme
set autoindent smartindent cindent " Set code autoindentation
set cursorline " Highlight current line
set tabstop=4 expandtab smarttab shiftwidth=4 " One TAB appears to be 4 spaces
set splitbelow splitright " Splits open at the bottom and right
set noshowmode " Don't show the indicator in insert mode.
set completeopt=longest,menuone,noselect " Improve completion menu
set textwidth=80 " Set max text in a line to 80
set mouse=nicr " Smooth mouse scrolling

" Set the backup/undo/swap files location in /tmp
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

set ignorecase smartcase " Ignore the case of letters only if no Upper case is present
set incsearch hlsearch " Show search while typing and highlight everything
set showmatch " Show matching brackets when text indicator is over them

"Wildmode
set wildmenu
set wildmode=list:longest,full

" ===== COLORS =====

" Set true colors
if (has("nvim"))
     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
     set termguicolors
endif
"}}}
"                              _                 
"  _ __ ___   __ _ _ __  _ __ (_)_ __   __ _ ___ 
" | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __|
" | | | | | | (_| | |_) | |_) | | | | | (_| \__ \
" |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
"                 |_|   |_|            |___/     
"{{{
" Set the map leader to , (used in global maps)
let mapleader="," 
" Set the local map leader to , (used in specific autocommands for compatibility reasons)
let localleader=","

" ===== EASE OF USE =====

" H and L navigate to start or end of line
nnoremap H ^
vnoremap H ^
onoremap H ^
nnoremap L $
vnoremap L $
onoremap L $

" J and K navigate to start or end of screen
nnoremap K H
nnoremap J L

" Shortcutting split navigation, saving a keypress:
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Save with space-w, quit with space-q, both with space wq
nnoremap <space>w :w<cr>
nnoremap <space>q :q<cr>
nnoremap <space>wq :wq<cr>


" Perform :help on the selected word with F1
noremap <F1> K

" Open your vimrc file in a split window for quick edits and reload it
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Unmap q:
nmap q: <nop>

" ===== MISC =====

" Fold an entire paragraph of text
nnoremap <leader>fp zfip

" C-u capitalizes the current word in insert mode
inoremap <c-u> <esc>viwUea 

" Movement 'isp' highlights the current text around spaces (with or without
" them)
onoremap isp :<c-u>normal! T vt <cr>
onoremap asp :<c-u>normal! F<space>vf<space><cr>

"Disable arrow keys in Normal and insert mode
no <Up> <nop>
no <Down> <nop>
no <Left> <nop>
no <Right> <nop>
ino <Up> <nop>
ino <Down> <nop>
ino <Left> <nop>
ino <Right> <nop>
"}}}
"              _                           _ 
"   __ _ _   _| |_ ___   ___ _ __ ___   __| |
"  / _` | | | | __/ _ \ / __| '_ ` _ \ / _` |
" | (_| | |_| | || (_) | (__| | | | | | (_| |
"  \__,_|\__,_|\__\___/ \___|_| |_| |_|\__,_|
"{{{

" For vim files
augroup filetype_vim
     autocmd!
     autocmd FileType vim setlocal foldmethod=marker
augroup END

" For go files
augroup filetype_go
     autocmd!
     autocmd FileType go nnoremap <buffer> <F5> :w<cr> :!go build %<cr>
     autocmd FileType go nnoremap <buffer> <F6> :!./%:r<cr>
     autocmd FileType go nnoremap <buffer> <F7> :w<cr> :!go run %<cr>
     autocmd FileType go inoremap <buffer> <leader>pr fmt.Println()<Left>
augroup END

" For c files
augroup filetype_c
	 autocmd!
	 autocmd FileType c nnoremap <buffer> <F5> :w<cr> :!gcc -ansi -pedantic -Wall -g % -o %:r<cr>
     autocmd FileType c nnoremap <buffer> <F6> :!./%:r<cr>
     autocmd FileType c inoremap <buffer> <leader>c I/*<Esc>A*/<Esc>
     autocmd FileType c inoremap <buffer> <leader>br {<cr>}<Esc>O
     autocmd FileType c iabbrev <buffer> pprintf printf("");<Esc>F"i
     autocmd FileType c iabbrev <buffer> iff if()<cr>{<cr><cr>}<Esc>3kf)i
     autocmd FileType c iabbrev <buffer> ffor for()<cr>{<cr><cr>}<Esc>3kf)i
     autocmd FileType c iabbrev <buffer> wwhile while()<cr>{<cr><cr>}<Esc>3kf)hi
     autocmd FileType c iabbrev <buffer> incl #include <><Esc>i
augroup END

" For html files
augroup filetype_html
     autocmd!
     autocmd FileType html inoremap <buffer> <leader>html <html><cr></html><Esc>O
     autocmd FileType html inoremap <buffer> <leader>hd <head><cr></head><Esc>O
     autocmd FileType html inoremap <buffer> <leader>h2 <h2><cr></h2><Esc>O
     autocmd FileType html inoremap <buffer> <leader>str <strong><cr></strong><Esc>O
     autocmd FileType html inoremap <buffer> <leader>p <p><cr></p><Esc>O
     autocmd FileType html inoremap <buffer> <leader>img <img src=""><Esc>hi
     autocmd FileType html inoremap <buffer> <leader>bd <body><cr></body><Esc>O
     autocmd FileType html inoremap <buffer> <leader>tit <title></title><esc>F<i
	 autocmd FileType html nnoremap <buffer> <buffer> <leader>f zfit
augroup END

" For Python files
augroup filetype_python
    autocmd FileType python nnoremap <buffer> <F5> :w<cr> :!python %<cr>
    autocmd FileType python inoremap <buffer> <leader>p print("")<Esc>hi
augroup END

" For Ruby Files
augroup filetype_ruby
    autocmd FileType ruby set tabstop=2 expandtab smarttab shiftwidth=2
    autocmd FileType ruby nnoremap <buffer> <F5> :w<cr> :!ruby %<cr>
augroup END

" For Haskell Files
augroup filetype_haskell
    autocmd FileType haskell nnoremap <buffer> <F5> :w<cr> :!ghc -Wall -O2 --make -threaded -o %:r %<cr>
    autocmd FileType haskell nnoremap <buffer> <F6> :!./%:r<cr>
    autocmd FileType haskell set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
augroup END

" For Bash scripts
augroup filetype_bash
    autocmd FileType bash nnoremap <buffer> <F5> :w<cr> :!./%<cr> 
augroup END
"}}}

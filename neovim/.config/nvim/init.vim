" ======================
" | neovim config file |
" | Author: risorg     |
" ======================
"        _             _           
"  _ __ | |_   _  __ _(_)_ __  ___ 
" | '_ \| | | | |/ _` | | '_ \/ __|
" | |_) | | |_| | (_| | | | | \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/
" |_|            |___/             
"{{{
"==== PLUGINS ====
call plug#begin('~/.config/nvim/plugged')
     Plug 'tpope/vim-surround'      " Surround text in vim
     Plug 'tpope/vim-repeat'        " Add repeat functionality
     Plug 'mcchrish/nnn.vim'        " nnn as file manager
     Plug 'srcery-colors/srcery-vim' " Srcery theme
     Plug 'jiangmiao/auto-pairs'    " Automatic pairs
     Plug 'axvr/org.vim'            " Org mode plugin 
call plug#end()
"}}}
"          _   _   _                 
" ___  ___| |_| |_(_)_ __   __ _ ___ 
"/ __|/ _ \ __| __| | '_ \ / _` / __|
"\__ \  __/ |_| |_| | | | | (_| \__ \
"|___/\___|\__|\__|_|_| |_|\__, |___/
"                          |___/     
"{{{
" Colors:
" Set true colors
if (has("nvim"))
     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
     set termguicolors
endif

" Settings:
syntax on                                " Enable syntax highlighting
set background=dark                      " Set the background theme to dark
colorscheme srcery                       " Set the colorscheme
set nu relativenumber                    " Enable line (+ relative) numbers
filetype plugin indent on                " Enable plugin indentation
set autoindent cindent                   " Set code autoindentation
set cursorline                           " Highlight current line
set noshowmode                           " Don't show the indicator in insert mode.
set tabstop=4 shiftwidth=4               " One TAB appears to be 4 spaces
set expandtab smarttab                   " Expand tabs into spaces and be smart about it 
set splitbelow splitright                " Splits open at the bottom and right
set completeopt=longest,menuone,noselect " Improve completion menu
set mouse=nicr                           " Smooth mouse scrolling
set ignorecase smartcase                 " Ignore the case of letters only if no Upper case is present
set incsearch                            " Show search while typing
set showmatch                            " Show matching brackets when text indicator is over them
set nohlsearch                           " Don't highlight matches after the search ends 
set inccommand=split                     " Live substitution preview 
set magic                                " Regular expressions on search
set lazyredraw                           " Don't redraw while executing macros
set undofile                             " File with undo history

" Set the backup/undo/swap files location in /tmp
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" Wildmode
set wildmenu
set wildmode=list:longest,full

" Status bar
set statusline=%F%m%r%h%w\ [%04l,%04v]\-[%p%%]\ [%{&ff}]\-%y
"}}}
"                              _                 
"  _ __ ___   __ _ _ __  _ __ (_)_ __   __ _ ___ 
" | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __|
" | | | | | | (_| | |_) | |_) | | | | | (_| \__ \
" |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
"                 |_|   |_|            |___/     
"{{{
" Set the map leader to , (used in global maps)
let mapleader=" " 
" Set the local map leader to , (used in specific autocommands for compatibility reasons)
let localleader=" "

" Navigate to start or end of screen
nnoremap K H
nnoremap J L

" Perform :help on the selected word
noremap <F1> K

" Unmap q:
nmap q: <nop>

"Navigate to start or end of line
nnoremap H ^
vnoremap H ^
onoremap H ^
nnoremap L $
vnoremap L $
onoremap L $

" Move along visual lines, not numbered ones
nnoremap j gj
nnoremap k gk
nnoremap ^ g^
nnoremap $ g$
vnoremap j gj
vnoremap k gk
vnoremap ^ g^
vnoremap $ g$

" Shortcutting split navigation, saving a keypress:
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l

" Save keystrokes on save/quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>eq :q!<cr>
nnoremap <leader>ew :wq<cr>

" Split keybindings
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>sv :split<cr>

" Tab keybindings
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>

" Buffer keybindings
nnoremap <leader>bq :bd!<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

" Open your vimrc file in a split window for quick edits and reload it
nnoremap <leader>ve :vsp $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" Find a file with spc-f
nnoremap <leader>f :NnnPicker<cr>

" Capitalize the current word in insert mode
inoremap <A-u> <esc>viwUea 

" Disable highlighting
nnoremap <space>h :noh<cr>

" C-k and C-c exits insert mode correctly
nnoremap <c-c> <esc>
inoremap <c-c> <esc>
vnoremap <c-c> <esc>
onoremap <c-c> <esc>

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

" Reload the file when focus is regained
autocmd FocusGained * :checktime

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
	 autocmd FileType c nnoremap <buffer> <F5> :w<cr> :!gcc -ansi -pedantic -Wall -static -g % -o %:r<cr>
         autocmd FileType c nnoremap <buffer> <F6> :!./%:r<cr>
         autocmd FileType c set tabstop=8 shiftwidth=8
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
augroup END

" For Bash scripts
augroup filetype_bash
    autocmd FileType bash nnoremap <buffer> <F5> :w<cr> :!./%<cr> 
augroup END
"}}}
"  __                  _   _                 
" / _|_   _ _ __   ___| |_(_) ___  _ __  ___ 
"| |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
"|  _| |_| | | | | (__| |_| | (_) | | | \__ \
"|_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
"{{{

" Clear whitespace
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
"}}}

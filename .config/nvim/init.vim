" ======================
" | neovim config file |
" | Author: Risorg     |
" ======================
"                                  _ 
"   __ _  ___ _ __   ___ _ __ __ _| |
"  / _` |/ _ \ '_ \ / _ \ '__/ _` | |
" | (_| |  __/ | | |  __/ | | (_| | |
"  \__, |\___|_| |_|\___|_|  \__,_|_|
"  |___/  
"{{{
"
" Colors:
" Set true colors
if (has("nvim"))
     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
     set termguicolors
endif

set nu relativenumber " Enable line (+ relative) numbers
set background=dark " Set the background theme to dark
syntax enable " Enable syntax highlighting
colorscheme default " Set the colorscheme
set autoindent smartindent cindent " Set code autoindentation
set tabstop=4 expandtab smarttab shiftwidth=4 " One TAB appears to be 4 spaces
set splitbelow splitright " Splits open at the bottom and right
set showmode " Don't show the indicator in insert mode.
set completeopt=longest,menuone,noselect " Improve completion menu
set textwidth=80 " Set max text in a line to 80
set mouse=nicr " Smooth mouse scrolling

" Set the backup/undo/swap files location in /tmp
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

set ignorecase smartcase " Ignore the case of letters only if no Upper case is present
"set incsearch hlsearch " Show search while typing and highlight everything
set hlsearch
set showmatch " Show matching brackets when text indicator is over them

"Wildmode
set wildmenu
set wildmode=list:longest,full

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

" Perform :help on the selected word with F1
noremap <F1> K

" open your vimrc file in a split window for quick edits and reload it
nnoremap <leader>ev :vsp $MYVIMRC<c>
nnoremap <leader>es :source $MYVIMRC<cr>

" Unmap q:
nmap q: <nop>

" ===== MISC =====

" Fold an entire paragraph of text
nnoremap <leader>fp Vapzf
" C-u capitalizes the current word in insert mode
inoremap <c-u> <esc>viwUea 
" Movement 'isp' highlights the current text around spaces (with or without
" them)
onoremap isp :<c-u>normal! T<space>vt<space><CR>
onoremap asp :<c-u>normal! F<space>vf<space><CR>

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

"}}}

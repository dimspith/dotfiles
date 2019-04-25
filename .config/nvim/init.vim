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

call plug#begin('~/.config/nvim/plugged')
     Plug 'w0rp/ale' " Code linting
     Plug 'tpope/vim-surround' " Surround text in vim
     Plug 'tpope/vim-repeat' " Add repeat (.) functionality to many actions
     Plug 'scrooloose/nerdtree' " File browser
     Plug 'junegunn/goyo.vim' " Distraction free text centering
     Plug 'lifepillar/vim-mucomplete' " Simple vim Autocomplete
     Plug 'itchyny/lightline.vim' " Alternative status bar
     Plug 'drewtempelmeyer/palenight.vim' " Palenight colorscheme (Atom)
     Plug 'morhetz/gruvbox' " Gruvbox Colorscheme
     Plug 'tpope/vim-fugitive' "The most awesome git wrapper
call plug#end()

" ==== PLUGIN SETTINGS ====
let g:lightline = {'colorscheme': 'deus'} " Set lightline theme

map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1

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
syntax enable " Enable syntax highlighting
colorscheme gruvbox " Set the colorscheme
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

let mapleader="," " Set the map leader to , (used in global maps)
let localleader="," " Set the local map leader to , (used in specific autocommands for compatibility reasons)

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

" Save with Ctrl-S
noremap <C-s> :w<CR>

" Perform :help on the selected word with F1
noremap <F1> K

" Open your vimrc file in a split window for quick edits and reload it
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Unmap q:
nmap q: <nop>

" ===== MISC =====

" Fold an entire paragraph of text
nnoremap <leader>fp Vapzfj
" C-u capitalizes the current word in insert mode
inoremap <c-u> <esc>viwUea 
" Movement 'isp' highlights the current text around spaces (with or without
" them)
onoremap isp :<c-u>normal! T<space>vt<space><cr>
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
" 

" For go files
augroup filetype_go
     autocmd!
     autocmd FileType go nnoremap <F5> :w<CR> :!go build %<CR>
     autocmd FileType go nnoremap <F6> :!./%:r<CR>
     autocmd FileType go nnoremap <F7> :w<CR> :!go run %<CR>
     autocmd FileType go inoremap <leader>pr fmt.Println()<Left>
augroup END

" For c files
augroup filetype_c
	autocmd!
	autocmd FileType c nnoremap <buffer> <F5> :w<CR> :!gcc -ansi -pedantic -Wall -g % -o %:r<CR>
     autocmd FileType c nnoremap <F6> :!./%:r<CR>
     autocmd FileType c nnoremap <leader>c I/*<Esc>A*/<Esc>
     autocmd FileType c nnoremap <leader>br {<CR>}<Esc>O
     autocmd FileType c iabbrev pprintf printf("");<Esc>F"i
     autocmd FileType c iabbrev iff if()<CR>{<CR><CR>}<Esc>3kf)i
     autocmd FileType c iabbrev ffor for()<CR>{<CR><CR>}<Esc>3kf)i
     autocmd FileType c iabbrev wwhile while()<CR>{<CR><CR>}<Esc>3kf)hxi
     autocmd FileType c iabbrev incl #include <><Esc>i
augroup END

" For html files
augroup filetype_html
     autocmd!
     autocmd FileType html inoremap <leader>html <html><CR></html><Esc>O
     autocmd FileType html inoremap <leader>hd <head><CR></head><Esc>O
     autocmd FileType html inoremap <leader>h2 <h2><CR></h2><Esc>O
     autocmd FileType html inoremap <leader>str <strong><CR></strong><Esc>O
     autocmd FileType html inoremap <leader>p <p><CR></p><Esc>O
     autocmd FileType html inoremap <leader>img <img src=""><Esc>hi
     autocmd FileType html inoremap <leader>bd <body><CR></body><Esc>O
     autocmd FIleType html inoremap <leader>tit <title></title><esc>F<i
	 autocmd FileType html nnoremap <buffer> <leader>f zfit
augroup END

"}}}

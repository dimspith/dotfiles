"==== PLUG ====
call plug#begin('~/.config/nvim/plugged')
" Functionality
Plug 'w0rp/ale' " Code linting
Plug 'tpope/vim-surround' " Surround text in vim
Plug 'tpope/vim-repeat' " Adds repeat (.) functionality to many things
Plug 'scrooloose/nerdtree' " File browser
Plug 'junegunn/goyo.vim' " Distraction free text centering
" Appearance
Plug 'itchyny/lightline.vim' " Alternative status bar
Plug 'drewtempelmeyer/palenight.vim' " Material dark colorscheme
Plug 'sickill/vim-monokai' " Monokai Colorscheme
Plug 'ayu-theme/ayu-vim' " Ayu Colorscheme
call plug#end()

" ==== PLUGIN SETTINGS ====
let g:lightline = {'colorscheme': 'molokai'} " Set lightline theme
map <C-n> :NERDTreeToggle<CR> " Nerdtree Keybinding
let ayucolor="light" " Set Ayu colorscheme to light theme


"===== EDITOR =====
let mapleader="," " Set the map leader to ,
set nu " Enable line numbers
set relativenumber " Enable relative line numbers
set background=dark " Set the background theme to dark
colorscheme monokai " Set the colorscheme
set autoindent " Set code autoindentation
set cursorline " Highlight current line
set tabstop=5 " One TAB appears to be 4 spaces
set expandtab " don't use actual tab character (ctrl-v)
set shiftwidth=5 " indenting is 4 spaces
set autoindent " turns it on
set smartindent " does the right thing (mostly) in programs
set cindent " stricter rules for C programs
set splitbelow splitright " Splits open at the bottom and right
set noshowmode " Don't show the indicator in insert mode.

" Set the backup/undo/swap files to be in /tmp
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

set ruler " Always show current position
set ignorecase " Ignore case when searching
set smartcase " Smart Casing
set hlsearch " Highlight search results
set incsearch " Modern search
set showmatch " Show matching brackets when text indicator is over them
syntax enable " Enable syntax highlighting

" Set true colors
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=2
endif
if (has("termguicolors"))
  set termguicolors
endif

"Wildmode
set wildmenu
set wildmode=list:longest,full

" H and L navigate to start or end of line
nnoremap H ^
nnoremap L $

" J and K navigate to start or end of screen
nnoremap K H
nnoremap J L

nnoremap <C-J> J
nnoremap <F2> K

" Alt+Direction moves 6 spaces.
nnoremap <A-h> 5h
nnoremap <A-j> 5j
nnoremap <A-k> 5k
nnoremap <A-l> 5l

"===== KEY REMAPS =====

" General Maps
map <C-h> <C-w>h " Shortcutting split navigation, saving a keypress:
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" autocmd BufWritePre * %s/\s\+$//e  Strip trailing whitespace on file save
map <F3> :%s/\s\+$//e " Strip trailing whitespace with F2
map <C-s> :w<CR> " Save with Ctrl-S



" Go Specific
autocmd FileType go nnoremap <F5> :w<CR> :!go build %<CR>
autocmd FileType go nnoremap <F6> :!./%:r<CR>
autocmd FileType go nnoremap <F7> :w<CR> :!go run %<CR>
autocmd FileType go inoremap ,pr fmt.Println()<Left>

" C Specific
autocmd FileType c nnoremap <F5> :w<CR> :!gcc -ansi -pedantic -Wall -g % -o %:r<CR>
autocmd FileType c nnoremap <F6> :!./%:r<CR>
autocmd FileType c inoremap ,pr printf("");<Esc>F"i
autocmd FileType c inoremap ,if if()<CR>{<CR><CR>}<Esc>4kf)i
autocmd FileType c inoremap ,fr for(int i = 1;;i++)<CR>{<CR><CR>}<Esc>3kf;a
autocmd FileType c inoremap ,wl while()<CR>{<CR><CR>}<Esc>4kf)i
" autocmd FileType c inoremap ,instr char c;<CR>while(c!=EOF)<CR>{<CR>c=getchar();<CR>}<Esc>O
autocmd FileType c inoremap ,incl #include <><Esc>i
autocmd FileType c map <leader>c I/*<Esc>A*/<Esc>
autocmd FileType c inoremap ,br {<CR>}<Esc>O

"===== EDITOR =====
let mapleader=","
set nu " Enable line numbers
set relativenumber " Enable relative line numbers
set background=dark " Set the background theme to dark
colorscheme desert " Set the colorscheme to desert
set autoindent " Set code autoindentation
set cursorline " Highlight current line
set tabstop=4 " One TAB appears to be 4 spaces
set expandtab " don't use actual tab character (ctrl-v)
set shiftwidth=4 " indenting is 4 spaces
set autoindent " turns it on
set smartindent " does the right thing (mostly) in programs
set cindent " stricter rules for C programs
set splitbelow splitright " Splits open at the bottom and right

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

"Wildmode
set wildmenu
set wildmode=list:longest,full

"===== KEY REMAPS =====
" General Maps
map <C-h> <C-w>h " Shortcutting split navigation, saving a keypress:
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
autocmd BufWritePre * %s/\s\+$//e " Strip trailing whitespace on file save
map <C-s> :w<CR> " Save with Ctrl-S

" C Specific
autocmd FileType c nnoremap <F5> :w<CR> :!gcc -ansi -pedantic -Wall % -o %:r<CR>
autocmd FileType c nnoremap <F6> :!./%:r<CR>
autocmd FileType c inoremap ,pr printf("");<Esc>F"i
autocmd FileType c inoremap ,if if()<CR>{<CR><CR>}<Esc>3kf)i
autocmd FileType c inoremap ,fr for(int i = 0;;i++)<CR>{<CR><CR>}<Esc>3kf;a
autocmd FileType c inoremap ,wl while()<CR>{<CR><CR>}<Esc>3kf)i
autocmd FileType c inoremap ,instr char c;<CR>while(c!=EOF)<CR>{<CR>c=getchar();<CR>}<Esc>O
autocmd FileType c inoremap ,incl #include <><Esc>i
autocmd FileType c map <leader>c I/*<Esc>A*/<Esc>0

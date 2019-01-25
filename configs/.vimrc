set nu			" Enable line numbers
set relativenumber	" Enable relative line numbers

set background=dark	" Set the background theme to dark
colorscheme desert	" Set the colorscheme to desert

set autoindent		" Set code autoindentation
set cursorline    	" Highlight current line
set tabstop=4     	" One TAB appears to be 4 spaces
set expandtab       " don't use actual tab character (ctrl-v)
set shiftwidth=4    " indenting is 4 spaces
set autoindent      " turns it on
set smartindent     " does the right thing (mostly) in programs
set cindent         " stricter rules for C programs

" Set the backup/undo/swap files to be in /tmp 
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" Always show current position
set ruler

" Ignore case when searching and be smart
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Modern search
set incsearch


" Show matching brackets when text indicator is over them
set showmatch

" Enable syntax highlighting
syntax enable

" 

" let pasting content from system clipboard
set clipboard+=unnamedplus

" disable arrow keys
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" no swap file
set noswapfile

" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

" set line number
set number

" use 4 spaces instead of tabs
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

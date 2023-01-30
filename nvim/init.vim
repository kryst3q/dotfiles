" let pasting content from system clipboard
set clipboard+=unnamedplus

" disable arrow keys
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
noremap <silent> <c-s> :w<CR>

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
set nofoldenable

" NERDTree configuration
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Set polish language for spelling check
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
set spelllang=pl

" todo: refactor this (function name, add keybindings, store function in
" separate file etc.)
fu! EnableSpellcheck(lang)
    let &l:spelllang = a:lang
    :EnableAutocorrect
endf

command! -nargs=0 EnablePlAutocorrect call EnableSpellcheck('pl')
command! -nargs=0 EnableEnAutocorrect call EnableSpellcheck('en')

" vim-plug plugins list
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sedm0784/vim-you-autocorrect'
call plug#end()


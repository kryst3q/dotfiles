" let pasting content from system clipboard
set clipboard+=unnamedplus

" disable arrow keys
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" add shortcut fot saving document changes
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

" disable mode displaying - now lightline is doing it
set noshowmode

" NERDTree configuration
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <S-f> :NERDTreeFind<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Markdown formatting shortcuts
autocmd FileType markdown,octopress let g:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown,octopress let g:surround_{char2nr('b')} = "**\r**"
autocmd FileType markdown,octopress let g:surround_{char2nr('s')} = "~~\r~~"

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

" everforest theme configuration
" Important!!
if has('termguicolors')
  set termguicolors
endif

if system('xfconf-query -c xsettings -p /Net/ThemeName') =~ '-dark'
    set background=dark
else
    set background=light
endif

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'hard'

" For better performance
let g:everforest_better_performance = 1


" vim-plug plugins list
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sedm0784/vim-you-autocorrect'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'preservim/vim-markdown'
Plug 'mechatroner/rainbow_csv'
Plug 'sainnhe/everforest'
Plug 'itchyny/lightline.vim'
Plug 'amiorin/vim-project'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'preservim/tagbar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " Preview markdown file in browser
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'phpactor/phpactor'
" syntax highlighting
Plug 'PotatoesMaster/i3-vim-syntax' " i3 config
Plug 'chr4/nginx.vim' " nginx
Plug 'wgwoods/vim-systemd-syntax' " systemd
call plug#end()

colorscheme everforest

" Generate ctags every time php file will be saved
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" configure searching
let $FZF_DEFAULT_COMMAND = 'find .'
nnoremap <leader>f :Files<CR>
nnoremap <leader>a :Ag<CR>

" configure php language support
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" gd to go to definition
nmap <silent> gd <Plug>(coc-definition)
" gr to go to reference
nmap <silent> gr <Plug>(coc-references)

" configure shortcut for displaying given class methods and properties
nmap <F9> :TagbarToggle<CR>

" configure snippets shortcuts
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'preservim/tagbar'
" Preview markdown file in browser
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} 
Plug 'neovim/nvim-lspconfig'
" snippets engine
Plug 'SirVer/ultisnips'
" snippets for different languages
Plug 'honza/vim-snippets'
" middleware between snippets engine and cmp
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'rest-nvim/rest.nvim'
Plug 'tpope/vim-dadbod'
Plug 'Hoffs/omnisharp-extended-lsp.nvim'
" syntax highlighting
Plug 'PotatoesMaster/i3-vim-syntax' " i3 config
Plug 'chr4/nginx.vim' " nginx
Plug 'wgwoods/vim-systemd-syntax' " systemd
call plug#end()

colorscheme everforest

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" configure searching
let $FZF_DEFAULT_COMMAND = 'find .'
nnoremap <leader>f :Files<CR>
nnoremap <leader>a :Ag<CR>

" configure shortcut for displaying given class methods and properties
nmap <F9> :TagbarToggle<CR>

" rest.nvim configuration
nmap <leader>hr <Plug>RestNvim<CR>
nmap <leader>hp <Plug>RestNvimPreview<CR>
nmap <leader>hl <Plug>RestNvimLast<CR>

function MyFugitiveHead()
  let head = FugitiveHead()
  if head != ""
    let head = "\uf126 " .. head
  endif
  return head
endfunction

let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'MyFugitiveHead'
    \ },
    \}

lua <<EOF
    require('cmp_nvim_ultisnips').setup{}

    -- Set up nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-l>'] = cmp.mapping(function(fallback) -- Jump to the next placeholder in the snippet
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, {'i', 's'}),
        ['<C-h>'] = cmp.mapping(function(fallback) -- Jump to the previous placeholder in the snippet
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {'i', 's'}),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' }, -- For ultisnips users.
      }, {
        { name = 'buffer' },
      })
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    
    -- Setup language servers.
    local lspconfig = require('lspconfig')
    lspconfig.pylsp.setup {
      capabilities = capabilities,
    }
    lspconfig.phpactor.setup{
      capabilities = capabilities,
    }
    lspconfig.jdtls.setup{
      capabilities = capabilities,
    }
    
    lspconfig.omnisharp.setup {
      cmd = { "/usr/bin/dotnet", "/home/tui/Biblioteki/omnisharp/OmniSharp.dll" },

      handlers = { ["textDocument/definition"] = require('omnisharp_extended').handler },
  
      capabilities = capabilities,
      
      -- Enables support for reading code style, naming convention and analyzer
      -- settings from .editorconfig.
      enable_editorconfig_support = true,
  
      -- If true, MSBuild project system will only load projects for files that
      -- were opened in the editor. This setting is useful for big C# codebases
      -- and allows for faster initialization of code navigation features only
      -- for projects that are relevant to code that is being edited. With this
      -- setting enabled OmniSharp may load fewer projects and may thus display
      -- incomplete reference lists for symbols.
      enable_ms_build_load_projects_on_demand = false,
  
      -- Enables support for roslyn analyzers, code fixes and rulesets.
      enable_roslyn_analyzers = false,
  
      -- Specifies whether 'using' directives should be grouped and sorted during
      -- document formatting.
      organize_imports_on_format = false,
  
      -- Enables support for showing unimported types and unimported extension
      -- methods in completion lists. When committed, the appropriate using
      -- directive will be added at the top of the current file. This option can
      -- have a negative impact on initial completion responsiveness,
      -- particularly for the first few completion sessions after opening a
      -- solution.
      enable_import_completion = false,
  
      -- Specifies whether to include preview versions of the .NET SDK when
      -- determining which version to use for project loading.
      sdk_include_prereleases = true,
  
      -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
      -- true
      analyze_open_documents_only = false,
    }

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
    
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
    
    -- omnisharp error workaraound. @see: https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1546721190
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local function toSnakeCase(str)
          return string.gsub(str, "%s*[- ]%s*", "_")
        end
    
        if client.name == 'omnisharp' then
          local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
          for i, v in ipairs(tokenModifiers) do
            tokenModifiers[i] = toSnakeCase(v)
          end
          local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
          for i, v in ipairs(tokenTypes) do
            tokenTypes[i] = toSnakeCase(v)
          end
        end
      end,
    })

    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { "http", "json", "lua", "vim", "vimdoc", "query" },
    
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
    
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
    
      -- List of parsers to ignore installing (for "all")
      ignore_install = { "javascript" },
    
      ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
      -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
    
      highlight = {
        enable = true,
    
        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = { "php", "java", "cs" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }

    require'rest-nvim'.setup{
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = '.env.local',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    }
EOF

let local_config = stdpath('config') . '/local.vim'
if filereadable(local_config)
    execute 'source ' . local_config
endif


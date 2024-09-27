-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.keys.normal_mode["H"] = "<cmd>bprevious<cr>"
lvim.keys.normal_mode["L"] = "<cmd>bnext<cr>"

vim.g.test_java_runner = "maventest"

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "intelephense" })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "phpactor"
end, lvim.lsp.automatic_configuration.skipped_servers)

lvim.plugins = {
  {
    "MunifTanjim/exrc.nvim",
    config = function()
      require("exrc").setup({
        files = {
          ".nvimrc.lua",
          ".nvimrc",
          ".exrc.lua",
          ".exrc",
        },
      })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIFindBuffer" },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "vim-test/vim-test",
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    -- opts = {
    --   jdtls = function(opts)
    --     local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
    --     local jvmArg = "-javaagent:" .. install_path .. "/lombok.jar"
    --     table.insert(opts.cmd, "--jvm-arg=" .. jvmArg)
    --     return opts
    --   end,
    -- },
    -- config = function()
    --   local bundles = {}
    --   local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
    --   vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
    --   vim.list_extend(
    --     bundles,
    --     vim.split(
    --       vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
    --       "\n"
    --     )
    --   )
    --   local options = require("jdtls.setup").get_default_config()
    --   options.init_options.bundles = bundles
    --   require("jdtls").start_or_attach(options)
    -- end
  },
  {
    "wfxr/protobuf.vim",
    ft = { "proto" },
  },
  {
    "hudclark/grpc-nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    ft = "grpc",
  },
  -- {
  --   "rest-nvim/rest.nvim",
  --   -- commit = "8b62563",
  --   dependencies = {
  --     { "nvim-lua/plenary.nvim" }
  --   },
  --   prefix = "",
  --   ft = "http",
  --   config = function()
  --     require("rest-nvim").setup({
  --       -- Open request results in a horizontal split
  --       result_split_horizontal = false,
  --       -- Keep the http file buffer above|left when split horizontal|vertical
  --       result_split_in_place = false,
  --       -- Skip SSL verification, useful for unknown certificates
  --       skip_ssl_verification = false,
  --       -- Encode URL before making request
  --       encode_url = true,
  --       -- Highlight request on run
  --       highlight = {
  --         enabled = true,
  --         timeout = 150,
  --       },
  --       result = {
  --         -- toggle showing URL, HTTP info, headers at top the of result window
  --         show_url = true,
  --         -- show the generated curl command in case you want to launch
  --         -- the same request via the terminal (can be verbose)
  --         show_curl_command = false,
  --         show_http_info = true,
  --         show_headers = true,
  --         -- executables or functions for formatting response body [optional]
  --         -- set them to false if you want to disable them
  --         formatters = {
  --           json = "jq",
  --           html = function(body)
  --             return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
  --           end,
  --         },
  --       },
  --       -- Jump to request line on run
  --       jump_to_request = false,
  --       env_file = ".env.local",
  --       custom_dynamic_variables = {},
  --       yank_dry_run = true,
  --       ft = { "http" },
  --     })
  --   end,
  -- },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    }
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim", "j-hui/fidget.nvim" },
    config = function()
      -- require("rest-nvim").setup({
      --   env = {
      --     pattern = ".*/Rest/.*%.env.*",
      --   },
      -- })
      -- show which env file is loaded in the status bar
      lvim.builtin.lualine.sections.lualine_x = { "rest" }
      -- first load extension
      require("telescope").load_extension("rest")
    end,
  },
  {
    "tpope/vim-projectionist",
  },
  -- Search & replace
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
      },
      {
        "kkharji/sqlite.lua",
        module = "sqlite",
      }
    },
    config = function()
      require('neoclip').setup({
        enable_persistent_history = false,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      })
      require('telescope').load_extension('neoclip')
    end,
  },
  {
    "mechatroner/rainbow_csv",
  },
  {
    "73/vim-klog",
    ft = "klog",
  },
  {
    "freitass/todo.txt-vim",
    ft = "todo",
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      {
        "aklt/plantuml-syntax",
        ft = "plantuml",
      },
      {
        "tyru/open-browser.vim",
      },
    },
    ft = "plantuml",
  },
  {
    "vinnymeller/swagger-preview.nvim",
    build = "npm install -g swagger-ui-watcher",
    cmd = "SwaggerPreview",
    config = function()
      require("swagger-preview").setup({
        -- The port to run the preview server on
        port = 9876,
        -- The host to run the preview server on
        host = "localhost",
      })
    end,
  },
  {
    "normen/vim-pio",
  },
  {
    "salkin-mada/openscad.nvim",
    config = function()
      require('openscad')
      -- load snippets, note requires
      vim.g.openscad_load_snippets = true
    end,
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
      },
    },
    ft = "openscad",
  },
  {
    "jghauser/follow-md-links.nvim",
    ft = "markdown",
  },
  {
    "zaid/vim-rec",
    ft = "rec",
  },
  {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function() require("lazydocker").setup {} end,
    event = "BufRead", -- or any other event you might want to use.
  },
  {
    "tpope/vim-fugitive",
  },
  -- {
  --   "preservim/vim-markdown",
  --   dependencies = {
  --     {
  --       "godlygeek/tabular",
  --     },
  --   },
  --   ft = "markdown",
  --   config = function ()
  --     vim.g.vim_markdown_folding_disabled = 1
  --   end
  -- },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = 'secret-tool lookup apikey lvim-chatgpt',
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

lvim.autocommands = {
  {
    "FileType",
    {
      pattern = { "sql", "mysql", "plsql" },
      callback = function()
        require("cmp").setup.buffer({
          sources = {
            { name = "vim-dadbod-completion" },
          },
        })
      end,
    },
  },
}

lvim.builtin.nvimtree.setup.view.width = 50

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["a"] = {
  name = "Alternate",
  a = { "<cmd>A<cr>", "Switches to the corresponding file header" },
  s = { "<cmd>AS<cr>", "Splits and switches" },
  v = { "<cmd>AV<cr>", "Vertical splits and switches" },
  t = { "<cmd>AT<cr>", "New tab and switches" },
  -- n = {"<cmd>AN<cr>", "Cycles through matches"}, -- Error: AN is not an editor command
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Tests",
  t = { "<cmd>TestNearest<cr>", "Run the test nearest to the cursor" },
  -- T = { "<cmd>TestFile<cr>", "Run the first test class found on the same line as or above the cursor" },
  a = { "<cmd>TestSuite<cr>", "Run the whole test suite" },
  l = { "<cmd>TestLast<cr>", "Run the last test" },
  g = { "<cmd>TestLast<cr>", "Visit the test file from which you last run your tests" },
  -- TODO: add debug mode toggle
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').toggle()<cr>", "Toggle replace" },
  a = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace current word everywhere" },
  f = { "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>", "Replace current word in file" },
}

lvim.builtin.which_key.mappings["v"] = {
  name = "Lazydocker",
  l = { "<cmd>Lazydocker<cr>", "Open" },
}

lvim.builtin.which_key.mappings["y"] = {
  name = "Clipboard",
  cmd = "<cmd>Telescope neoclip<cr>",
}

table.insert(
  lvim.builtin.alpha.dashboard.section.buttons.entries,
  { "s", "  Open Last Session", "<cmd>lua require('persistence').load()<cr>" }
)

lvim.builtin.treesitter.ensure_installed = {
  "java",
  "php",
  "bash",
  "json",
  "html",
  "http",
  "c_sharp",
  "markdown",
  "markdown_inline",
  "lua",
  "xml",
  "graphql",
}
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "References" }
lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" }
lvim.lsp.buffer_mappings.normal_mode["gI"] = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" }

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "intelephense" })

function GrepInputString()
  local default = vim.api.nvim_eval([[expand("<cword>")]])
  local input = vim.fn.input({
    prompt = "Search for: ",
    default = default,
  })
  require("telescope.builtin").grep_string({ search = input })
end

lvim.builtin.which_key.mappings["sT"] = { "<cmd>lua GrepInputString()<CR>", "Text under cursor" }

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

lvim.builtin.which_key.mappings["i"] = {
  name = "ChatGPT",
  c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
  e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
  g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
  t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
  k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
  d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
  a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
  o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
  s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
  f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
  x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
  r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
  l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
}

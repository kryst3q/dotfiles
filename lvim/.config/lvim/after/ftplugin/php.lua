local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "phpcsfixer" },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "phpstan" },
}


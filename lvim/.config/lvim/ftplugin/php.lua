lvim.builtin.dap.active = true;

local dap = require('dap')
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.glob(vim.fn.stdpath "data" .. "/mason/") .. 'packages/php-debug-adapter/extension/out/phpDebug.js' }
}
dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug (docker)',
    port = 9000,
    log = true,
    pathMappings = {
      ["/srv/"] = "${workspaceFolder}"
    }
  },
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for xdebug (local)',
    port = 9003,
    log = true,
  },
}

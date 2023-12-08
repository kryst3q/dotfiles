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
    name = 'Listen for Xdebug',
    port = 9000,
    log = true,
    pathMappings = {
      ["/srv/"] = "${workspaceFolder}"
    }
  }
}

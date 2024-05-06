lvim.builtin.dap.active = true;

local dap = require('dap')
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "9229",
  -- port = "${port}",
  executable = {
    command = 'node',
    args = { vim.fn.glob(vim.fn.stdpath "data" .. "/mason/") .. 'packages/js-debug-adapter/js-debug/src/dapDebugServer.js', "9229" },
    -- args = { vim.fn.glob(vim.fn.stdpath "data" .. "/mason/") .. 'packages/js-debug-adapter/js-debug/src/dapDebugServer.js', "${port}" },
  },
}
dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    pathMappings = {
      ["/"] = "${workspaceFolder}"
    },
  },
}

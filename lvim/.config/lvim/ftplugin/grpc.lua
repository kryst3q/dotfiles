local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  c = {
    name = "Grpc",
    r = { "<Plug>Grpc", "Perform request under the cursor" },
  },
}

which_key.register(mappings, opts)


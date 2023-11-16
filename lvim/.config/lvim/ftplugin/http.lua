-- Define a custom function
function SelectEnvFile()
  local current_directory = vim.fn.expand("%:p:h")
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"

  -- Use Telescope to display the list of env files and select one
  require('telescope.builtin').find_files({
    prompt_title = "Select .env file",
    cwd = current_directory,
    hidden = true,
    file_ignore_patterns = { "\\.git/.*" }, -- Exclude Git files
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<CR>', function()
        local selection = action_state.get_selected_entry()
        vim.api.nvim_cmd({ cmd = "RestSelectEnv", args = { selection.cwd .. "/" .. selection.value } },
          { output = false })
        actions.close(prompt_bufnr)
      end)
      return true
    end,
  })
end

-- Create a command that triggers the custom function
vim.cmd("command! SelectEnvFile lua SelectEnvFile()")


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
  h = {
    name = "Http",
    r = { "<Plug>RestNvim", "Perform request under the cursor" },
    p = { "<Plug>RestNvimPreview", "Preview the request cURL command" },
    l = { "<Plug>RestNvimLast", "Re-run the last request" },
    -- v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
    -- c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
    -- t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
    -- T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
    -- u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
  },
}

which_key.register(mappings, opts)

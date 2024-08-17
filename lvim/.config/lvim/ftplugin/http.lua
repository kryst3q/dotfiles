-- -- Define a custom function
-- function SelectEnvFile()
--   local current_directory = vim.fn.expand("%:p:h")
--   local actions = require "telescope.actions"
--   local action_state = require "telescope.actions.state"

--   -- Use Telescope to display the list of env files and select one
--   require('telescope.builtin').find_files({
--     prompt_title = "Select .env file",
--     cwd = current_directory,
--     hidden = true,
--     file_ignore_patterns = { "\\.git/.*" }, -- Exclude Git files
--     attach_mappings = function(prompt_bufnr, map)
--       map('i', '<CR>', function()
--         local selection = action_state.get_selected_entry()
--         vim.api.nvim_cmd({ cmd = "RestSelectEnv", args = { selection.cwd .. "/" .. selection.value } },
--           { output = false })
--         actions.close(prompt_bufnr)
--       end)
--       return true
--     end,
--   })
-- end

-- -- Create a command that triggers the custom function
-- vim.cmd("command! SelectEnvFile lua SelectEnvFile()")


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
    r = { "<cmd>Rest run<cr>", "Perform request under the cursor" },
    l = { "<cmd>Rest last<cr>", "Re-run the last request" },
    e = { "<cmd>Telescope rest select_env<cr>", "Select environment" },
  },
}

which_key.register(mappings, opts)

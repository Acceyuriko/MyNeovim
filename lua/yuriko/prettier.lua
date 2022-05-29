local M = {}

function M:setup()
  vim.g['prettier#exec_cmd_async'] = 1
end

return M

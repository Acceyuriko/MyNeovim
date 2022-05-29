local M = {}

function M:setup()
  local opts = { noremap = true, silent = true }

  require('gitsigns').setup {}
  require('git-conflict').setup {}

  vim.api.nvim_set_keymap('n', '<leader>dfo', '<cmd>DiffviewOpen<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>dfc', '<cmd>DiffviewClose<cr>', opts);
end

return M

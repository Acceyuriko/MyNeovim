local M = {}

function M:setup()
  local opts = { noremap = true, silent = true }

  require('gitsigns').setup {
    current_line_blame = true,
  }
  require('git-conflict').setup {}

  vim.api.nvim_set_keymap('n', '<leader>dfo', '<cmd>DiffviewOpen<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>dfc', '<cmd>DiffviewClose<cr>', opts);
end

return M

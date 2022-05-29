local M = {}

function M:setup()
  local opts = { noremap = true, silent = true }

  require('which-key').setup {}


  require('autosave').setup({
    enabled = true,
  })

  vim.api.nvim_set_keymap('n', '<leader>sr', '<cmd>lua require("spectre").open_file_search()<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>sra', '<cmd>lua require("spectre").open()<cr>', opts);
end

return M

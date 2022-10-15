local M = {}

function M:setup()
  local opts = { noremap = true, silent = true }

  require('which-key').setup {}

  require('spectre').setup {
    mapping = {
      ['run_current_replace'] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        desc = "replace current line"
      },
      ['enter_file'] = {
        map = "o",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "goto current file"
      },
    }
  }

  vim.api.nvim_set_keymap('n', '<leader>sr', '<cmd>lua require("spectre").open_file_search()<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>sra', '<cmd>lua require("spectre").open()<cr>', opts);
end

return M

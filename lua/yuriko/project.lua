local M = {}

function M:setup()
  local opts = { noremap = true, silent = true }
  require('project_nvim').setup {}

  require('nvim-tree').setup {
    view = {
      width = 60
    },
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    }
  }
  vim.cmd([[highlight NvimTreeFolderIcon guibg=true]])
  vim.api.nvim_set_keymap('n', '<a-1>', '<cmd>NvimTreeToggle<cr>', opts);
end

return M

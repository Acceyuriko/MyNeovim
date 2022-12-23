local M = {}

function M:setup()
  local opts = { noremap = true, silent = true }
  local previewers = require('telescope.previewers');

  require('telescope').setup({
    defaults = {
      layout_strategy = 'vertical',
      layout_config = {
        vertical = { width = 0.95, height = 0.95 },
      },
      buffer_previewer_maker = function(filepath, bufnr, opts)
        filepath = vim.fn.expand(filepath)
        vim.loop.fs_stat(filepath, function(_, stat)
          if not stat then return end
          if stat.size > 100000 then
            return
          else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          end
        end)
      end
    }
  })
  require('telescope').load_extension('projects')
  require('telescope').load_extension('fzf')
  require('telescope').load_extension('ui-select')
  vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>fa',
    '<cmd>'
    .. 'lua require("telescope.builtin").find_files({'
    .. 'hidden=true,'
    .. 'no_ignore=true,'
    .. 'file_ignore_patterns={ "%.git[/\\\\]" },'
    .. '})<cr>',
    opts
  );
  vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>Telescope diagnostics bufnr=0<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>Telescope lsp_references<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>fi', '<cmd>Telescope lsp_implementations<cr>', opts);
end

return M

local M = {}

function M:setup()
  local opts = { noremap = true, silent = true }

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

  vim.diagnostic.config({
    virtual_text = {
      source = true,
    },
  })
end

return M

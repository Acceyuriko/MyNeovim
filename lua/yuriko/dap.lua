local M = {}

function M:setup()
  local opts = { noremap = true, silent = true }

  vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require("dap").continue()<cr>', opts);
  vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require("dap").step_over()<cr>', opts);
  vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require("dap").step_into()<cr>', opts);
  vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require("dap").step_out()<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require("dap").toggle_breakpoint()<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>B', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>lp', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require("dap").repl.open()<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require("dap").run_last()<cr>', opts);
end

return M

local M = {}

function M:setup()
  local null_ls = require('null-ls')

  null_ls.setup({
    diagnostics_format = "[#{c}] #{m} (#{s})",
    sources = {
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.formatting.eslint_d,
    },
  })
end

return M;

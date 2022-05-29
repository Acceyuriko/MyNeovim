local M = {}

function M:setup()
  vim.g.tokyonight_style = 'night'
  vim.cmd([[colorscheme tokyonight]])

  local opts = { noremap = true, silent = true }
  local colors = require('tokyonight.colors').setup()

  require('bufferline').setup {
    options = {
      numbers = 'buffer_id'
    }
  }

  require('lualine').setup {
    options = {
      theme = 'tokyonight'
    }
  }

  require('colorizer').setup {}

  require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = true,
  }

  require('todo-comments').setup {}

  require('hlslens').setup {}
  vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
  vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
  vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
  vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
  vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
  vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)
  vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', opts)

  require('scrollbar').setup {
    handle = {
      color = colors.bg_highlight,
    },
    marks = {
      Search = { color = colors.orange },
      Error = { color = colors.error },
      Warn = { color = colors.warning },
      Info = { color = colors.info },
      Hint = { color = colors.hint },
      Misc = { color = colors.purple },
    }
  }
  require('scrollbar.handlers.search').setup {}

  require('alpha').setup(require('alpha.themes.startify').config)
end

return M

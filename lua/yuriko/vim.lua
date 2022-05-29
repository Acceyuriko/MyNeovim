local M = {}

function M:setup()
  vim.o.swapfile = false;
  vim.o.wrap = false;
  vim.o.ignorecase = true;
  vim.o.smartcase = true;
  vim.o.nu = true;
  vim.o.autoread = true;
  vim.o.cursorline = true;
  vim.o.termguicolors = true;

  vim.o.expandtab = true;
  vim.o.tabstop = 2;
  vim.o.shiftwidth = 0;
  vim.o.softtabstop = 2;
  vim.o.autoindent = true;
  vim.o.smartindent = true;

  vim.o.signcolumn = 'yes';
  vim.o.scrolloff = 10;

  vim.o.completeopt = 'menu,menuone,noselect'

  vim.o.foldenable = true
  vim.o.foldlevel = 99
  vim.o.foldmethod = 'expr'
  vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

  vim.o.guifont = 'CaskaydiaCove Nerd Font:h12';

  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.mapleader = ' ';

  if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    vim.o.shell = 'C:/Program Files/Git/bin/bash.exe';
  end

  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<c-j>', '<cmd>bp<cr>', opts);
  vim.api.nvim_set_keymap('n', '<c-k>', '<cmd>bn<cr>', opts);
  vim.api.nvim_set_keymap('n', '<leader>bo', '<cmd>w <bar> %bd <bar> e# <bar> bd# <cr>', opts);
end

return M

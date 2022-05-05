local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'rafamadriz/friendly-snippets'
  use 'ray-x/lsp_signature.nvim'
  use 'github/copilot.vim'
  use 'RRethy/vim-illuminate'
  use 'tpope/vim-sleuth'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'p00f/nvim-ts-rainbow' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim' },
    }
  }

  use { 'simrat39/symbols-outline.nvim' }

  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

  use { 'Hoffs/omnisharp-extended-lsp.nvim' }

  use { 'ahmedkhalf/project.nvim' }

  use { 'folke/tokyonight.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }

  use { 'lewis6991/gitsigns.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'akinsho/git-conflict.nvim' }

  use 'folke/lua-dev.nvim'

  use { 'folke/which-key.nvim' }

  use {
    'akinsho/bufferline.nvim',
    tag = '*',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { 'numToStr/Comment.nvim' }

  use { 'windwp/nvim-autopairs' }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  use { 'mfussenegger/nvim-dap' }
  use { 'Pocco81/dap-buddy.nvim' }

  use { 'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.cmd([[
filetype indent plugin on
set nocompatible
set noundofile
set noswapfile
set nobackup
set autochdir
set nowrap

set nu
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=0
set softtabstop=2
set expandtab
set autoindent
set smartindent
set completeopt=menu,menuone,noselect
set scrolloff=999
set autoread
set cursorline
if has("win32") || has ("win64")
  set shell=\"C:/Program\ Files/Git/bin/bash.exe\"
end

let g:tokyonight_style = 'night'
colorscheme tokyonight

let mapleader = ' '

nnoremap <silent> <c-j> :bn<cr>
nnoremap <silent> <c-k> :bp<cr>
]])

require('nvim-lsp-installer').setup {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require('illuminate').on_attach(client)
end

function setupCmp()
  local cmp = require 'cmp'
  local lspconfig = require('lspconfig')

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  local cmdline_keymap = {
    ['<Tab>'] = {
      c = function()
        if cmp.visible() then
          cmp.select_next_item()
        end
      end,
    },
    ['<S-Tab>'] = {
      c = function()
        if cmp.visible() then
          cmp.select_prev_item()
        end
      end,
    },
    ['<C-n>'] = {
      c = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
    },
    ['<C-p>'] = {
      c = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    },
    ['<C-e>'] = {
      c = cmp.mapping.close(),
    },
  }

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmdline_keymap,
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmdline_keymap,
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = {
    'omnisharp',
    'sumneko_lua',
    'ltex',
    'tsserver',
    'eslint',
    'html',
    'cssls',
  }
  for _, lsp in pairs(servers) do
    local config = {
      on_attach = on_attach,
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      },
      capabilities = capabilities,
    }

    if lsp == 'omnisharp' then
      config.handlers = {
        ['textDocument/definition'] = require('omnisharp_extended').handler
      }
    end

    if lsp == 'tsserver' then
      config.root_dir = lspconfig.util.root_pattern('tsconfig.json', 'jsconfig.json', '.git')
    end

    if lsp == 'eslint' then
      config.root_dir = lspconfig.util.root_pattern('.eslintrc.json', '.eslintrc.js', '.git')
    end

    lspconfig[lsp].setup(config)
  end
end

setupCmp()

vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
  ['*'] = false,
  ['javascript'] = true,
  ['typescript'] = true,
  ['lua'] = true,
  ['rust'] = true,
  ['c'] = true,
  ['c#'] = true,
  ['c++'] = true,
  ['go'] = true,
  ['python'] = true,
  ['markdown'] = true,
}
vim.api.nvim_set_keymap('i', '<F1>', 'copilot#Accept("")', { silent = true, expr = true })

vim.o.termguicolors = true
require('lsp_signature').setup {}

require('trouble').setup {}
vim.cmd([[
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
]])

require('gitsigns').setup {}
require('git-conflict').setup {}
require('which-key').setup {}
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

require('project_nvim').setup {}

vim.g.nvim_tree_respect_buf_cwd = 1
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
vim.cmd([[
nnoremap <A-1> :NvimTreeToggle<CR>
highlight NvimTreeFolderIcon guibg=true
]])

require('colorizer').setup {}

require('Comment').setup {}
require('nvim-autopairs').setup {}

require('todo-comments').setup {}

require('nvim-treesitter.install').compilers = { 'clang', 'gcc' }
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'lua',
    'c_sharp',
    'typescript',
    'javascript',
    'html',
    'css',
    'tsx',
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { '.git' }
  },
}
require('telescope').load_extension('projects')
vim.cmd([[
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fr <cmd>Telescope lsp_references<cr>
]])


vim.cmd([[
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
]])

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
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
  use { 'nvim-treesitter/nvim-treesitter-refactor' }
  use { 'p00f/nvim-ts-rainbow' }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-pack/nvim-spectre' }

  use { 'simrat39/symbols-outline.nvim' }

  use { "folke/trouble.nvim" }

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
  use { 'sindrets/diffview.nvim' }
  use { 'akinsho/git-conflict.nvim' }

  use 'folke/lua-dev.nvim'

  use { 'folke/which-key.nvim' }

  use { 'akinsho/bufferline.nvim', tag = '*' }

  use { 'nvim-lualine/lualine.nvim' }

  use { 'numToStr/Comment.nvim' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }

  use { 'windwp/nvim-autopairs' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'lukas-reineke/indent-blankline.nvim' }

  use { 'folke/todo-comments.nvim' }

  use { 'mfussenegger/nvim-dap' }
  use { 'Pocco81/dap-buddy.nvim' }
  use { 'prettier/vim-prettier' }

  use { 'iamcco/markdown-preview.nvim', run = 'call mkdp#util#install()' }

  use { 'Pocco81/AutoSave.nvim' }

  use { 'kevinhwang91/nvim-hlslens' }
  use { 'petertriho/nvim-scrollbar' }

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

let g:tokyonight_style = "night"
colorscheme tokyonight

let g:mkdp_open_to_the_world = 1
let g:mkdp_echo_preview_url = 1

let g:prettier#exec_cmd_async = 1

let mapleader = ' '
]])


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<c-j>', '<cmd>bp<cr>', opts);
vim.api.nvim_set_keymap('n', '<c-k>', '<cmd>bn<cr>', opts);
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require('illuminate').on_attach(client)
end

local function setupCmp()
  local cmp = require 'cmp'
  local lspconfig = require('lspconfig')
  local lspinstaller = require('nvim-lsp-installer')

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
    'jsonls',
  }
  lspinstaller.setup {
    ensure_installed = servers,
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

    if lsp == 'sumneko_lua' then
      config.settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    end

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
  ['javascriptreact'] = true,
  ['typescript'] = true,
  ['typescriptreact'] = true,
  ['html'] = true,
  ['css'] = true,
  ['less'] = true,
  ['scss'] = true,
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
vim.api.nvim_set_keymap('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', opts);
vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', opts);
vim.api.nvim_set_keymap('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', opts);

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
require('indent_blankline').setup {
  show_current_context = true,
  show_current_context_start = true,
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
vim.cmd([[highlight NvimTreeFolderIcon guibg=true]])
vim.api.nvim_set_keymap('n', '<a-1>', '<cmd>NvimTreeToggle<cr>', opts);

require('colorizer').setup {}

require('Comment').setup {
  pre_hook = function(ctx)
    local U = require 'Comment.utils'

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring {
      key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
      location = location,
    }
  end,
}

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
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "<leader>rr"
      }
    }
  },
}

require('nvim-autopairs').setup {}
require('nvim-ts-autotag').setup {}

require('todo-comments').setup {}

vim.cmd([[
set foldenable
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])

require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.95, height = 0.95 },
    }
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

vim.api.nvim_set_keymap('n', '<leader>bo', '<cmd>w <bar> %bd <bar> e# <bar> bd# <cr>', opts);

vim.api.nvim_set_keymap('n', '<leader>dfo', '<cmd>DiffviewOpen<cr>', opts);
vim.api.nvim_set_keymap('n', '<leader>dfc', '<cmd>DiffviewClose<cr>', opts);

vim.api.nvim_set_keymap('n', '<leader>sr', '<cmd>lua require("spectre").open_file_search()<cr>', opts);
vim.api.nvim_set_keymap('n', '<leader>sra', '<cmd>lua require("spectre").open()<cr>', opts);

vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require("dap").continue()<cr>', opts);
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require("dap").step_over()<cr>', opts);
vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require("dap").step_into()<cr>', opts);
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require("dap").step_out()<cr>', opts);
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require("dap").toggle_breakpoint()<cr>', opts);
vim.api.nvim_set_keymap('n', '<leader>B', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>', opts);
vim.api.nvim_set_keymap('n', '<leader>lp', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>', opts);
vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require("dap").repl.open()<cr>', opts);
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require("dap").run_last()<cr>', opts);

require('autosave').setup({
  enabled = true,
  debounce_delay = 1000,
})

require('hlslens').setup {}
vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', opts)

local colors = require('tokyonight.colors').setup()

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

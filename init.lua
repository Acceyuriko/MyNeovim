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
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp'
  use 'github/copilot.vim'
  use 'RRethy/vim-illuminate'
  use 'tpope/vim-sleuth'

  use { 'rafamadriz/friendly-snippets' }
  use { 'L3MON4D3/LuaSnip' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }
  use { 'p00f/nvim-ts-rainbow' }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-pack/nvim-spectre' }

  use { 'simrat39/symbols-outline.nvim' }

  use { 'Hoffs/omnisharp-extended-lsp.nvim' }

  use { 'simrat39/rust-tools.nvim' }

  use { 'ahmedkhalf/project.nvim' }

  use { 'folke/tokyonight.nvim' }
  use { 'norcalli/nvim-colorizer.lua' }

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
  use { 'prettier/vim-prettier' }

  use({
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  })

  use { 'kevinhwang91/nvim-hlslens' }
  use { 'petertriho/nvim-scrollbar' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('yuriko.vim').setup {}

-- Mappings.

require('yuriko.cmp').setup {}
require('yuriko.copilot').setup {}
require('yuriko.diagnostic').setup {}
require('yuriko.project').setup {}
require('yuriko.ui').setup {}
require('yuriko.treesitter').setup {}
require('yuriko.git').setup {}
require('yuriko.telescope').setup {}
require('yuriko.comment').setup {}
require('yuriko.dap').setup {}
require('yuriko.quality-of-life').setup {}
require('yuriko.preview').setup {}
require('yuriko.prettier').setup {}

require('yuriko.lang.rust').setup {}

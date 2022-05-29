local M = {}

function M:setup()
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
end

return M

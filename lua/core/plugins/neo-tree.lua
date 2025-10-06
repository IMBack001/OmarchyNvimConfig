-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  -- enable = true,
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = true,
  keys = {
    { '<leader>e', ':Neotree reveal <CR>', desc = 'NeoTree Reveal/Close', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        width = 30,
      },
      popup = {
        size = { width = 80, height = 20 },
        border = 'rounded',
      },
    },
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true, -- closes Neo-tree if it's the last window
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        position = 'left', -- left, right, top, bottom
        width = 30,
        mappings = {
          ['<leader>e'] = 'close_window',
        },
        -- ['/'] = 'filter_as_you_type',
      },
      default_component_configs = {
        icon = {
          folder_empty = '',
          folder_empty_open = '',
          folder_closed = '',
          folder_open = '',
          default = '',
        },
        git_status = {
          symbols = {
            added = '✚',
            modified = '',
            deleted = '✖',
          },
        },
      },
      source_selector = {
        winbar = false,
        statusline = true,
      },
    }
  end,
}

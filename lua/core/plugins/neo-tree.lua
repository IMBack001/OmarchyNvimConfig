-- 🗂 Neo-tree — File Explorer for Neovim
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },

  keys = {
    {
      '<leader>e',
      '<cmd>Neotree toggle reveal<CR>',
      desc = 'Toggle [E]xplorer (Neo-tree)',
      silent = true,
    },
  },

  opts = {
    close_if_last_window = true, -- Automatically close if Neo-tree is the last window
    popup_border_style = 'rounded', -- Rounded borders for popups
    enable_git_status = true, -- Show git status icons
    enable_diagnostics = true, -- Show diagnostics (LSP warnings/errors)

    window = {
      position = 'left',
      width = 32,
      mappings = {
        ['<leader>e'] = 'close_window',
      },
    },

    filesystem = {
      window = {
        width = 30,
      },
      popup = {
        size = { width = 80, height = 20 },
        border = 'rounded',
      },
      follow_current_file = { enabled = true }, -- Focus the current file when opened
      group_empty_dirs = true,
      use_libuv_file_watcher = true,
    },

    default_component_configs = {
      icon = {
        folder_closed = '',
        folder_open = '',
        folder_empty = '',
        folder_empty_open = '',
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
  },
}

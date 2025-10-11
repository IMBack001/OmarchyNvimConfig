-- 🔍 Telescope — Fuzzy Finder (files, LSP, etc)
-- https://github.com/nvim-telescope/telescope.nvim

return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',

    -- FZF native extension for performance (requires `make`)
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },

    -- UI select extension
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Nerd Font icons
    {
      'nvim-tree/nvim-web-devicons',
      lazy = false, -- Load at startup
      config = function()
        require('nvim-web-devicons').setup {
          default = true, -- enable default icons
        }
      end,
    },
  },

  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local themes = require 'telescope.themes'

    -- Core Telescope setup
    telescope.setup {
      extensions = {
        ['ui-select'] = { themes.get_dropdown() },
      },
    }

    -- Load extensions safely
    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')

    -- =========================
    -- Keymaps
    -- =========================
    -- General searches
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = "[S]earch Recent Files ('.' repeat)" })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })

    -- Current buffer fuzzy search with dropdown theme
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Live grep only in open files
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Quickly search Neovim config files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}

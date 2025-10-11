return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
      },

      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, noremap = true, silent = true })
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, 'Next Git Hunk')

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, 'Previous Git Hunk')

        -- Hunk Actions (Normal + Visual)
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'Stage Hunk (Visual)')

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, 'Reset Hunk (Visual)')

        map('n', '<leader>hs', gitsigns.stage_hunk, 'Stage Hunk')
        map('n', '<leader>hr', gitsigns.reset_hunk, 'Reset Hunk')
        map('n', '<leader>hS', gitsigns.stage_buffer, 'Stage Buffer')
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, 'Undo Stage Hunk')
        map('n', '<leader>hR', gitsigns.reset_buffer, 'Reset Buffer')
        map('n', '<leader>hp', gitsigns.preview_hunk, 'Preview Hunk')

        -- Git Blame & Diff
        map('n', '<leader>hb', gitsigns.blame_line, 'Blame Line')
        map('n', '<leader>hd', gitsigns.diffthis, 'Diff Against Index')
        map('n', '<leader>hD', function()
          gitsigns.diffthis '@'
        end, 'Diff Against Last Commit')

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, 'Toggle Git Blame')
        map('n', '<leader>tD', gitsigns.preview_hunk_inline, 'Toggle Deleted Hunks Preview')
      end,
    },
  },
}

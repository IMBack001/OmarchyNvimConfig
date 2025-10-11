return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  -- Noice setup
  config = function()
    require('noice').setup {
      presets = {
        -- Enable/disable presets
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = false, -- send long messages to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
      },
      messages = {
        enabled = true, -- enable messages
        view = 'notify', -- view options: "mini", "notify", "split"
      },
    }
  end,
}

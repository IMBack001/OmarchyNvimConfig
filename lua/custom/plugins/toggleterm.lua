return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20, -- height of horizontal terminal
      open_mapping = [[<C-\>]], -- key to toggle terminal
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float', -- can be "vertical", "horizontal", "tab", or "float"
      float_opts = {
        border = 'rounded', -- border style
        winblend = 0,
      },
    }
  end,
}

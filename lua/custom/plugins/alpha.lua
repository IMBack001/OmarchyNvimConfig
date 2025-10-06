return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Header (ASCII art)

    dashboard.section.header.val = {

      '                 ▄▄▄',
      ' ▄█████▄    ▄███████████▄    ▄███████   ▄███████   ▄███████   ▄█   █▄    ▄█   █▄',
      '███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███',
      '███   ███  ███   ███   ███  ███   ███  ███   ███  ███   █▀   ███   ███  ███   ███',
      '███   ███  ███   ███   ███ ▄███▄▄▄███ ▄███▄▄▄██▀  ███       ▄███▄▄▄███▄ ███▄▄▄███',
      '███   ███  ███   ███   ███ ▀███▀▀▀███ ▀███▀▀▀▀    ███      ▀▀███▀▀▀███  ▀▀▀▀▀▀███',
      '███   ███  ███   ███   ███  ███   ███ ██████████  ███   █▄   ███   ███  ▄██   ███',
      '███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███',
      ' ▀█████▀    ▀█   ███   █▀   ███   █▀   ███   ███  ███████▀   ███   █▀    ▀█████▀',
      '                                       ███   █▀',
    }

    -- Menu buttons
    dashboard.section.buttons.val = {
      dashboard.button('n', '  New file', ':ene <BAR> startinsert<CR>'),
      dashboard.button('r', '󰄉  Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('h', '  Theme', ':Themify<CR>'),
      dashboard.button('l', '󰒲  Lazy', ':Lazy<CR>'),
      dashboard.button('m', '󰈩  Mason', ':Mason<CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }

    -- Footer
    dashboard.section.footer.val = {
      '██████████████████████ ',
      '██        ██        ██ ',
      '██  ████████  ████  ██ ',
      '██  ██          ██  ██ ',
      '██  ██          ██  ██ ',
      '██████          ██  ██ ',
      '██  ██          ██  ██ ',
      '██  ██          ██  ██ ',
      '██  ██████████████  ██ ',
      '██       ██         ██ ',
      '███████████  █████████ ',
    }

    alpha.setup(dashboard.opts)
  end,
}

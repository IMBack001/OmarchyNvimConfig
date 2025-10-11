-- ===================================================================
-- Neovim Initialization — Lazy.nvim Bootstrap & Core Setup
-- ===================================================================

-- Load custom options and keybindings
require 'custom.others.options'
require 'custom.others.keybinds'

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight text on yank (copy)',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- ===================================================================
-- Lazy.nvim Bootstrap
-- ===================================================================
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

-- Prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- ===================================================================
-- Lazy.nvim Setup
-- ===================================================================
require('lazy').setup({
  { import = 'core.plugins' },
  { import = 'custom.plugins' },
  { import = 'core.themes' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤',
    },
  },
})

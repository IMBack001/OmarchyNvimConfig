-- nvim v0.8.0
return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- Optional dependency for floating window border decoration
  dependencies = { 'nvim-lua/plenary.nvim' },

  -- Recommended keybinding to load plugin on first use
  keys = {
    { '<leader>g', '<cmd>LazyGit<CR>', desc = 'Open LazyGit' },
  },
}

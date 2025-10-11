-- 🌲 Treesitter — Highlight, edit, and navigate code
-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Module to configure

  opts = {
    -- Languages to ensure are installed
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'diff',
      'css',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'rust',
      'python',
      'javascript',
      'json',
      'jsonc',
      'toml',
    },

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- Syntax highlighting
    highlight = {
      enable = true,
      -- Disable for files larger than 1 MB
      disable = function(_, buf)
        local max_filesize = 1024 * 1024 * 1 -- 1 MB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        return ok and stats and stats.size > max_filesize
      end,
      -- Use Vim regex highlighting in addition to Treesitter for specific languages
      additional_vim_regex_highlighting = { 'ruby' },
    },

    -- Indentation based on Treesitter
    indent = {
      enable = true,
      disable = { 'ruby' }, -- Ruby indentation handled better by Vim regex
    },
  },

  -- Additional modules to explore:
  -- - Incremental selection: `:help nvim-treesitter-incremental-selection-mod`
  -- - Treesitter context: https://github.com/nvim-treesitter/nvim-treesitter-context
  -- - Treesitter textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}

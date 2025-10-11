-- 🪄 Autoformatting Configuration — Conform.nvim
-- ---------------------------------------------------------
-- Handles automatic and manual code formatting for multiple languages.
-- Integrates seamlessly with LSP, Prettier, and Stylua.
-- ---------------------------------------------------------
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' }, -- Format before saving
  cmd = { 'ConformInfo' },

  -- 🧭 Keybindings
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat current buffer',
    },
  },

  -- ⚙️ Plugin Options
  opts = {
    notify_on_error = false,

    -- 🔁 Auto-format on save
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for specific filetypes
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback', -- Use LSP formatter if available
        }
      end
    end,

    -- 🧩 Formatters by filetype
    formatters_by_ft = {
      -- 🦋 Lua
      lua = { 'stylua' },

      -- 💻 Web stack
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      json = { 'prettier' },
      markdown = { 'prettier' },
      yaml = { 'prettier' },
      toml = { 'prettier' },

      -- ⚙️ System languages (optional)
      c = { 'prettier' },
      cpp = { 'prettier' },

      -- 🐍 Example for chaining formatters
      -- python = { 'isort', 'black' },
      --
      -- Example for fallback order
      -- javascript = { 'prettierd', 'prettier', stop_after_first = true },
    },
  },
}

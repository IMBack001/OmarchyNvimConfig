-- 🌟 Blink.CMP — Modern Autocompletion Engine for Neovim
-- -------------------------------------------------------
-- This configuration integrates Blink.CMP with LuaSnip, friendly-snippets,
-- and lazydev, offering a responsive, intelligent, and elegant completion experience.
-- -------------------------------------------------------
return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',

  dependencies = {
    -- ✨ Snippet Engine: LuaSnip
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build regex support (skipped for Windows)
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- 📚 Premade snippets collection
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      opts = {},
    },

    -- ⚙️ Optional integration with LazyDev for LSP-like completions in Lua configs
    'folke/lazydev.nvim',
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 🧠 Keymaps — smooth and intuitive completion behavior
    keymap = {
      -- Recommended preset options: 'default', 'super-tab', 'enter', 'none'
      preset = 'enter', -- Accept completion with <Enter>
      ['<C-l>'] = { 'select_and_accept' }, -- Confirm completion
      ['<C-y>'] = false, -- Disable old mapping
      -- <C-space> opens docs, <C-e> hides menu, <C-k> toggles signature help, etc.
    },

    -- 🎨 UI and appearance
    appearance = {
      nerd_font_variant = 'mono', -- Keeps icons nicely aligned (for Nerd Font Mono)
    },

    -- 💡 Completion behavior and documentation popup
    completion = {
      documentation = {
        auto_show = true, -- Automatically show docs
        -- auto_show_delay_ms = 500, -- Uncomment to delay
      },
    },

    -- 🔍 Completion sources (order of priority)
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    -- ✂️ Snippet engine preset
    snippets = { preset = 'luasnip' },

    -- ⚡ Fuzzy matching engine
    fuzzy = {
      implementation = 'lua', -- Use fast Lua fuzzy matching
      -- Alternative: 'prefer_rust_with_warning' for a native Rust backend
    },

    -- 🖋️ Function signature popups while typing
    signature = {
      enabled = true,
    },
  },
}

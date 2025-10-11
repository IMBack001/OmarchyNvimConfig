return {
  -- ╭──────────────────────────────────────────────────────────╮
  -- │                   Main LSP Configuration                 │
  -- ╰──────────────────────────────────────────────────────────╯
  'neovim/nvim-lspconfig',

  dependencies = {
    -- Mason: Automatically install LSPs and related tools
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- LSP status updates
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional completion capabilities (blink.cmp)
    'saghen/blink.cmp',
  },

  config = function()
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                LSP Attach Configuration                 │
    -- ╰──────────────────────────────────────────────────────────╯
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -----------------------------------------------------------------------
        -- Helper function for LSP keymaps
        -----------------------------------------------------------------------
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -----------------------------------------------------------------------
        -- Keymaps: Core LSP actions
        -----------------------------------------------------------------------
        map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
        map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
        map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
        map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

        -----------------------------------------------------------------------
        -- Compatibility: Neovim 0.10 vs 0.11
        -----------------------------------------------------------------------
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -----------------------------------------------------------------------
        -- Highlight references when the cursor is idle
        -----------------------------------------------------------------------
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })

          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -----------------------------------------------------------------------
        -- Toggle inlay hints if supported by the language server
        -----------------------------------------------------------------------
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- ╭──────────────────────────────────────────────────────────╮
    -- │                   Diagnostics Setup                     │
    -- ╰──────────────────────────────────────────────────────────╯
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          return diagnostic.message
        end,
      },
    }

    -- ╭──────────────────────────────────────────────────────────╮
    -- │                 LSP Capabilities Setup                   │
    -- ╰──────────────────────────────────────────────────────────╯
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- ╭──────────────────────────────────────────────────────────╮
    -- │               Language Servers Configuration             │
    -- ╰──────────────────────────────────────────────────────────╯
    local servers = {
      rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = 'clippy' },
            inlayHints = {
              enable = true,
              bindingModeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true },
              closureReturnTypeHints = { enable = true },
              lifetimeElisionHints = { enable = true, useParameterNames = true },
              parameterHints = { enable = true },
              reborrowHints = { enable = true },
              typeHints = { enable = true }, -- 🔥 Shows variable types inline
            },
          },
        },
      },

      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    -- ╭──────────────────────────────────────────────────────────╮
    -- │                  Mason & Tool Installer                  │
    -- ╰──────────────────────────────────────────────────────────╯
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { 'stylua' }) -- Lua formatter

    require('mason-tool-installer').setup {
      ensure_installed = ensure_installed,
    }

    -- ╭──────────────────────────────────────────────────────────╮
    -- │               Mason LSP Configuration Setup              │
    -- ╰──────────────────────────────────────────────────────────╯
    require('mason-lspconfig').setup {
      ensure_installed = {}, -- Handled by mason-tool-installer
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}

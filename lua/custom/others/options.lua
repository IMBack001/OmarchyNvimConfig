-- ============================================================================
-- Neovim Options
-- ============================================================================

-- =========================
-- Leader Keys
-- =========================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false

-- =========================
-- Line Numbers & Scrolling
-- =========================
vim.o.number = true -- Show absolute line numbers
vim.o.relativenumber = true -- Relative line numbers
vim.o.cursorline = true -- Highlight current line
vim.opt.scrolloff = 10 -- Keep 10 lines visible above/below cursor
vim.opt.sidescrolloff = 8 -- Minimal horizontal scroll margin
vim.opt.scroll = 1

-- =========================
-- Editing & Indentation
-- =========================
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 2 -- Width for autoindents
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.o.breakindent = true -- Maintain indentation on line wrap
vim.o.list = true -- Show invisible characters
vim.opt.listchars = { tab = '> ', trail = '·', nbsp = '␣' }

-- =========================
-- Search
-- =========================
vim.o.ignorecase = true -- Case insensitive search
vim.o.smartcase = true -- Case sensitive if uppercase letters used

-- =========================
-- Clipboard & Mouse
-- =========================
vim.o.mouse = 'a' -- Enable mouse
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus' -- Use system clipboard
end)

-- =========================
-- Splits & Tabs
-- =========================
vim.o.splitright = true
vim.o.splitbelow = true

-- =========================
-- Undo & Backup
-- =========================
vim.o.undofile = true -- Persistent undo
vim.opt.swapfile = false -- Disable swapfile
vim.opt.writebackup = false -- Disable backup files

-- =========================
-- Performance
-- =========================
vim.o.updatetime = 250 -- Faster completion and CursorHold
vim.o.timeoutlen = 300 -- Key sequence timeout
vim.opt.lazyredraw = false -- Faster macros
vim.opt.ttyfast = true -- Assume fast terminal connection
vim.opt.smoothscroll = true -- Smooth scrolling

-- =========================
-- UI & Appearance
-- =========================
vim.o.showmode = false -- Don't show mode since statusline handles it
vim.o.showcmd = false -- Don't show command in statusline
vim.opt.termguicolors = true -- Enable true colors
vim.o.background = 'dark' -- Set background theme
vim.o.signcolumn = 'yes' -- Always show sign column
vim.o.inccommand = 'split' -- Incremental command preview
vim.o.confirm = true -- Confirm to save changes before closing

-- =========================
-- Disable Built-in Plugins
-- =========================
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

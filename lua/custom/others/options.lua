--options.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '> ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.opt.scroll = 1
vim.o.confirm = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
-- Keep cursor away from screen edges when scrolling
vim.opt.scrolloff = 10 -- minimal number of screen lines to keep above/below cursor
vim.opt.sidescrolloff = 8
vim.opt.ttyfast = true -- assume fast terminal connection
vim.opt.smoothscroll = true
vim.opt.termguicolors = true
vim.o.background = 'dark'

-- Neovim performance options for large files
vim.opt.lazyredraw = false -- don’t redraw during macros
vim.opt.swapfile = false -- don’t use swapfiles
vim.opt.undofile = false -- don’t keep undo history
vim.opt.writebackup = false -- don’t make backup file
vim.opt.showmode = false -- less UI overhead
vim.opt.showcmd = false -- don’t show command in statusline
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

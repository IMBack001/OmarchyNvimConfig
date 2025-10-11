-- ===================================================================
-- Neovim Keymaps — General, Terminal, Navigation, Tabs, and Custom
-- ===================================================================

-- Clear search highlights with <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'Open diagnostic [Q]uickfix list',
})

-- Terminal mode: exit easily
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', {
  desc = 'Exit terminal mode',
})

-- Disable arrow keys in normal mode to encourage hjkl usage
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Easier window navigation: use Ctrl+hjkl
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tab management
vim.keymap.set('n', '<leader>tt', ':silent! tabnew<CR>', { desc = 'Open a New Tab' })
vim.keymap.set('n', '<leader>tc', ':silent! tabclose<CR>', { desc = 'Close the Current Tab' })
vim.keymap.set('n', '<leader>tn', ':silent! tabnext<CR>', { desc = 'Next Tab' })
vim.keymap.set('n', '<leader>tb', ':silent! tabprevious<CR>', { desc = 'Previous Tab' })

-- NOTE: Some terminals cannot distinguish certain Ctrl+Shift keycodes
-- vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
-- vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
-- vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
-- vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- Custom keybinds
vim.keymap.set('n', '<leader>h', ':Themify<CR>', { desc = 'Change Theme' })

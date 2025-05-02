local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<leader>bd', ':bdelete<CR>', opts)

-- Clear highlights
keymap('n', '<leader>h', '<cmd>nohlsearch<CR>', opts)

-- Better paste
keymap('v', 'p', '"_dP', opts)

-- Terminal
keymap('n', '<leader>tt', ':ToggleTerm<CR>', opts)
keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<leader>e', vim.diagnostic.open_float, opts)
keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)

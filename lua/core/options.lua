local opt = vim.opt
local g = vim.g

-- General
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.undofile = true
opt.history = 1000
opt.undodir = vim.fn.stdpath('data') .. '/undodir'
opt.updatetime = 300  -- Faster completion
opt.timeoutlen = 500  -- Time to wait for mapped sequence

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitright = true
opt.splitbelow = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false -- start with folds open
vim.o.foldlevel = 99     -- show all folds by default
vim.o.foldlevelstart = 99

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

-- Disable built-in plugins we don't need
local disabled_builtins = {
  'netrw', 'netrwPlugin', 'netrwSettings', 'netrwFileHandlers',
  'gzip', 'zip', 'zipPlugin', 'tar', 'tarPlugin',
  'getscript', 'getscriptPlugin', 'vimball', 'vimballPlugin',
  '2html_plugin', 'logipat', 'rrhelper', 'spellfile_plugin', 'matchit'
}

for _, plugin in pairs(disabled_builtins) do
  g['loaded_' .. plugin] = 1
end

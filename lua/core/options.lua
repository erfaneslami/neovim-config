local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Scrolling
opt.scrolloff = 10

-- Display
opt.showmode = true
opt.showcmd = true
opt.termguicolors = true
opt.visualbell = true

-- Search
opt.smartcase = true
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Mouse
opt.mouse = "a"

-- Indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- File handling
opt.swapfile = false
opt.backup = false
opt.undofile = true
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Update time
opt.updatetime = 250
opt.timeoutlen = 300
--]]

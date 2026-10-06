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

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Update time
opt.updatetime = 250
opt.timeoutlen = 300

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

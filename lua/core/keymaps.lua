local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
  
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set('n', '<leader>bd', function()
  require('core.utils').smart_bufdelete(false) -- adjust the path if different
end, { desc = 'Smart delete current buffer' })
-- vim.keymap.set("n", "<C-w>", ":bdelete<CR>", { desc = "Close buffer safely" })

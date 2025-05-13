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
--
--
--

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }

    -- Hover docs
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- Go to definition/declaration/implementation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    -- Rename symbol
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    -- Code actions (e.g., auto import, fix)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Diagnostic navigation
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

    -- Format buffer
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

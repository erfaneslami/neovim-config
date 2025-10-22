
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================================================
-- BASIC EDITING
-- ============================================================================
print("keymaps loaded")


-- Visual indentation (keep selection)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Execute macro in 'q' register
keymap("n", "qj", "@q", opts)

-- Better deletion (don't yank to clipboard)
keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("n", "x", '"_x', opts)
keymap("v", "d", '"_d', opts)

-- Better change (don't yank to clipboard)
keymap("n", "c", '"_c', opts)
keymap("n", "C", '"_C', opts)
keymap("n", "s", '"_s', opts)
keymap("n", "S", '"_S', opts)

-- Don't let visual paste overwrite clipboard
keymap("v", "p", '"_dP', opts)

-- Replace current line with previous line content (like your rp mapping)
keymap("n", "<leader>rp", '"_ddP', opts)

-- Move lines up/down in visual mode
keymap("v", "<S-J>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<S-K>", ":m '<-2<CR>gv=gv", opts)

-- ============================================================================
-- NAVIGATION
-- ============================================================================

-- Tab navigation
keymap("n", "<A-n>", ":tabnext<CR>", opts)
keymap("n", "<A-p>", ":tabprev<CR>", opts)

-- Navigate jumplist (back/forward)
keymap("n", "<C-o>", "<C-o>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Navigate diagnostics/errors
keymap("n", "]e", vim.diagnostic.goto_next, opts)
keymap("n", "[e", vim.diagnostic.goto_prev, opts)
keymap("n", "<leader>ed", vim.diagnostic.open_float, opts)
keymap("n", "<leader>ef", vim.diagnostic.goto_next, opts)

-- ============================================================================
-- LEADER + C: COMMENTS
-- ============================================================================

keymap("n", "<leader>c", function()
  require("Comment.api").toggle.linewise.current()
end, opts)

keymap("v", "<leader>c", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, opts)

-- ============================================================================
-- LEADER + J: JUMP (LEAP/EASYMOTION)
-- ============================================================================

keymap("n", "<leader>j", "<Plug>(leap-forward-to)", opts)

-- ============================================================================
-- LEADER + X: FILE EXPLORER (NVIM-TREE)
-- ============================================================================

keymap("n", "<leader>x", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>xf", ":NvimTreeFindFile<CR>", opts)

-- ============================================================================
-- LEADER + Z: FOLDING
-- ============================================================================

keymap("n", "<leader>zc", "zM", opts)  -- Close all folds
keymap("n", "<leader>zo", "zR", opts)  -- Open all folds

-- ============================================================================
-- LEADER + W: WINDOWS/SPLITS
-- ============================================================================

keymap("n", "<leader>wv", ":vsplit<CR>", opts)
keymap("n", "<leader>ws", ":split<CR>", opts)
keymap("n", "<leader>wu", ":only<CR>", opts)
keymap("n", "<leader>wm", "<C-w>x", opts)
keymap("n", "<leader>w+", ":vertical resize +5<CR>", opts)
keymap("n", "<leader>w-", ":vertical resize -5<CR>", opts)

-- ============================================================================
-- LEADER + D: DISPLAY MODES
-- ============================================================================

keymap("n", "<leader>dz", ":ZenMode<CR>", opts)
keymap("n", "<leader>dd", ":ZenMode<CR>", opts)

-- ============================================================================
-- LEADER + F: FIND (TELESCOPE)
-- ============================================================================

keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fa", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fs", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>fu", ":Telescope lsp_references<CR>", opts)

-- ============================================================================
-- LEADER + A: ACTIONS (TELESCOPE/LSP)
-- ============================================================================

keymap("n", "<leader>as", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>am", vim.lsp.buf.code_action, opts)

-- ============================================================================
-- LEADER + Q: QUIT/CLOSE
-- ============================================================================

keymap("n", "<leader>q", ":bd<CR>", opts)
keymap("n", "<leader>qa", ":%bd|e#|bd#<CR>", opts)

-- ============================================================================
-- LEADER + R: REFACTORING (LSP)
-- ============================================================================

keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
keymap("v", "<leader>ca", vim.lsp.buf.code_action, opts)

-- ============================================================================
-- LEADER + G: GO TO (LSP) - These are set in LSP config but listed here
-- ============================================================================

-- Note: These are configured in lua/plugins/lsp.lua on LspAttach
-- Listed here for reference:
-- <leader>gd - Go to definition
-- <leader>gy - Go to type definition
-- <leader>gi - Go to implementation
-- <leader>gu - Show usages/references
-- <leader>gt - Go to test (not implemented in standard LSP)

-- ============================================================================
-- LEADER + G: GIT (TELESCOPE)
-- ============================================================================

keymap("n", "<leader>gc", ":Telescope git_commits<CR>", opts)
keymap("n", "<leader>gs", ":Telescope git_status<CR>", opts)
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", opts)

-- ============================================================================
-- LEADER + K/H/S: DOCUMENTATION & HOVER
-- ============================================================================

keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "<leader>k", vim.lsp.buf.signature_help, opts)
keymap("n", "<leader>K", vim.lsp.buf.type_definition, opts)
keymap("n", "<leader>su", vim.lsp.buf.references, opts)
keymap("n", "<leader>hu", ":Telescope lsp_document_symbols<CR>", opts)

-- ============================================================================
-- LEADER + V/P: CLIPBOARD/PASTE
-- ============================================================================

keymap("n", "<leader>v", ':Telescope registers<CR>', opts)
keymap("n", "<leader>p", ':Telescope registers<CR>', opts)

-- ============================================================================
-- LEADER + N: NEW FILE
-- ============================================================================

keymap("n", "<leader>n", ":enew<CR>", opts)

-- ============================================================================
-- LEADER + CT: FOCUS EDITOR
-- ============================================================================

keymap("n", "<leader>ct", ":NvimTreeClose<CR>", opts)

-- ============================================================================
-- OTHER USEFUL KEYMAPS
-- ============================================================================

-- Clear search highlighting
keymap("n", "<Esc>", ":noh<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Parameter info (IntelliJ-like)
keymap("n", "<C-p>", vim.lsp.buf.signature_help, opts)
keymap("i", "<C-p>", vim.lsp.buf.signature_help, opts)


-- Set up nvim-tree specific keymaps
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function(args)
    local api = require('nvim-tree.api')
    local bufnr = args.buf
    
    -- Create file/folder
    keymap('n', '<leader>n', api.fs.create, { buffer = bufnr, noremap = true, silent = true, desc = "Create file/folder" })
    keymap('n', 'a', api.fs.create, { buffer = bufnr, noremap = true, silent = true, desc = "Create file/folder" })
    
    -- Delete
    keymap('n', 'd', api.fs.remove, { buffer = bufnr, noremap = true, silent = true, desc = "Delete" })
    
    -- Rename
    keymap('n', 'r', api.fs.rename, { buffer = bufnr, noremap = true, silent = true, desc = "Rename" })
    
    -- Cut, Copy, Paste
    keymap('n', 'x', api.fs.cut, { buffer = bufnr, noremap = true, silent = true, desc = "Cut" })
    keymap('n', 'c', api.fs.copy.node, { buffer = bufnr, noremap = true, silent = true, desc = "Copy" })
    keymap('n', 'p', api.fs.paste, { buffer = bufnr, noremap = true, silent = true, desc = "Paste" })
    
    -- Copy name/path
    keymap('n', 'y', api.fs.copy.filename, { buffer = bufnr, noremap = true, silent = true, desc = "Copy filename" })
    keymap('n', 'Y', api.fs.copy.absolute_path, { buffer = bufnr, noremap = true, silent = true, desc = "Copy absolute path" })
  end,
})


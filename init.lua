

if vim.g.vscode then

  -- Set <Space> as leader
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  
  -- Escape insert mode with jj or jk
  keymap("i", "jj", "<Esc>", opts)

  -- VSCode Neovim: helper to run VSCode commands
  local vscode = require('vscode')
  
  local function vscode_action(action)
    vscode.action(action)
  end
  
  -- File explorer toggle
  keymap("n", "<leader>e", function() vscode_action('workbench.view.explorer') end, opts)
  keymap("n", "<leader>q", function() vscode_action('workbench.action.closeActiveEditor') end, opts)
  vim.keymap.set('n', '<leader>qa', function()
    vscode.action('workbench.action.closeAllEditors')
  end, { desc = 'Close all tabs' })
    keymap("n", "<leader>ee", function() vscode_action('workbench.action.toggleSidebarVisibility') end, opts)
  
  -- Folding
  keymap("n", "zc", function() vscode_action('editor.toggleFold') end, opts)
  keymap("n", "zM", function() vscode_action('editor.foldAll') end, opts)
  keymap("n", "zo", function() vscode_action('editor.unfoldAll') end, opts)


  keymap("n", "<leader>ff", function() vscode_action('workbench.action.quickOpen') end, opts)

  -- Move line up
  keymap("n", "<S-K>", ":m .-2<CR>==", opts)
  -- Move line down
  keymap("n", "<S-J>", ":m .+1<CR>==", opts)


  -- Move selection up
  keymap("v", "<S-K>", ":m '<-2<CR>gv=gv", opts)
  -- Move selection down
  keymap("v", "<S-J>", ":m '>+1<CR>gv=gv", opts)

  keymap("n", "<leader>gf", function() vscode_action('workbench.action.findInFiles') end, opts)

  keymap('n', '<leader>fd', function()
    vscode.action('editor.action.formatDocument')
  end, opts)

  -- <leader>f to start search with word under cursor
  keymap('n', '<leader>f', function()
    vscode.action('actions.find')
  end, opts)

  -- <leader>n to jump to next search match in VS Code
  keymap('n', '<leader>n', function()
    vscode.action('editor.action.nextMatchFindAction')
  end, opts)



  -- Clipboard: optional, enables system clipboard usage with "+ or * registers
  vim.opt.clipboard = "unnamedplus"
  
  -- Remap delete and change commands to not update default register
  vim.keymap.set("n", "d", '"_d', { noremap = true })
  vim.keymap.set("n", "D", '"_D', { noremap = true })
  vim.keymap.set("n", "x", '"_x', { noremap = true })
  vim.keymap.set("n", "X", '"_X', { noremap = true })
  vim.keymap.set("n", "c", '"_c', { noremap = true })
  vim.keymap.set("n", "C", '"_C', { noremap = true })
  
  vim.keymap.set("v", "d", '"_d', { noremap = true })
  vim.keymap.set("v", "x", '"_x', { noremap = true })
  vim.keymap.set("v", "c", '"_c', { noremap = true })
  
  -- Keep the paste register when pasting over something in visual mode
  vim.keymap.set("v", "p", '"_dP', { noremap = true })
  
  -- Optional: ci( and similar text objects — handled automatically by "c"
  -- since we've mapped "c" and "d" to "_", you don’t need to remap textobjects separately
  
  -- Optional convenience: yank to system clipboard with <leader>y
  vim.keymap.set("n", "<leader>y", '"+y', { noremap = true })
  vim.keymap.set("v", "<leader>y", '"+y', { noremap = true })
  
  -- Optional: paste from system clipboard with <leader>p
  vim.keymap.set("n", "<leader>p", '"+p', { noremap = true })
  vim.keymap.set("v", "<leader>p", '"+p', { noremap = true })
-- Comment with <leader>c in normal and visual mode
  vim.keymap.set("n", "<leader>c", function()
    vim.cmd("call VSCodeNotify('editor.action.commentLine')")
  end, { silent = true })
  
  vim.keymap.set("v", "<leader>c", function()
    vim.cmd("call VSCodeNotify('editor.action.commentLine')")
  end, { silent = true })


  -- <leader>xf → focus Explorer and reveal current file
  vim.keymap.set("n", "<leader>xf", function()
    -- Open the Explorer sidebar
    vim.cmd("call VSCodeNotify('workbench.view.explorer')")
    -- Reveal the current file in Explorer
    vim.cmd("call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')")
  end, { silent = true })

  -- Close other tabs (keep current)
  vim.keymap.set('n', '<leader>qo', function()
    vscode.action('workbench.action.closeOtherEditors')
  end, { desc = 'Close other tabs' })

else
  require('core.keymaps')
  require('core.lazy')
  require('core.options')
end

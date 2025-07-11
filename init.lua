

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
else
  require('core.keymaps')
  require('core.lazy')
  require('core.options')
end

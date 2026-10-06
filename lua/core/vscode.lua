-- IdeaVim-style keymaps for VS Code / Cursor (vscode-neovim)
-- Only loaded when vim.g.vscode is set.

local vscode = require("vscode")
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local function action(cmd)
  return function()
    vscode.action(cmd)
  end
end

-- ============================================================================
-- BASIC EDITING (shared IdeaVim habits)
-- ============================================================================

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "qj", "@q", opts)

keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("v", "d", '"_d', opts)
keymap("n", "c", '"_c', opts)
keymap("n", "C", '"_C', opts)
keymap("n", "s", '"_s', opts)
keymap("n", "S", '"_S', opts)
keymap("v", "p", '"_dP', opts)
keymap("n", "<leader>rp", '"_ddP', opts)

-- Move lines (IdeaVim MoveLineDown / MoveLineUp)
keymap("v", "J", action("editor.action.moveLinesDownAction"), opts)
keymap("v", "K", action("editor.action.moveLinesUpAction"), opts)

-- Tab navigation
keymap("n", "<A-n>", action("workbench.action.nextEditor"), opts)
keymap("n", "<A-p>", action("workbench.action.previousEditor"), opts)

-- Jumplist
keymap("n", "<C-o>", action("workbench.action.navigateBack"), opts)
keymap("n", "<C-i>", action("workbench.action.navigateForward"), opts)

-- Diagnostics / errors
keymap("n", "]e", action("editor.action.marker.next"), opts)
keymap("n", "[e", action("editor.action.marker.prev"), opts)
keymap("n", "<leader>ef", action("editor.action.marker.next"), opts)
keymap("n", "<leader>ed", action("editor.action.showHover"), opts)
keymap("n", "<leader>ca", action("editor.action.quickFix"), opts)

-- Comments
keymap({ "n", "v" }, "<leader>c", action("editor.action.commentLine"), opts)

-- Jump (easymotion-like: symbol picker in the IDE)
keymap("n", "<leader>j", action("workbench.action.gotoSymbol"), opts)

-- File explorer (NERDTree equivalents)
keymap("n", "<leader>x", action("workbench.action.toggleSidebarVisibility"), opts)
keymap("n", "<leader>xf", action("workbench.files.action.showActiveFileInExplorer"), opts)

-- Folding
keymap("n", "<leader>zc", action("editor.foldAll"), opts)
keymap("n", "<leader>zo", action("editor.unfoldAll"), opts)

-- Window splits
keymap("n", "<leader>wv", action("workbench.action.splitEditorRight"), opts)
keymap("n", "<leader>ws", action("workbench.action.splitEditorDown"), opts)
keymap("n", "<leader>wu", action("workbench.action.joinAllGroups"), opts)
keymap("n", "<leader>wm", action("workbench.action.moveEditorToNextGroup"), opts)
keymap("n", "<leader>w+", action("workbench.action.increaseViewWidth"), opts)
keymap("n", "<leader>w-", action("workbench.action.decreaseViewWidth"), opts)

-- Display modes
keymap("n", "<leader>dd", action("workbench.action.toggleCenteredLayout"), opts)
keymap("n", "<leader>dz", action("workbench.action.toggleZenMode"), opts)
keymap("n", "<leader>df", action("workbench.action.toggleFullScreen"), opts)

-- Refactoring
keymap("n", "<leader>rn", action("editor.action.rename"), opts)
keymap("n", "<leader>rm", action("refactor.extract.function"), opts)
keymap("n", "<leader>rv", action("refactor.extract.variable"), opts)
keymap("n", "<leader>rf", action("refactor.extract.constant"), opts)
keymap("n", "<leader>rs", action("editor.action.changeAll"), opts)
keymap("n", "<leader>rr", action("editor.action.refactor"), opts)

-- Code navigation
keymap("n", "<leader>gd", action("editor.action.revealDefinition"), opts)
keymap("n", "<leader>gy", action("editor.action.goToTypeDefinition"), opts)
keymap("n", "<leader>gi", action("editor.action.goToImplementation"), opts)
keymap("n", "<leader>gu", action("editor.action.goToReferences"), opts)
keymap("n", "<leader>gt", action("testing.goToRelatedTest"), opts)

-- Find & search
keymap("n", "<leader>ff", action("workbench.action.quickOpen"), opts)
keymap("n", "<leader>fr", action("workbench.action.openRecent"), opts)
keymap("n", "<leader>fc", action("workbench.action.showAllSymbols"), opts)
keymap("n", "<leader>fl", action("workbench.action.gotoLine"), opts)
keymap("n", "<leader>fn", action("workbench.action.files.newUntitledFile"), opts) -- scratch/new
keymap("n", "<leader>fa", action("workbench.action.showCommands"), opts)
keymap("n", "<leader>/", action("actions.find"), opts)
keymap("n", "<leader>fm", action("editor.action.formatDocument"), opts)

-- Git
keymap("n", "<leader>gc", action("git.commitAll"), opts)
keymap("n", "<leader>gs", action("workbench.view.scm"), opts)
keymap("n", "<leader>gb", action("git.checkout"), opts)

-- Window / tabs
keymap("n", "<leader>q", action("workbench.action.closeActiveEditor"), opts)
keymap("n", "<leader>qa", action("workbench.action.closeAllEditors"), opts)
keymap("n", "<leader>ct", action("workbench.action.focusActiveEditorGroup"), opts)
keymap("n", "<leader>n", action("explorer.newFile"), opts)

-- Usages & documentation
keymap("n", "<leader>fu", action("references-view.findReferences"), opts)
keymap("n", "<leader>fs", action("editor.action.referenceSearch.trigger"), opts)
keymap("n", "<leader>su", action("editor.action.goToReferences"), opts)
keymap("n", "<leader>hu", action("editor.action.wordHighlight.trigger"), opts)
keymap("n", "K", action("editor.action.showHover"), opts)
keymap("n", "<leader>k", action("editor.action.peekImplementation"), opts)
keymap("n", "<leader>K", action("editor.action.peekTypeDefinition"), opts)
keymap("n", "<C-p>", action("editor.action.triggerParameterHints"), opts)
keymap("i", "<C-p>", action("editor.action.triggerParameterHints"), opts)

-- Clipboard history (PasteMultiple equivalent when available)
keymap("n", "<leader>v", action("editor.action.clipboardPasteAction"), opts)
keymap("n", "<leader>p", action("editor.action.clipboardPasteAction"), opts)

-- Clear search highlight
keymap("n", "<Esc>", ":noh<CR>", opts)

-- Window navigation
keymap("n", "<C-h>", action("workbench.action.navigateLeft"), opts)
keymap("n", "<C-j>", action("workbench.action.navigateDown"), opts)
keymap("n", "<C-k>", action("workbench.action.navigateUp"), opts)
keymap("n", "<C-l>", action("workbench.action.navigateRight"), opts)

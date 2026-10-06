-- Set leader keys before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")

if vim.g.vscode then
  -- Running inside VS Code / Cursor via vscode-neovim
  require("core.vscode")
else
  require("plugins")
  require("core.keymaps")
end

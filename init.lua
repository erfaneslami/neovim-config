-- Set leader keys before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Load core configurations
--
require("core.options")     -- Vim settings
require("plugins")          -- Plugin manager and plugins
require("core.keymaps")     -- All keybindings (loads last to override plugin defaults)
print("🚀 Neovim config loaded! Leader key is <Space>")


return {
  
{
      "nvim-tree/nvim-web-devicons",
      lazy = true
},
{
        
    -- File explorer: nvim-tree
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
    config = function()
      require("nvim-tree").setup()

    -- Keymaps (Global)
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)      -- Toggle file explorer
    keymap("n", "<leader>f", ":NvimTreeFocus<CR>", opts)       -- Focus the file tree
    keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)     -- Refresh tree
    keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)
    end,
    }
    
  }
  

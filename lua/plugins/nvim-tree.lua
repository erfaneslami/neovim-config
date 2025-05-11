
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 35,
        side = "left",
        preserve_window_proportions = true,
        number = false,
        relativenumber = false,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
        },
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })

    -- Optional but useful keybindings
    local keymap = vim.keymap.set
    keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })
  end,
}

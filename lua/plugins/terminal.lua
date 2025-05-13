
 vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle horizontal terminal" })
 vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle vertical terminal" })
 vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })
-- lua/plugins/terminal.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,                       -- height for horizontal terminal
      open_mapping = [[<C-\>]],       -- toggle with Ctrl+\
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",       -- options: "horizontal", "vertical", "float", "tab"
      close_on_exit = true,
      shell = vim.o.shell,            -- shell to use
    })
  end,

  -- ToggleTerm keymaps
}




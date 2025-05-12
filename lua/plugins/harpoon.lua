
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require('harpoon')

    harpoon:setup()

    -- Create a list of marked files
    local list = harpoon:list()

    -- Keymaps
    vim.keymap.set('n', '<leader>ha', function() list:add() end, { desc = 'Harpoon Add File' })
    vim.keymap.set('n', '<leader>hh', function() harpoon.ui:toggle_quick_menu(list) end, { desc = 'Harpoon Menu' })

    -- Navigate to files (1-4)
    vim.keymap.set('n', '<leader>1', function() list:select(1) end, { desc = 'Harpoon File 1' })
    vim.keymap.set('n', '<leader>2', function() list:select(2) end, { desc = 'Harpoon File 2' })
    vim.keymap.set('n', '<leader>3', function() list:select(3) end, { desc = 'Harpoon File 3' })
    vim.keymap.set('n', '<leader>4', function() list:select(4) end, { desc = 'Harpoon File 4' })
  end,
}

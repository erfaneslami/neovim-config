
return {
  -- Main plugin
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required dependency
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = vim.fn.executable('make') == 1,
    },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        path_display = { "smart" },
        layout_config = {
          horizontal = { preview_width = 0.6 },
        },
        file_ignore_patterns = { "node_modules", ".git/", "%.lock", "__pycache__" },
        mappings = {
          i = {
            ["<C-k>"] = "move_selection_previous",
            ["<C-j>"] = "move_selection_next",
            ["<Esc>"] = "close",
          },
        },
      },
      pickers = {
        find_files = { hidden = true },
      },
    })

    -- Load fzf extension if available
    pcall(telescope.load_extension, 'fzf')

    -- Keymaps (normal mode)
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = '[F]ind by [G]rep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = '[F]ind [B]uffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = '[F]ind [H]elp' })
  end,
}

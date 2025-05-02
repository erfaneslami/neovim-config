return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      -- First define the highlights
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
      vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAdd' })
      vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChange' })
      vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDelete' })
      vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAdd' })
      vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChange' })
      vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDelete' })

      require('gitsigns').setup({
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
          ignore_whitespace = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      })

      -- Keymaps
      vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle git blame' })
      vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>', { desc = 'Git diff' })
      vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', { desc = 'Preview hunk' })
      vim.keymap.set('n', ']c', ':Gitsigns next_hunk<CR>', { desc = 'Next hunk' })
      vim.keymap.set('n', '[c', ':Gitsigns prev_hunk<CR>', { desc = 'Previous hunk' })
    end
  },

  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Git status' })
      vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = 'Git commit' })
      vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = 'Git push' })
      vim.keymap.set('n', '<leader>gl', ':Git pull<CR>', { desc = 'Git pull' })
    end
  },

  {
    'rhysd/git-messenger.vim',
    config = function()
      vim.keymap.set('n', '<leader>gm', '<Plug>(git-messenger)', { desc = 'Git message' })
    end
  },
}

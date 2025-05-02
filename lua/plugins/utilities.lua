return {
  -- Commenting
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- Better quickfix
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })

      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'File explorer' })
    end
  },

  -- Session management
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup({
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      })
    end
  },

  -- Markdown preview
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = 'markdown',
  },

  -- Better quickfix
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup()
      vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { desc = 'Toggle trouble' })
      vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { desc = 'Workspace diagnostics' })
      vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { desc = 'Document diagnostics' })
      vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { desc = 'Quickfix' })
      vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { desc = 'Location list' })
    end
  },

  -- Todo comments
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('todo-comments').setup()
      vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = 'Search todos' })
    end
  },
}

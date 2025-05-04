return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
              ['<C-q>'] = function(prompt_bufnr)
                actions.send_selected_to_qflist(prompt_bufnr)
                actions.open_qflist(prompt_bufnr)
              end,
            },
          },
          file_ignore_patterns = {
            'node_modules', '.git', '.cache', '%.o', '%.a', '%.out', '%.class',
            '%.pdf', '%.mkv', '%.mp4', '%.zip'
          },
          layout_strategy = 'horizontal',
          layout_config = {
            prompt_position = 'top',
          },
          sorting_strategy = 'ascending',
          winblend = 0,
          border = {},
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          color_devicons = true,
          set_env = { ['COLORTERM'] = 'truecolor' },
        },
        pickers = {
          find_files = {
            hidden = true,
            no_ignore = false,
          },
          live_grep = {
            additional_args = function(opts)
              return { '--hidden' }
            end
          },
          buffers = {
            sort_lastused = true,
            theme = 'dropdown',
            previewer = false,
            mappings = {
              i = {
                ['<C-d>'] = actions.delete_buffer,
              }
            }
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown()
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          }
        }
      })

      -- Load extensions
     -- telescope.load_extension('fzf')
      telescope.load_extension('ui-select')

      -- Keymaps
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Diagnostics' })
      vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'References' })
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Document symbols' })
    end
  },

  -- Telescope fzf native for better performance
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
}



return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,        -- classic bottom cmdline for search
        command_palette = true,      -- position cmdline and popupmenu together
        long_message_to_split = true,-- long messages sent to a split
        inc_rename = false,          -- enable if using inc-rename.nvim
        lsp_doc_border = true,       -- border for hover/signature
      },
    })
  end,
  }

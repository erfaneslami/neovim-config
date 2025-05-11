

return {
-- command line ui
{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      -- Enable command-line UI enhancement
      cmdline = {
        enabled = true,
        view = "cmdline_popup", -- Or "cmdline" (bottom-style)
      },

      -- Message UI settings (like :echo output, etc.)
      messages = {
        enabled = true,
        view = "mini", -- Use a compact view for messages
      },

      -- Popup view for notifications, search count, etc.
      popupmenu = {
        enabled = true,
        backend = "nui", -- Uses `nui.nvim` to render it
      },

      -- LSP-related enhancements
      lsp = {
        progress = {
          enabled = true, -- Show LSP loading/progress messages
        },
        signature = {
          enabled = true, -- Inline signature help while typing
        },
        hover = {
          enabled = true, -- Enhanced hover window
        },
        override = {
           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
           ["vim.lsp.util.stylize_markdown"] = true,
           ["cmp.entry.get_documentation"] = true,
        },
      },

      -- You can route messages to specific views
      routes = {},

      -- Notification integration with nvim-notify
      notify = {
        enabled = true,
      },

      -- Presets: enable nice UI for various features
      presets = {
        bottom_search = true,        -- Classic :/ at bottom
        command_palette = true,      -- Like VS Code's command palette
        long_message_to_split = true,-- Long messages open in a split
        inc_rename = false,          -- Requires `inc-rename.nvim`
        lsp_doc_border = true,       -- Add border to LSP hover/signature
      },

      -- Views (how things look)
      views = {
        cmdline_popup = {
          position = {
            row =  vim.o.lines - 10,-- 4 lines above the bottom, adjust as needed
          --  row = vim.o.lines,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
          },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
    })

    -- Optional: set noice to be your default notify handler
    vim.notify = require("notify")
  end,
},

{ "MunifTanjim/nui.nvim" },

-- notify system
{
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      -- Animation style: "fade", "slide", "fade_in_slide_out", "static"
      stages = "fade_in_slide_out",

      -- Background color for notifications
      background_colour = "#1e1e2e", -- Match your colorscheme (adjust as needed)

      -- Timeout for notification to disappear (in ms)
      timeout = 3000,

      -- Minimum and maximum width of notification windows
      max_width = 80,
      max_height = 10,

      -- Use icons for levels (ERROR, WARN, INFO, DEBUG, TRACE)
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },

      -- Whether to show notifications when they're replaced (queued)
      render = "default",

      -- Show newest notification on top
      top_down = true,
    })

    -- Set nvim-notify as the default notification function for Neovim
    vim.notify = require("notify")
  end,
},
-- starting theme
{
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    
    dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      
      }
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("r", "󰈢  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("g", "󰱼  Find text", ":Telescope live_grep<CR>"),
      dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
      dashboard.button("e", "  Explore nvim config", ":NvimTreeOpen ~/.config/nvim<CR>")
    }

    dashboard.section.footer.val = "🧠 Happy coding with Neovim + Tokyonight!"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
},

-- theme
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000, -- Load it first
  config = function()
    require("tokyonight").setup({
      style = "night",  -- Options: night, storm, moon, day
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
    })

    vim.cmd("colorscheme tokyonight")
  end,
},

{
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- or "tabs"
        numbers = "none", -- "ordinal" | "buffer_id" | "both" | function
        diagnostics = "nvim_lsp", -- shows LSP errors/warnings on tabs
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        separator_style = "slant", -- "slant" | "thick" | "thin" | { '', '' }
        always_show_bufferline = true,
      },
--      highlights = require("tokyonight.groups").get().bufferline, -- use Tokyonight highlights
    })
  end,
},
--lualine
{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "tokyonight",  -- use your colorscheme's theme
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "NvimTree", "neo-tree" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } }, -- 0 = just filename, 1 = relative path, 2 = absolute
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "nvim-tree", "fugitive", "quickfix" },
    })
  end,
}

}

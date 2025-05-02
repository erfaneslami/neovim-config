
return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    local notify = require("notify")

    notify.setup({
      -- Animation style (slide, fade, static)
      stages = "fade",

      -- Timeout for notifications in ms
      timeout = 3000,

      -- Background color behind notifications
      background_colour = "#1e222a",

      -- Maximum number of notifications to show at once
      max_width = 50,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,

      -- Minimum width for notification windows
      minimum_width = 30,

      -- Icons for levels (optional)
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
    })

    -- Replace the built-in vim.notify with nvim-notify
    vim.notify = notify
  end,
}

-- DAP Keymaps
vim.keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "DAP: Continue" })
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end, { desc = "DAP: Step Out" })
vim.keymap.set("n", "<leader>b", function() require("dap").toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Set Conditional Breakpoint" })


vim.keymap.set("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "DAP hover variable" })


vim.keymap.set("n", "<leader>dp", function()
  local widgets = require("dap.ui.widgets")
  widgets.preview()
end, { desc = "DAP preview expression" })



-- vim.keymap.set("n", "<leader>du", require("dapui").toggle, { desc = "Toggle DAP UI" })
-- vim.keymap.set("n", "<leader>de", require("dapui").eval, { desc = "Evaluate expression" })
-- vim.keymap.set("v", "<leader>de", require("dapui").eval, { desc = "Evaluate selection" })


-- lua/plugins/debug.lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio" -- 👈 Add this line
        },
      },
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "⭐" },

      controls = {
        enabled = true,
        element = "repl",
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "🔁",
          run_last = "🔄",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },

      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.4 },
            { id = "breakpoints", size = 0.2 },
            { id = "stacks", size = 0.2 },
            { id = "watches", size = 0.2 },
          },
          size = 50, -- width of the left panel
          position = "left",
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 12, -- height of bottom panel
          position = "bottom",
        },
      },

      floating = {
        max_height = 0.4,
        max_width = 0.4,
        border = "rounded",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },

      render = {
        max_type_length = 40,   -- truncate long type strings
        max_value_lines = 5,    -- wrap values across multiple lines
      },
    })

      -- Auto open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- C# / ASP.NET Core Debugger
      dap.adapters.coreclr = {
        type = "executable",
        command = "C:\\netcoredbg\\netcoredbg.exe", -- update this!
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch ASP.NET Core App",
          request = "launch",
          program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net7.0/MyApp.dll', 'file')
          end,
        },
      }
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = true,
        show_stop_reason = true,
        commented = false, -- if true: adds comment string before virtual text
      })
    end,
  }
}

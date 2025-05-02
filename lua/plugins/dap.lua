return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local mason_registry = require("mason-registry")

      -- Set the path to netcoredbg
      local netcoredbg_path = mason_registry.get_package("netcoredbg"):get_install_path() .. "/netcoredbg"

      -- Configure the adapter for .NET Core
      dap.adapters.coreclr = {
        type = "executable",
        command = netcoredbg_path,
        args = { "--interpreter=vscode" },
      }

      -- DAP configuration for C# projects
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch - .NET Core",
          request = "launch",
          program = function()
            return vim.fn.input("Path to DLL: ", vim.fn.getcwd() .. "/bin/Debug/net6.0/yourapp.dll", "file")
          end,
        },
      }

      -- Keymaps for debugging
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>B", function()
        dap.set_breakpoint(vim.fn.input("Condition: "))
      end, { desc = "Set Conditional Breakpoint" })
    end,
  },
}


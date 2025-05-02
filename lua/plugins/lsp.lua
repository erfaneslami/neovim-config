return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")

    -- Set up shared keymaps for all LSPs
    local on_attach = function(_, bufnr)
      local bufmap = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
      end

      bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
      bufmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
      bufmap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
      bufmap("n", "gr", vim.lsp.buf.references, "Go to references")
      bufmap("n", "K", vim.lsp.buf.hover, "Hover")
      bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
      bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
      bufmap("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, "Format file")
      bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
      bufmap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
      bufmap("n", "<leader>e", vim.diagnostic.open_float, "Diagnostics float")
      bufmap("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")
    end

    -- Lua LSP - for Neovim development
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT', -- Neovim uses LuaJIT
          },
          diagnostics = {
            globals = { 'vim' }, -- Recognize `vim` as a global
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        }
      }
    })

    -- OmniSharp - C# LSP
    lspconfig.omnisharp.setup({
      cmd = { "C:\\Users\\e.eslami\\omnisharp\\OmniSharp.exe" }, -- make sure this is installed and in your PATH
      on_attach = on_attach,
      enable_editorconfig_support = true,
      enable_roslyn_analyzers = true,
      organize_imports_on_format = true,
      enable_import_completion = true,
    })
  end
}


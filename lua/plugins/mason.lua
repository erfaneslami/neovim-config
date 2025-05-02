
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    lazy = false,
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- Set up Mason to install these LSPs
      mason_lspconfig.setup({
        ensure_installed = {
          "tsserver", "eslint", "html", "cssls",  -- Frontend
          "omnisharp",                            -- C#
          "clangd",                               -- C/C++
        },
      })

      -- Define LSP keymaps
      local function on_attach(_, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
        end

        -- LSP navigation
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>ca", vim.lsp.buf.code_action)
        map("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end)
      end

      -- Default handler
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
          })
        end,
        -- TypeScript with typescript.nvim (optional)
        ["tsserver"] = function()
          require("typescript").setup({
            server = {
              on_attach = on_attach,
            },
          })
        end,
      })
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    lazy = true,
  },
}

-- config/lspconfig.lua

local lspconfig = require("lspconfig")

-- Recommended capabilities for nvim-cmp autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- List of servers you want to enable
local servers = { "ts_ls", "lua_ls", "clangd", "jsonls", "html", "cssls" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end

-- Example Lua LSP (fixing "undefined global 'vim'" issue)
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
    completion = {
      callSnippet = "Replace",
    },
  },
  capabilities = capabilities,
})

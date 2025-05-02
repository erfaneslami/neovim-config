
return {
  "hrsh7th/nvim-cmp",  -- The main completion plugin
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer",    -- Buffer source for nvim-cmp
    "hrsh7th/cmp-path",      -- Path source for nvim-cmp
    "saadparwaiz1/cmp_luasnip",  -- LuaSnip source for nvim-cmp
    "L3MON4D3/LuaSnip",  -- Snippet engine for LuaSnip
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)  -- Use LuaSnip for expanding snippets
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),  -- Scroll documentation up
        ['<C-f>'] = cmp.mapping.scroll_docs(4),   -- Scroll documentation down
        ['<C-Space>'] = cmp.mapping.complete(),   -- Trigger completion menu
        ['<C-e>'] = cmp.mapping.abort(),          -- Abort completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm completion
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },         -- LSP source
        { name = 'luasnip' },          -- Snippets source
      }, {
        { name = 'buffer' },           -- Buffer source (for words in current buffer)
        { name = 'path' },             -- Path source
      }),
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },  -- Show kind, abbreviation, and menu in completion
        format = function(entry, vim_item)
          vim_item.kind = string.format('%s', vim_item.kind)  -- Display kind as symbol (e.g., Function)
          return vim_item
        end,
      },
    })
  end,
}

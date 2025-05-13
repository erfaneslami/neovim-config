
-- plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "typescript", "tsx", "javascript",
          "html", "css", "json", "c"
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
      })
    end,
  },
  {
  "windwp/nvim-ts-autotag",
  ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact" },
  config = true,
  }
}

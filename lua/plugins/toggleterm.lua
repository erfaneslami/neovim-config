return   {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float", -- or "horizontal" / "vertical"
        open_mapping = [[<c-\>]], -- you can change this
      })
    end,
  }

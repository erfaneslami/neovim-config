
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl", -- use the new module name
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("ibl").setup({
      indent = {
        char = "│", -- or "▏", "┊", "¦", "⎸", etc.
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
    })
  end,
}

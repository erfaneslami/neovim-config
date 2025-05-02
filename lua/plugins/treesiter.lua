
return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  run = ":TSUpdate",  -- Automatically update parsers when starting Neovim
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Ensure the parsers you want are installed
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "lua",
        "html",
        "css",
        "json",
        "bash",
        "python",
        "c_sharp", -- Add C# parser here
      },

      -- Enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      -- Enable auto-indentation
      indent = {
        enable = true,
      },

      -- Enable text objects (for use with keymaps)
      textobjects = {
        enable = true,
        lookahead = true,  -- Automatically move to next text object
        keymaps = {
          ["af"] = "@function.outer",  -- Select entire function
          ["if"] = "@function.inner",  -- Select inside function
          ["ac"] = "@class.outer",     -- Select entire class
          ["ic"] = "@class.inner",     -- Select inside class
        },
      },

      -- Enable folding
      fold = {
        enable = true,
        disable = { "python" },  -- Disable folding for Python (optional)
      },
    })
  end,
}

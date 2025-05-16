return {
  {

    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
          virt_text_pos = "eol", -- or 'overlay', 'right_align'
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
          end

          -- Navigation
          map("n", "]h", gs.next_hunk, "Next Hunk")
          map("n", "[h", gs.prev_hunk, "Previous Hunk")

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
          map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
          map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end,
            "Stage Hunk (visual)")
          map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end,
            "Reset Hunk (visual)")

          map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
          map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
          map("n", "<leader>hb", gs.toggle_current_line_blame, "Toggle Line Blame")
          map("n", "<leader>hB", function() gs.blame_line { full = true } end, "Full Blame Line")
        end,
      })
    end,

  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Glog", "Ggrep", "Gmove", "Gremove", "Gbrowse" },
    --    keys = {
    --      { "<leader>gs", ":Git<CR>", desc = "Git status" },
    --      { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
    --      { "<leader>gp", ":Git push<CR>", desc = "Git push" },
    --      { "<leader>gl", ":Git pull<CR>", desc = "Git pull" },
    --      { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff split" },
    --      { "<leader>gb", ":Git blame<CR>", desc = "Git blame" },
    --      { "<leader>gw", ":Gwrite<CR>", desc = "Git add current file" },
    -- }
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        use_icons = true,
        view = {
          merge_tool = {
            layout = "diff3_mixed",
          },
        },
        file_panel = {
          listing_style = "tree", -- or "list"
          win_config = {
            position = "right",
            width = 40,
          },
        },
      })

      -- Open the full git diff UI with file list on the right
      vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>", { desc = "Open Git Diff View" })

      -- Close the diffview window
      vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Close Git Diff View" })

      -- View full file or commit history
      vim.keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>", { desc = "Git File History" })
    end,
  }
}


local M = {}

M.smart_bufdelete = function(force)
  local bufnr = vim.api.nvim_get_current_buf()
  local wins = vim.api.nvim_list_wins()

  -- Find alternative buffer (not NvimTree, not the one being deleted)
  local alt_buf = nil
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(b) and b ~= bufnr and vim.bo[b].buftype == "" then
      alt_buf = b
      break
    end
  end

  if alt_buf then
    for _, win in ipairs(wins) do
      if vim.api.nvim_win_get_buf(win) == bufnr then
        vim.api.nvim_win_set_buf(win, alt_buf)
      end
    end
  end

  require("bufdelete").bufdelete(bufnr, force or false)
end

return M

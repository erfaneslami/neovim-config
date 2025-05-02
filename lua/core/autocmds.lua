local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
  end
})

-- Filetype specific settings
autocmd('FileType', {
  pattern = { 'c', 'cpp', 'cs' },
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
  end
})

-- Auto create dir when saving a file in non-existent directory
autocmd('BufWritePre', {
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match
    local dir = vim.fn.fnamemodify(file, ':h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end
})

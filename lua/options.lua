require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.blade.php",
  group = augroup("BladeFiletypeRelated", { clear = true }),
  callback = function()
    vim.opt.filetype = "blade"
  end,
})

autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.templ",
  group = augroup("TemplFiletypeRelated", { clear = true }),
  callback = function()
    vim.opt.filetype = "templ"
  end,
})

autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
  callback = function()
    vim.t.bufs = vim.tbl_filter(function(bufnr)
      return vim.api.nvim_buf_get_option(bufnr, "modified")
    end, vim.t.bufs)
  end,
})

vim.opt.colorcolumn = "120"

vim.opt.foldmethod = "manual"

vim.opt.foldenable = false

vim.opt.number = true

vim.opt.relativenumber = true

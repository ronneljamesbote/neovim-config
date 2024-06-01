require "nvchad.options"
require "helpers.load_filetypes_associations"

-- autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       return vim.api.nvim_buf_get_option(bufnr, "modified")
--     end, vim.t.bufs)
--   end,
-- })

vim.opt.colorcolumn = "120"

vim.opt.foldmethod = "manual"

vim.opt.foldenable = false

vim.opt.number = true

vim.opt.relativenumber = true

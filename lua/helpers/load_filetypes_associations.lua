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

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
  callback = function()
    if vim.t == nil then
      return
    end

    vim.t.bufs = vim.tbl_filter(function(bufnr)
      return vim.api.nvim_get_option_value("modified", { buf = bufnr })
    end, vim.t.bufs)
  end,
})

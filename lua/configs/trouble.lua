local options = {
  mode = "document_diagnostics",
}

local keys = {
  {
    "<leader>cl",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    desc = "Diagnostics Buffer (Trouble)",
  },
  {
    "<leader>cs",
    "<cmd>Trouble symbols toggle focus=false win.position=bottom<cr>",
    desc = "Symbols (Trouble)",
  },
}

return {
  options = options,
  keys = keys,
  cmd = "Trouble",
}

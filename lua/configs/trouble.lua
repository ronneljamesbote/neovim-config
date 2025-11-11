return {
  opts = {
    mode = "document_diagnostics",
  },
  cmd = "Trouble",
  keys = {
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
  },
}

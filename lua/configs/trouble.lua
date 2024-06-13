return {
  opts = {
    mode = "document_diagnostics",
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>cl",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
  },
}

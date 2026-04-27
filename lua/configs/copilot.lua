return {
  config = function()
    require("copilot").setup {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        cpp = false,
      },
    }
  end,
}

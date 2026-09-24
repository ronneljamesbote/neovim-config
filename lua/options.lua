require "nvchad.options"
require "helpers.restore_cursor_position"

vim.opt.colorcolumn = "120"

vim.opt.relativenumber = true

vim.opt.winborder = "single" -- default border for ALL floating windows (LSP hover, diagnostics, …)
vim.opt.inccommand = "split" -- live :substitute preview

vim.filetype.add {
  extension = {
    script = "lua",
    gui_script = "lua",
    render_script = "lua",
    editor_script = "lua",
  },
}

vim.opt.foldmethod = "expr"

vim.opt.foldcolumn = "1"

vim.opt.fillchars = {
  foldopen = "▼",
  foldclose = "▶",
  foldsep = " ",
  fold = " ",
}

vim.opt.foldlevel = 99

vim.opt.foldlevelstart = 99

vim.opt.foldenable = true

require "nvchad.options"
require "helpers.restore_cursor_position"

-- install xclip for x11, or wl-clipboard for wayland on linux
vim.opt.clipboard = "unnamedplus"

vim.opt.colorcolumn = "120"

vim.opt.number = true

vim.opt.relativenumber = true

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

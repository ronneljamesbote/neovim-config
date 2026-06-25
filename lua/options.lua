require "nvchad.options"
require "helpers.restore_cursor_position"

-- install xclip for x11, or wl-clipboard for wayland on linux
vim.opt.clipboard = "unnamedplus"

vim.opt.colorcolumn = "120"

vim.opt.foldmethod = "manual"

vim.opt.foldenable = false

vim.opt.number = true

vim.opt.relativenumber = true

require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<leader>fm")
nomap("n", "<tab>")

local format_file = require "helpers.format_file"

-- QoL keymaps

map("n", ";", ":", { desc = "CMD enter command mode" })
map("v", ">", ">gv", { desc = "Add indent" })

-- Custom commands

map("n", "<leader>fq", function()
  require("telescope.builtin").live_grep { additional_args = { "-u" } }
end, { desc = "Live grep hidden files" })
map("n", "<leader>fm", format_file, { desc = "LSP formatting" })

-- TmuxVim navigation

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "TmuxNavigate move to window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "TmuxNavigate move to window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "TmuxNavigate move to window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "TmuxNavigate move to window up" })

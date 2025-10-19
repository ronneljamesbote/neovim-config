require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Remove default mappings to avoid conflicts
nomap("n", "<leader>fm")
nomap("n", "<tab>")
nomap("n", "<C-n>")
nomap("i", "<C-J>")

local format_file = require "helpers.format_file"

-- Command mode with ;
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Add indent in visual mode
map("v", ">", ">gv", { desc = "Add indent" })

-- Telescope with hidden files
map("n", "<leader>fq", function()
  require("telescope.builtin").live_grep { additional_args = { "-u" } }
end, { desc = "Live grep hidden files" })

-- LSP formatting
map("n", "<leader>fm", format_file, { desc = "LSP formatting" })

-- Open NvimTree
map("n", "<C-b>", "<cmd> NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- LSP hover
map("n", "gh", vim.lsp.buf.hover, { desc = "LSP hover" })

-- Copilot accept suggestion with Ctrl+J
map("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

-- TmuxVim navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "TmuxNavigate move to window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "TmuxNavigate move to window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "TmuxNavigate move to window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "TmuxNavigate move to window up" })

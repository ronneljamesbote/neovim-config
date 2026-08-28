require "nvchad.mappings"
local harpoon = require "harpoon"

local function toggle_harpoon_telescope(harpoon_files)
  local finder = function()
    local paths = {}

    for _, item in ipairs(harpoon_files.items) do
      table.insert(paths, item.value)
    end

    return require("telescope.finders").new_table {
      results = paths,
    }
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = finder(),
      previewer = false,
      sorter = require("telescope.config").values.generic_sorter {},
      layout_config = {
        height = 0.4,
        width = 0.5,
        prompt_position = "top",
        preview_cutoff = 120,
      },
      attach_mappings = function(prompt_bufnr, map)
        map("i", "<C-d>", function()
          local state = require "telescope.actions.state"
          local selected_entry = state.get_selected_entry()
          local current_picker = state.get_current_picker(prompt_bufnr)

          table.remove(harpoon_files.items, selected_entry.index)
          current_picker:refresh(finder())
        end)
        return true
      end,
    })
    :find()
end

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Remove default mappings to avoid conflicts
nomap("n", "<leader>fm")
nomap("n", "<tab>")
nomap("n", "<C-n>")
nomap("i", "<C-J>")
nomap("n", "gcc")

-- Remove default telescope oldfiles mapping to override with project-scoped version
nomap("n", "<leader>fo")

map("n", "<leader>fo", function()
  local root = require("helpers.project_root").get()
  require("telescope.builtin").oldfiles { cwd = root }
end, { desc = "Recent files for project root" })

-- local format_file = require "helpers.format_file"

-- Command mode with ;
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Add indent in visual mode
map("v", ">", ">gv", { desc = "Add indent" })

-- Telescope with hidden files
map("n", "<leader>fq", function()
  require("telescope.builtin").live_grep { additional_args = { "-u" } }
end, { desc = "Live grep hidden files" })

-- LSP formatting
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "LSP formatting" })

-- Open NvimTree
map("n", "<C-b>", "<cmd> NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- LSP hover
map("n", "gh", vim.lsp.buf.hover, { desc = "LSP hover" })

-- Copilot accept suggestion with Ctrl+J
-- map("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false,
-- })
-- vim.g.copilot_no_tab_map = true

-- TmuxVim navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "TmuxNavigate move to window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "TmuxNavigate move to window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "TmuxNavigate move to window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "TmuxNavigate move to window up" })

-- Harpoon keymaps
map("n", "<C-e>", function()
  toggle_harpoon_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add harpoon entry" })

map("n", "<C-y>", function()
  harpoon:list():select(1)
end)
map("n", "<C-u>", function()
  harpoon:list():select(2)
end)
map("n", "<C-i>", function()
  harpoon:list():select(3)
end)
map("n", "<C-o>", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
map("n", "<C-S-N>", function()
  harpoon:list():next()
end)
-- Git hunks popup (jump to hunk in current buffer)
map("n", "<leader>gh", function()
  require("helpers.git_hunks").toggle()
end, { desc = "Git hunks (current buffer)" })

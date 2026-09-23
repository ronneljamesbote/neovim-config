local M = {}

local telescope_layout = require "helpers.telescope_layout"

local function first_changed_line(lines)
  local deleted_line

  for _, line in ipairs(lines or {}) do
    if line:sub(1, 1) == "+" and line:sub(1, 3) ~= "+++" then
      return line
    end

    if not deleted_line and line:sub(1, 1) == "-" and line:sub(1, 3) ~= "---" then
      deleted_line = line
    end
  end

  return deleted_line or ""
end

function M.toggle()
  local hunks = require("gitsigns").get_hunks(0)

  if hunks == nil then
    vim.notify("Not a git-tracked buffer", vim.log.levels.ERROR)
    return
  end

  local bufname = vim.api.nvim_buf_get_name(0)

  table.sort(hunks, function(left, right)
    return left.added.start < right.added.start
  end)

  local finder = require("telescope.finders").new_table {
    results = hunks,
    entry_maker = function(hunk)
      local first_line = first_changed_line(hunk.lines)
      local symbol = hunk.type == "add" and "+" or hunk.type == "delete" and "-" or "~"

      return {
        display = string.format("%s  L%d  %s", symbol, hunk.added.start, first_line:sub(1, 60)),
        ordinal = hunk.head .. " " .. first_line,
        lnum = hunk.added.start,
        path = bufname,
      }
    end,
  }

  require("telescope.pickers")
    .new(
      {},
      vim.tbl_extend("force", telescope_layout.vertical(), {
        prompt_title = "Git hunks (current buffer)",
        finder = finder,
        previewer = require("telescope.previewers").vim_buffer_cat.new {},
        sorter = require("telescope.config").values.generic_sorter {},
        attach_mappings = function(prompt_bufnr, map)
          local jump = function()
            local entry = require("telescope.actions.state").get_selected_entry()

            if not entry then
              return
            end

            require("telescope.actions").close(prompt_bufnr)
            vim.api.nvim_win_set_cursor(0, { entry.lnum, 0 })
            vim.cmd "normal! zz"
          end

          map("i", "<CR>", jump)
          map("n", "<CR>", jump)
          return true
        end,
      })
    )
    :find()
end

return M

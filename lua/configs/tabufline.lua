local api = vim.api

local M = {}

local opts = nil
local function options()
  if not opts then
    opts = require("nvconfig").ui.tabufline
  end
  return opts
end

local calculating_space = false

local function in_window(bufnr)
  for _, win in ipairs(api.nvim_tabpage_list_wins(0)) do
    if api.nvim_win_get_buf(win) == bufnr then
      return true
    end
  end
  return false
end

local function visible(bufnr, current)
  return api.nvim_buf_is_valid(bufnr)
    and vim.bo[bufnr].buflisted
    and (bufnr == current or api.nvim_get_option_value("modified", { buf = bufnr }) or in_window(bufnr))
end

-- keep vim.t.bufs (the tab bar's buffer list) in sync with what the tab bar
-- should show: the current buffer plus any modified buffer. NvChad's
-- close_buffer / next / prev navigate this list, so pruning it prevents
-- previously opened files from resurfacing when the visible tab is closed.
local function sync_bufs()
  local bufs = vim.t.bufs
  if not bufs then
    return
  end

  local current = api.nvim_get_current_buf()
  local kept, seen = {}, {}

  for _, bufnr in ipairs(bufs) do
    if visible(bufnr, current) then
      kept[#kept + 1] = bufnr
      seen[bufnr] = true
    end
  end

  -- re-add buffers that became visible (e.g. newly modified in the
  -- background, or the current buffer after NvChad dropped it)
  for _, bufnr in ipairs(api.nvim_list_bufs()) do
    if not seen[bufnr] and visible(bufnr, current) then
      kept[#kept + 1] = bufnr
    end
  end

  vim.t.bufs = kept
  vim.cmd.redrawtabline()
end

local function available_space()
  local columns = vim.o.columns
  if calculating_space then
    return columns
  end

  calculating_space = true
  local ok, status = pcall(api.nvim_eval_statusline, "%!v:lua.require('nvchad.tabufline.modules')()", {
    use_tabline = true,
  })
  calculating_space = false

  return ok and columns - status.width or columns
end

function M.buffers()
  if calculating_space then
    return ""
  end

  local current = api.nvim_get_current_buf()
  local listed = vim.tbl_filter(api.nvim_buf_is_valid, vim.t.bufs or {})
  local visible = {}

  for index, bufnr in ipairs(listed) do
    if bufnr == current or api.nvim_get_option_value("modified", { buf = bufnr }) then
      visible[#visible + 1] = { bufnr = bufnr, index = index }
    end
  end

  local txt = require("nvchad.tabufline.utils").txt
  local style_buf = require("nvchad.tabufline.utils").style_buf
  local bufwidth = options().bufwidth

  local buffers = {}
  local has_current = false
  local width = available_space()

  for _, buffer in ipairs(visible) do
    if ((#buffers + 1) * bufwidth) > width then
      if has_current then
        break
      end

      table.remove(buffers, 1)
    end

    has_current = current == buffer.bufnr or has_current
    buffers[#buffers + 1] = style_buf(buffer.bufnr, buffer.index, bufwidth)
  end

  return table.concat(buffers) .. txt("%=", "Fill")
end

function M.setup()
  local group = api.nvim_create_augroup("UserTabufline", { clear = true })

  api.nvim_create_autocmd({ "BufAdd", "BufEnter", "BufModifiedSet" }, {
    group = group,
    callback = sync_bufs,
  })
end

return M

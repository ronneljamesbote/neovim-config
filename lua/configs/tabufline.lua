local api = vim.api

local M = {}

local utils = require "nvchad.tabufline.utils"

local function new_hl(group1, group2)
  local fg = vim.api.nvim_get_hl(0, { name = group1 }).fg
  local bg = vim.api.nvim_get_hl(0, { name = "Tb" .. group2 }).bg
  vim.api.nvim_set_hl(0, group1 .. group2, { fg = fg, bg = bg })
  return "%#" .. group1 .. group2 .. "#"
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

local function filename(str)
  return str:match "([^/\\]+)[/\\]*$"
end

-- disambiguate duplicate basenames, same rule as nvchad's style_buf
local function gen_unique_name(name, index)
  for i2, nr2 in ipairs(vim.t.bufs) do
    local filepath = filename(api.nvim_buf_get_name(nr2))
    if index ~= i2 and filepath == name then
      return vim.fn.fnamemodify(api.nvim_buf_get_name(vim.t.bufs[index]), ":h:t") .. "/" .. name
    end
  end
end

-- Render one buffer tab showing the full (untruncated) file name.
-- Returns the tabline string and its display width in columns.
local function style_buf(nr, i)
  local is_curbuf = api.nvim_get_current_buf() == nr
  local tbHlName = "BufO" .. (is_curbuf and "n" or "ff")

  local name = filename(api.nvim_buf_get_name(nr))
  name = name and (gen_unique_name(name, i) or name) or " No Name "

  local icon, icon_hl = " 󰈚 ", new_hl("DevIconDefault", tbHlName)
  if name ~= " No Name " then
    local devicon, devicon_hl = require("nvim-web-devicons").get_icon(name)
    if devicon then
      icon, icon_hl = " " .. devicon .. " ", new_hl(devicon_hl, tbHlName)
    end
  end

  -- tabline strings must escape literal % in file names
  local escaped = name:gsub("%%", "%%%%")

  local close_btn = utils.btn(" 󰅖 ", nil, "KillBuf", nr)

  local mod = api.nvim_get_option_value("modified", { buf = nr })
  if is_curbuf then
    close_btn = mod and utils.txt("   ", "BufOnModified") or utils.txt(close_btn, "BufOnClose")
  else
    close_btn = mod and utils.txt("   ", "BufOffModified") or utils.txt(close_btn, "BufOffClose")
  end

  local str = " " .. icon_hl .. icon .. utils.txt(escaped, tbHlName) .. " " .. close_btn
  str = utils.btn(str, nil, "GoToBuf", nr)

  -- 1 lead space + 3 icon + name + 1 space + 3 close/modified slot
  local width = 1 + 3 + vim.fn.strdisplaywidth(name) + 1 + 3
  return str, width
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

  local buffers, widths = {}, {}
  local total = 0
  local has_current = false
  local width = available_space()

  for _, buffer in ipairs(visible) do
    local rendered, w = style_buf(buffer.bufnr, buffer.index)

    if total + w > width then
      if has_current then
        break
      end
      -- drop oldest tabs from the front until it fits
      while #buffers > 0 and total + w > width do
        total = total - widths[1]
        table.remove(widths, 1)
        table.remove(buffers, 1)
      end
    end

    has_current = current == buffer.bufnr or has_current
    buffers[#buffers + 1] = rendered
    widths[#widths + 1] = w
    total = total + w
  end

  return table.concat(buffers) .. utils.txt("%=", "Fill")
end

function M.setup()
  local group = api.nvim_create_augroup("UserTabufline", { clear = true })

  api.nvim_create_autocmd({ "BufAdd", "BufEnter", "BufModifiedSet" }, {
    group = group,
    callback = sync_bufs,
  })
end

return M

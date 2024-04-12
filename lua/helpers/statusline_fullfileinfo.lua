local function stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

local function replace(str, what, with)
  what = string.gsub(what, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1")
  with = string.gsub(with, "[%%]", "%%%%")

  return string.gsub(str, what, with)
end

local function statusline_fullfileinfo()
  local empty_string = "Empty "

  local icon = " 󰈚 "
  local project_path = empty_string

  local fullpath = vim.api.nvim_buf_get_name(stbufnr())
  local filename = (fullpath == "" and empty_string) or fullpath:match "([^/\\]+)[/\\]*$"

  if filename ~= empty_string then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")

    if devicons_present then
      local ft_icon = devicons.get_icon(filename)

      icon = (ft_icon ~= nil and " " .. ft_icon) or icon
    end

    project_path = replace(fullpath, vim.loop.cwd() .. "/", "")

    if project_path:len() > 120 then
      project_path = "..." .. filename
    end
  end

  return "%#StText# " .. icon .. " " .. project_path .. " "
end

return statusline_fullfileinfo

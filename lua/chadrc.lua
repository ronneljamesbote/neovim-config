-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

local statusline_fullfileinfo = require "helpers.statusline_fullfileinfo"

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",
  transparency = true,
  statusline = {
    theme = "vscode_colored",
    modules = {
      file = statusline_fullfileinfo,
    },
  },
  tabufline = {
    order = { "treeOffset" },
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return M

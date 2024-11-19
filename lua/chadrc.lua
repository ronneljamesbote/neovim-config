-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

local statusline_fullfileinfo = require "helpers.statusline_fullfileinfo"
local flatten_tables = require "helpers.flatten_tables"

---@type ChadrcConfig
local M = {}

M.lsp = {
  signature = true,
}

M.ui = {
  tabufline = {
    order = { "treeOffset" },
  },
  statusline = {
    theme = "vscode_colored",
  },
}

M.base46 = {
  theme = "onedark",
  transparency = true,
  statusline = {
    modules = {
      file = statusline_fullfileinfo,
    },
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.mason = {
  pkgs = flatten_tables {
    web = {
      -- LSP
      "css-lsp",
      "html-lsp",
      "emmet-ls",
      "tailwindcss-language-server",

      -- Formatters
      "prettier",
    },

    lua = {
      -- LSP
      "lua-language-server",

      -- Formatters
      "stylua",
    },

    php = {
      -- LSP
      "intelephense",

      -- Diagnostics
      "phpstan",

      -- Formatters
      "pint",
    },

    javascript = {
      -- LSP
      "typescript-language-server",

      -- Linters
      "eslint-lsp",
    },

    go = {
      -- LSP
      "gopls",

      -- Formatters
      "gofumpt",
      "goimports-reviser",

      -- Debuggers
      "delve",

      -- Templating
      "templ",
    },

    python = {
      -- LSP
      "pyright",
      "ruff",

      -- Diagnostics
      "black",

      -- Linters
      "mypy",
    },

    extra = {
      "marksman",
    },
  },
}

return M

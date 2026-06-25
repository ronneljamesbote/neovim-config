local flatten_tables = require "helpers.flatten_tables"

local ensure_installed = {
  web = {
    "html",
    "css",
    "scss",
    "json",
  },

  languages = {
    "c",
    "cpp",
    "vim",
    "lua",
    "php",
    "javascript",
    "typescript",
    "python",
    "go",
    "java",
    "sql",
    "odin",
  },

  templates = {
    "tsx",
    "vue",
  },

  others = {
    "vimdoc",
    "yaml",
    "markdown",
    "markdown_inline",
  },
}

return {
  opts = function()
    local required_parsers = flatten_tables(ensure_installed)

    -- Simply run the installation; the new main branch skips it if already valid
    -- Or use the clean Neovim core function to safely look for the language parser
    for _, lang in ipairs(required_parsers) do
      local has_parser = pcall(vim.treesitter.language.add, lang)
      if not has_parser then
        vim.cmd("TSInstall " .. lang)
      end
    end

    return {
      ensure_installed = required_parsers,

      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
    }
  end,
}

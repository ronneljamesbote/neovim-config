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
    "luadoc",
    "printf",
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
  parsers = flatten_tables(ensure_installed),
}

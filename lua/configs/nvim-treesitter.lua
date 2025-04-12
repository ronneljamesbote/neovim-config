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
    "vim",
    "lua",
    "php",
    "javascript",
    "typescript",
    "python",
    "go",
    "java",
    "rust",
    "sql",
  },

  templates = {
    "blade",
    "twig",
    "templ",
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
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    return {
      ensure_installed = flatten_tables(ensure_installed),

      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
    }
  end,
}

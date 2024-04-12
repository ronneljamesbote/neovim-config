local flatten_tables = require "helpers.flatten_tables"

local ensure_installed = {
  web = {
    "html",
    "css",
    "scss",
    "json",
  },

  languages = {
    "php",
    "javascript",
    "typescript",
    "python",
    "go",
    "java",
    "rust",
    "vim",
    "lua",
    "sql",
  },

  templates = {
    "blade",
    "twig",
    "templ",
  },

  files = {
    "tsx",
    "vue",
  },

  others = {
    "markdown",
    "markdown_inline",
    "yaml",
    "vimdoc",
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

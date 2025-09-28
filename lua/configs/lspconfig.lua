local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local util = require "lspconfig/util"

local server_configs = {
  web = {
    html = {
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "templ" },
    },
    tailwindcss = {
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "blade", "templ" },
      init_options = { userLanguages = { templ = "html" } },
    },
    cssls = {
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        less = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    },
  },

  javascript = {
    vtsls = {},
    eslint = {
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "blade", "javascript", "typescript" },
      settings = {
        codeActionOnSave = {
          enable = true,
          mode = "all",
        },
        workingDirectory = { mode = "location", path = "." },
      },
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true

        on_attach(client, bufnr)
      end,
    },
  },

  go = {
    templ = {},
    gopls = {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    },
  },

  php = {
    intelephense = {},
  },

  python = {
    pyright = {
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
      },
    },
    ruff = {
      on_attach = function(client, bufnr)
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false

        on_attach(client, bufnr)
      end,
    },
  },

  ruby = {
    ruby_lsp = {},
  },

  extra = {
    marksman = {},
  },
}

return {
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    for _, language in pairs(server_configs) do
      for name, server in pairs(language) do
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end
    end
  end,
}

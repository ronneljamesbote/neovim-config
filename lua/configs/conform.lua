local options = {
  format_on_save = {
    -- lsp_fallback = true,
    timeout_ms = 500,
    lsp_format = "first",
    filter = function(client)
      return client.name == "eslint"
    end,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    cpp = { "clang-format" },
    php = { "pint" },
    go = { "gofumpt", "goimports-reviser" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    odin = { "odinfmt" },
  },
}

return options

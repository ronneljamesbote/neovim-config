return {
  config = function()
    require("conform").setup {
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
        -- php = { "pint" },
        go = { "gofumpt", "goimports_reviser" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
      },
    }
  end,
}

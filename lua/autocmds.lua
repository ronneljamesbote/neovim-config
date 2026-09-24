require "nvchad.autocmds"

require("configs.tabufline").setup()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local win = vim.fn.bufwinid(args.buf)

    if win ~= -1 and client and client:supports_method "textDocument/foldingRange" then
      vim.wo[win].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})

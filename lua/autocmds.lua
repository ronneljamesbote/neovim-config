require "nvchad.autocmds"

require("configs.tabufline").setup()

local function use_treesitter_folds(win)
  vim.wo[win].foldexpr = "v:lua.vim.treesitter.foldexpr()"
end

local function use_lsp_folds(win)
  vim.wo[win].foldexpr = "v:lua.vim.lsp.foldexpr()"
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local win = vim.fn.bufwinid(args.buf)

    if win == -1 then
      return
    end

    if client and client:supports_method "textDocument/foldingRange" then
      use_lsp_folds(win)
    else
      use_treesitter_folds(win)
    end
  end,
})

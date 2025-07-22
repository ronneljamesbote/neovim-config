-- Reference: https://github.com/NvChad/ui/blob/dc4950f5bd4117e2da108b681506c908b93d4a62/lua/nvchad/blink/config.lua
dofile(vim.g.base46_cache .. "blink")

return {
  opts = {
    snippets = { preset = "luasnip" },
    cmdline = { enabled = true },
    appearance = { nerd_font_variant = "normal" },
    fuzzy = { implementation = "prefer_rust" },
    sources = { default = { "lsp", "snippets", "buffer", "path" } },

    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      -- ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      -- ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },

    completion = {
      ghost_text = { enabled = true },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "single" },
      },

      -- from nvchad/ui plugin
      -- exporting the ui config of nvchad blink menu
      -- helps non nvchad users
      menu = require("nvchad.blink").menu,
    },
  },
}

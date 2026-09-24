-- Reference: https://github.com/NvChad/ui/blob/dc4950f5bd4117e2da108b681506c908b93d4a62/lua/nvchad/blink/config.lua
dofile(vim.g.base46_cache .. "blink")

return {
  opts = {
    snippets = { preset = "luasnip" },
    cmdline = { enabled = true },
    appearance = { nerd_font_variant = "normal" },
    fuzzy = { implementation = "prefer_rust" },
    -- NOTE: merged over nvchad's config with vim.tbl_deep_extend("force") in lua/plugins/init.lua.
    -- Lists merge index-wise: appending sources works, but to REMOVE a source (e.g. "path") you
    -- must keep the full desired list here — shortening it leaves nvchad's trailing entries intact.
    sources = { default = { "lsp", "snippets", "buffer", "path" } },

    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
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

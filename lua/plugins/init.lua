return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.nvim-treesitter").options,
    config = function()
      require("configs.nvim-treesitter").config()
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "mbbill/undotree",
    config = require "configs.undotree",
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = require("configs.trouble").options,
    cmd = require("configs.trouble").cmd,
    keys = require("configs.trouble").keys,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require "configs.harpoon",
  },

  {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    keys = require("configs.opencode").keys,
    config = require("configs.opencode").config,
  },

  {
    import = "nvchad.blink.lazyspec",
  },

  {
    "github/copilot.vim",
    enabled = false,
  },

  -- Reference: https://github.com/NvChad/ui/blob/dc4950f5bd4117e2da108b681506c908b93d4a62/lua/nvchad/blink/lazyspec.lua
  -- {
  --   "saghen/blink.cmp",
  --   version = "1.*",
  --   event = { "InsertEnter", "CmdLineEnter" },
  --   dependencies = {
  --     "rafamadriz/friendly-snippets",
  --     {
  --       -- snippet plugin
  --       "L3MON4D3/LuaSnip",
  --       dependencies = "rafamadriz/friendly-snippets",
  --       opts = { history = true, updateevents = "TextChanged,TextChangedI" },
  --       config = function(_, opts)
  --         require("luasnip").config.set_config(opts)
  --         require "nvchad.configs.luasnip"
  --       end,
  --     },
  --     {
  --       "windwp/nvim-autopairs",
  --       opts = {
  --         fast_wrap = {},
  --         disable_filetype = { "TelescopePrompt", "vim" },
  --       },
  --     },
  --   },
  --   opts_extend = { "sources.default" },
  --   opts = require("configs.blink").opts,
  -- },
}

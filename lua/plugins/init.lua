return {
  {
    "stevearc/conform.nvim",
    lazy = false,
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
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
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
    import = "nvchad.blink.lazyspec",
  },

  -- user blink opts, merged on top of nvchad's own config (nvchad.blink.lazyspec above)
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, require("configs.blink").opts)
    end,
  },
}

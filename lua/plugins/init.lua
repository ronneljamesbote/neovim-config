return {
  {
    "williamboman/mason.nvim",
    opts = require("configs.mason").opts,
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = require("configs.null-ls").config,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig").config()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.nvim-treesitter").opts,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = require("configs.nvim-treesitter-textobjects").config,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.nvim-tree").opts,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = require("configs.better-escape").config,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "mbbill/undotree",
    lazy = false,
    config = require("configs.undotree").config,
  },

  {
    "nvim-tree/nvim-web-devicons",
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = require("configs.trouble").opts,
  },

  {
    "mfussenegger/nvim-dap",
    init = require("configs.nvim-dap").init,
    config = require("configs.nvim-dap").config,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = require("configs.nvim-dap-ui").config,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require("configs.harpoon").config,
  },
}

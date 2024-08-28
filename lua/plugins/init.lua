return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "jsregexp" },
    },
  },

  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,
    version = "*",
    config = require("configs.neorg").config,
  },

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
    config = require("configs.lspconfig").config,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.nvim-treesitter").opts,
    lazy = false,
    commit = "24ddf60d68daa921d4e909d2b6c5b03ef6bce8ce",
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = require("configs.nvim-treesitter-textobjects").config,
    commit = "ced6375723b20616282f9f6a1018a63ae19b106a",
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
    config = true,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = require("configs.trouble").opts,
    cmd = require("configs.trouble").cmd,
    keys = require("configs.trouble").keys,
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

  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   dependencies = { "zbirenbaum/copilot-cmp" },
  --   config = require("configs.copilot").config,
  -- },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = require("configs.copilot-cmp").config,
  -- },

  -- Override Nvchad default plugin configs
  -- {
  --   "hrsh7th/nvim-cmp",
  --   config = require("configs.nvim-cmp").config,
  -- },
}

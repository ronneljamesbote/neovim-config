return {
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              default = "~/Documents/notes/neorg-notes/100_default",
              projects = "~/Documents/notes/neorg-notes/200_projects",
              work = "~/Documents/notes/neorg-notes/300_work",
            },
            default_workspace = "default",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.integrations.nvim-cmp"] = {},
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}

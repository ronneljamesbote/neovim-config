return {
  opts = {
    git = {
      enable = true,
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true,
        },
      },
    },
    filesystem_watchers = {
      enable = true,
      ignore_dirs = {
        "node_modules",
        "packages/web/.next",
      },
    },
  },
}

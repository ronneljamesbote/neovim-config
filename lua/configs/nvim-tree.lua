local options = {
  view = {
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()

        -- Make the window full screen
        local window_w = screen_w
        local window_h = screen_h

        -- Center the window
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w,
          height = window_h,
        }
      end,
    },
  },
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
      "vendor",
      "node_modules",
      "packages/web/.next",
    },
  },
}

return options

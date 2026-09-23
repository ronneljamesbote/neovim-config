local layout = require "helpers.telescope_layout"

return {
  pickers = {
    find_files = layout.vertical(),
    oldfiles = layout.vertical(),
    live_grep = layout.vertical(),
    git_status = layout.vertical(),
  },
}

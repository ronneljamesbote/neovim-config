local vertical_layout = function()
  return {
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        mirror = true,
        prompt_position = "top",
      },
    },
  }
end

return {
  pickers = {
    find_files = vertical_layout(),
    oldfiles = vertical_layout(),
    live_grep = vertical_layout(),
  },
}

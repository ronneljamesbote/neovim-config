local M = {}

function M.vertical()
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

return M

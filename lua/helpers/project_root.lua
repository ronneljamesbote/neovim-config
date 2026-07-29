local M = {}

function M.get()
  local cwd = vim.fn.getcwd()
  local git_root = vim.fn.systemlist({ "git", "-C", cwd, "rev-parse", "--show-toplevel" })[1]

  if vim.v.shell_error == 0 and git_root and git_root ~= "" then
    return git_root
  end

  return cwd
end

return M

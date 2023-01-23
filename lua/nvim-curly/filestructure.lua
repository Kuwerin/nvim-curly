local M = {}

-- Gets workspace location.
function M.get_workspace()
  return vim.g.nvim_curly_root_dir or "~/.vim/curl/"
end

-- Resolves filename
function M.get_filename()
  return "history/"..os.date("%d-%m-%y_%H:%M:%S")..".json"
end

return M

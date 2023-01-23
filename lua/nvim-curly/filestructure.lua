local M = {}

-- Gets filetype
function M.get_filetype()
    return vim.g.nvim_curly_filetype or 'json'
end

-- Gets workspace location
function M.get_workspace()
  return vim.g.nvim_curly_root_dir or "~/.vim/curl/"
end

-- Resolves filename
function M.get_filename()
  return "history/"..os.date("%d-%m-%y_%H:%M:%S").."."..M.get_filetype()
end

-- Navigate to the root of the workspace
function M.go_to_workspace_root()
    vim.cmd(":e "..M.get_workspace())
end

-- Navigate to the history
function M.go_to_history()
    vim.cmd(":e "..M.get_workspace().."history/")
end

function M.go_to_workspace_root()
    vim.cmd(":e "..M.get_workspace())
end

function M.go_to_history()
    vim.cmd(":e "..M.get_workspace(), "history/")
end

return M

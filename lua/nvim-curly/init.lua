-- Neovim query executor for cURL-like utilities

local LineParser = require("nvim-curly.lines")
local Filestructure = require("nvim-curly.filestructure")
local WindowFactory = require("nvim-curly.window")

local M = {}

-- Executes the command and writes output to the file
local execute_to_file = function(cmd, filename)
    vim.cmd('!'..cmd..'  > '..Filestructure.get_workspace().. filename)
end

function M.execute_line()
    local cmd = LineParser.parse_line()
    local filename = Filestructure.get_filename()
    execute_to_file(cmd, filename)
    WindowFactory.open_win(filename)
end


function M.execute_multiline()
    local cmd = LineParser.parse_multiline()
    local filename = Filestructure.get_filename()
    execute_to_file(cmd, filename)
    WindowFactory.open_win(filename)
end

function M.go_to_workspace_root()
    Filestructure.go_to_workspace_root()
end

function M.go_to_history()
    Filestructure.go_to_history()
end

return M

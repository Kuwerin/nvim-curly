-- Vim lines parser

local M = {}

-- Parses line under the cursor
function M.parse_line()
  local linenr = vim.api.nvim_win_get_cursor(0)[1]
  return vim.api.nvim_buf_get_lines(0, linenr - 1, linenr, false)[1]
end

-- Parses whole lines that are selected
function M.parse_multiline()
  local vstart = vim.fn.getpos("'<")
  local vend = vim.fn.getpos("'>")

  local line_start = vstart[2]
  local line_end = vend[2]

  local lines = vim.fn.getline(line_start, line_end)
  return table.concat(lines, " ")
end

return M

-- Vim window API intercommunication.

local Filestructure = require('nvim-curly.filestructure')

local M = {}

-- Opens window in horisontal split.
local open_split = function(filename)
  vim.cmd('split ' .. Filestructure.get_workspace() .. filename)
  vim.api.nvim_buf_set_option(0, 'modifiable', true)
end

-- Opens window in vertical split.
local open_vsplit = function(filename)
  vim.cmd('vsplit ' .. Filestructure.get_workspace() .. filename)
  vim.api.nvim_buf_set_option(0, 'modifiable', true)
end

-- Opens float window
local open_float = function(filename)
  local width = vim.api.nvim_get_option('columns')
  local height = vim.api.nvim_get_option('lines')

  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)

  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = 'rounded',
  }

  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_win_set_option(win, 'cursorline', true)
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.cmd(':e ' .. Filestructure.get_workspace() .. filename)
end

-- A table of allowed window types
local window_types = {}
window_types['vertical'] = open_vsplit
window_types['horizontal'] = open_split
window_types['float'] = open_float

-- Gets window type. Available variants: `vertical`, `horizontal`, `float`.
-- Default is `vertical`.
local get_window_type = function()
  return vim.g.nvim_curly_window_type or 'vertical'
end

-- Opens window.
function M.open_win(filename)
  local window_func = window_types[get_window_type()]

  if window_func ~= nil then
    window_func(filename)
    return
  end

  open_vsplit(filename)
end

return M

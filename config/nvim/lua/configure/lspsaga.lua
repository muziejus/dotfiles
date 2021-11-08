--[[
local saga = require 'lspsaga'

saga.init_lsp_saga{
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

local map = vim.api.nvim_set_keymap
local options = { silent = true, noremap = true }
map('n', '<leader>ca', ':Lspsaga code_action<CR>', options)
map('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', options)
map('n', 'K', ':Lspsaga hover_doc<CR>', options)
map('n', 'gh', ':Lspsaga lsp_finder<CR>', options)
map('n', 'gr', ':Lspsaga rename<CR>', options)
]]--

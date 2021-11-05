local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

options = { noremap = true }
silent = { silent = true }

-- map the leader key but first knock out space
map("n", "<Space>", "", {})
vim.g.mapleader = " " -- would go in settings.lua but for the above
                      -- untested, though
vim.g.maplocalleader = " "

-- Insert Date and time
map("n", "<F3>", 
  "i<C-R>=strftime('%Y-%m-%d %a %I:%M %p ')<CR><Esc>", options)
map("i", "<F3>", 
  "<C-R>=strftime('%Y-%m-%d %a %I:%M %p ')<CR><Esc>", options)

-- Deal with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Center search results
map('n', 'n', 'nzz', {})
map('n', 'N', 'Nzz', {})
map('n', '*', '*zz', {})
map('n', '#', '#zz', {})
map('n', 'g*', 'g*zz', {})
map('n', 'g#', 'g#zz', {})
map('n', 'G', 'Gzz', {})

--After searching, pressing escape stops the highlight
--map("n", "<esc>", ":noh<cr><esc>", silent)

--Split mappings
map('n', '<C-J>', '<C-W><C-J>', {})
map('n', '<C-K>', '<C-W><C-K>', {})
map('n', '<C-L>', '<C-W><C-L>', {})
map('n', '<C-H>', '<C-W><C-H>', {})

-- Fugitive (from https://www.youtube.com/watch?v=PO6DxfGPQvw)
map('n', '<leader>gs', ':G<CR>', {})
map('n', '<leader>gh', ':diffget //3<CR>', {})
map('n', '<leader>gu', ':diffget //2<CR>', {})
map('n', '<leader>gc', ':Git commit<CR>', {})
map('n', '<leader>gpom', ':Git push origin main<CR>', {})

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>', silent)

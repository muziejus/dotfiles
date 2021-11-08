local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Global options
vim.g.mapleader = " " 
vim.g.maplocalleader = " "
o.pastetoggle = "<F2>" -- make it easier to paste code
o.showmode = false -- hide redundant "-- INSERT --"
o.splitbelow = true -- make :sp open below
o.splitright = true -- make :vs open to the right
o.termguicolors = true -- make more subtle coloring available
o.expandtab = true
o.hidden = true -- don't destroy buffers
o.hlsearch = false -- highlight on search
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.mouse = 'a' -- all buffers
o.breakindent = true
o.completeopt = 'menuone,noselect' -- better completion experience
o.autowriteall = true -- write all buffers when moving away from them

-- Window options
wo.number = true -- line numbers
wo.relativenumber = true -- line numbers, but relative

-- Buffer options

-- Highligh on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

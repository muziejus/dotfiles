local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Global options
o.pastetoggle = "<F2>" -- make it easier to paste code
o.showmode = false -- hide redundant "-- INSERT --"
o.splitbelow = true -- make :sp open below
o.splitright = true -- make :vs open to the right
o.termguicolors = true -- make more subtle coloring available
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

-- Window options
wo.number = true -- line numbers

-- Buffer options


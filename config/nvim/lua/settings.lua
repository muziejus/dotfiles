local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Global options
o.pastetoggle = "<F2>" -- make it easier to paste code
o.showmode = false -- hide redundant "-- INSERT --"
o.splitbelow = true -- make :sp open below
o.splitright = true -- make :vs open to the right
o.termguicolors = true -- make more subtle coloring available

-- Window options
wo.number = true -- line numbers

-- Buffer options
  -- tabs
  bo.expandtab = true
  bo.tabstop = 2
  bo.softtabstop = 2
  bo.shiftwidth = 2


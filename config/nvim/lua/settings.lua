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
o.hidden = true -- don't destroy buffers
o.hlsearch = false -- highlight on search
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.mouse = 'a' -- all buffers
o.breakindent = true
o.completeopt = 'menuone,noselect' -- better completion experience

-- Window options
wo.number = true -- line numbers

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

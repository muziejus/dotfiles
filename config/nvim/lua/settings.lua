-- loaded by ../init.lua
local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Global options
o.autowriteall = true -- write all buffers when moving away from them
o.breakindent = true
o.clipboard = "unnamed"
o.completeopt = 'menuone,noselect' -- better completion experience
o.conceallevel = 0 -- don't obfuscate markdown
o.cmdheight = 2
o.cursorline = true -- highlight current line
o.expandtab = true
o.fileencoding = 'utf-8'
o.hidden = true -- don't destroy buffers
o.hlsearch = true -- highlight on search
o.ignorecase = true -- ignore case on search
o.mouse = 'a' -- all buffers
o.pastetoggle = "<F2>" -- make it easier to paste code
o.pumheight = 10 -- popup menu height
o.scrolloff = 8 -- always show 8 lines above and below the cursor
o.showmode = false -- hide redundant "-- INSERT --"
o.showtabline = 2 -- show tabs
o.splitbelow = true -- make :sp open below
o.splitright = true -- make :vs open to the right
o.termguicolors = true -- make more subtle coloring available
o.timeoutlen = 500 -- time a mapped keyboard sequence completes, in ms
o.undofile = true -- persistent undo
o.shiftwidth = 2
o.softtabstop = 2
o.tabstop = 2

-- Window options
wo.number = true -- line numbers
wo.relativenumber = true -- line numbers, but relative
wo.signcolumn = "yes" -- show the sign column so it doesn't shift the text

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

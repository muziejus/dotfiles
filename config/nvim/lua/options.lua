-- loaded by ../init.lua
local options = {
  -- Window options
  breakindent = true, -- visually break long lines
  cmdheight = 2, -- cmd space under buffer
  conceallevel = 0, -- don't obfuscate markdown
  cursorline = true, -- highlight current line
  hidden = true, -- don't destroy buffers
  hlsearch = true, -- highlight on search
  --ignorecase = true,                       -- ignore case on search
  number = true, -- line numbers
  numberwidth = 4, -- make gutter 2 for signs and 2 for numbers
  pumheight = 10, -- popup menu height
  relativenumber = true, -- relative line numbers
  scrolloff = 8, -- always show 8 lines above and below cursor
  showmode = false, -- hide redundant "-- INSERT --"
  signcolumn = "yes", -- always show sign gutter
  splitbelow = true, -- make :sp open below
  splitright = true, -- make :vs open to the right
  -- Outside world
  clipboard = "unnamedplus", -- use system clipboard.
  mouse = "a", -- listen for mouse on all buffers
  -- Writing and backups
  autowriteall = true, -- write all buffers when moving away from them
  fileencoding = "utf-8",
  swapfile = false, -- don't create a swapfile
  undofile = true, -- persistent undo
  writebackup = false, -- if a file is being edited by another program
  -- (or was written to file while editing with
  -- another program), it is not allowed to be edited
  -- Tabs
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- number of spaces to add for indentation
  showtabline = 2, -- show tabs
  softtabstop = 2,
  tabstop = 2, -- insert 2 spaces for a tab
  -- Completion
  completeopt = { "menuone", "noselect" }, -- better completion experience
  timeoutlen = 500, -- ms before a mapped keyboard sequence completes
  updatetime = 300, -- faster completion (4000ms by default)
  -- Folding
  -- These are covered in the folding config.
  -- foldmethod = "expr",
  -- foldexpr = "nvim_treesitter#foldexpr()",
  -- foldlevel = 99,
  -- foldcolumn = "1",
  -- foldlevelstart = 99,
  -- foldenable = true,
  --termguicolors = true,                    -- make more subtle coloring available
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,]") -- use arrow keys to wrap lines

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]] ,
  false
)

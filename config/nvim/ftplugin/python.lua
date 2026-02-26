-- Enable soft-wrap and break indent
vim.opt_local.wrap = true
vim.opt_local.breakindent = true
vim.opt_local.showbreak = "↳ "

-- Remove auto-wrap, auto-commenting, and auto-indent joining
vim.opt_local.formatoptions:remove({ "t", "c", "r", "o" })

vim.opt_local.spell = false

vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.expandtab = true

local conform = require("conform")

-- Configure Python formatters
conform.setup({
	formatters_by_ft = {
		python = {
			{
				exe = "black",
				args = { "--line-length", "120" }, -- Adjust line length to reduce wrapping
			},
		},
	},
	-- Disable automatic formatting on save if you want manual control
	-- format_on_save = false,
})

-- Make editing smoother
local opts = { buffer = true }

-- Enable soft-wrap and break indent
vim.opt_local.wrap = true
vim.opt_local.breakindent = true
vim.opt_local.showbreak = "↳ "

-- Adjust format options to avoid weird auto-joins or cursor jumps
-- Remove auto-wrap, auto-commenting, and auto-indent joining
vim.opt_local.formatoptions:remove({ "t", "c", "r", "o" })

-- Optional: keep spell checking off for Python
vim.opt_local.spell = false

-- Optional: adjust tab settings for Python
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.expandtab = true

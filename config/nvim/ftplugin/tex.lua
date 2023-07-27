local cmp = require("cmp")
local colors = require("tokyonight.colors").setup()

cmp.setup.filetype("tex", {
	sources = cmp.config.sources({
		{ name = "luasnip", keyword_length = 2 },
		-- { name = "latex_symbols" }, -- don't actually like this one bit.
		{ name = "nvim_lsp" },
	}),
})

vim.g.vimtex_delim_toggle_mod_list = {
	{ "\\left", "\\right" },
	{ "\\big", "\\big" },
}

-- vim.g.vimtex_view_method = "skim" -- this is set in
-- nvim/lua/plugins/text.lua
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1
vim.g.vimtex_view_skim_reading_bar = 1

vim.g.vimtex_format_enabled = 1

vim.opt["conceallevel"] = 2
vim.cmd("highlight Conceal guifg=" .. colors.orange .. " guibg=NONE")

require("nvim-surround").buffer_setup({
	surrounds = {
		["Q"] = {
			add = { "``", "''" },
			find = "%b``.-''",
			delete = "^(``)().-('')()$",
		},
		["q"] = {
			add = { "`", "'" },
			find = "`.-'",
			delete = "^(`)().-(')()$",
		},
		["B"] = {
			add = { "\\textbf{", "}" },
			find = "\\%a-bf%b{}",
			delete = "^(\\%a-bf{)().-(})()$",
		},
		["I"] = {
			add = { "\\textit{", "}" },
			find = "\\%a-it%b{}",
			delete = "^(\\%a-it{)().-(})()$",
		},
		["T"] = {
			add = { "\\texttt{", "}" },
			find = "\\%a-tt%b{}",
			delete = "^(\\%a-tt{)().-(})()$",
		},
	},
})

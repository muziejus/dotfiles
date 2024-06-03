local cmp = require("cmp")
local colors = require("tokyonight.colors").setup()

vim.api.nvim_command("call pencil#init()")

cmp.setup.filetype("tex", {
	sources = cmp.config.sources({
		{ name = "luasnip", keyword_length = 2 },
		-- { name = "latex_symbols" }, -- don't actually like this one bit.
		{ name = "nvim_lsp" },
	}),
})

vim.g.vimtex_quickfix_ignore_filters = {
	"unicode-math Warning",
}

vim.g.vimtex_delim_toggle_mod_list = {
	{ "\\left", "\\right" },
	{ "\\big", "\\big" },
	{ "\\Big", "\\Big" },
	{ "\\bigg", "\\bigg" },
	{ "\\Bigg", "\\Bigg" },
}

vim.g.vimtex_env_toggle_math_map = {
	["$"] = "\\[",
	["\\["] = "align*",
}

vim.opt.spelllang = "en_us"
vim.opt.spell = true

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
		["O"] = {
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

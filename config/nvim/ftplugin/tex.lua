local cmp = require("cmp")
local colors = require("tokyonight.colors").setup()

-- I can't get this to turn the cursor wrap off.
-- vim.api.nvim_command("call pencil#init({'wrap': 'hard', 'autoformat': 1})")
-- vim.g["pencil#cursorwrap"] = 0

local npairs = require("nvim-autopairs")
npairs.remove_rule('"')

cmp.setup.filetype("tex", {
	enabled = function()
		-- Don't show completion when:
		-- 1. Not in insert mode
		-- 2. The character before cursor is a standalone punctuation
		local context = require("cmp.config.context")
		local mode = vim.api.nvim_get_mode().mode
		if mode ~= "i" then
			return false
		end
		local line = vim.api.nvim_get_current_line()
		local col = vim.api.nvim_win_get_cursor(0)[2]
		local char_before = line:sub(col, col)
		-- Block completion on these characters
		local unwanted_triggers = "[%.%,%:%;%{%}%[%]%+%-%*%/]"
		if char_before:match(unwanted_triggers) then
			return false
		end
		return true
	end,
	sources = cmp.config.sources({
		{ name = "luasnip", keyword_length = 3 },
		-- { name = "latex_symbols" }, -- don't actually like this one bit.
		{ name = "nvim_lsp", keyword_length = 3 },
		{ name = "vimtex" },
	}),
})

vim.g.vimtex_quickfix_ignore_filters = {
	"unicode-math Warning",
	"fontspec Warning",
	"biblatex Warning",
	"Missing character",
	"Underfull",
	"Overfulll",
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

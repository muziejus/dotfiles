-- gh.nvim configured in ui.lua
local neogit = require("neogit")

neogit.setup()

require("gitsigns").setup({
	signcolumn = true,
	numhl = true,
	linehl = false,
	word_diff = false,
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 100,
		ignore_whitespace = true,
	},
	attach_to_untracked = true,
	signs = {
		add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			text = "",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		topdelete = {
			hl = "GitSignsDelete",
			text = "",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
})

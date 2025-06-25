vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_filetypes = {
	["*"] = false,
	["javascript"] = true,
	["typescript"] = true,
	["lua"] = false,
	["python"] = true,
}
require("auto-session").setup({})

require("nvim-surround").setup({})

require("ibl").setup()

require("Comment").setup({
	---Add a space b/w comment and the line
	padding = true,
	---Whether the cursor should stay at its position
	sticky = true,
	---Lines to be ignored while (un)comment
	ignore = nil,
	---LHS of toggle mappings in NORMAL mode
	toggler = {
		---Line-comment toggle keymap
		line = "gcc",
		---Block-comment toggle keymap
		block = "gbc",
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = "gc",
		---Block-comment keymap
		block = "gb",
	},
	---LHS of extra mappings
	extra = {
		---Add comment on the line above
		above = "gcO",
		---Add comment on the line below
		below = "gco",
		---Add comment at the end of line
		eol = "gcA",
	},
	---Enable keybindings
	---NOTE: If given `false` then the plugin won't create any mappings
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = true,
	},
	---Function to call before (un)comment
	pre_hook = nil,
	---Function to call after (un)comment
	post_hook = nil,
})

require("zen-mode").setup({
	window = {
		width = 100,
		height = 1,
		options = {
			signcolumn = "yes",
			number = false,
			relativenumber = false,
			cursorline = false,
			cursorcolumn = false,
			foldcolumn = "0",
			list = false,
		},
	},
	plugins = {
		twilight = { enabled = true },
		gitsigns = { enabled = true },
	},
})

require("twilight").setup({
	dimming = {
		alpha = 0.25,
		color = { "Normal", "#ffffff" },
		inactive = false,
	},
	context = 10,
	treesitter = true,
	expand = {
		"function",
		"method",
		"table",
		"if_statement",
	},
	exclude = {}, -- filetypes
})

require("tabout").setup({})

require("nvim-autopairs").remove_rule("`")

local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
	dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
	dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h<cr>"),
	dashboard.button("q", "󰅚  > Quit NVIM", ":qa<CR>"),
}

require("alpha").setup(dashboard.opts)

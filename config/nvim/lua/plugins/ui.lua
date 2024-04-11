return {
	"ldelossa/litee.nvim",
	{ "ldelossa/gh.nvim", dependencies = {
		"ldelossa/litee.nvim",
	} },
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- optional
			"rcarriga/nvim-notify",
		},
	},
}

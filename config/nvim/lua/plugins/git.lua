return {
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
}

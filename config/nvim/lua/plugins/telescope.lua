return {
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- dressing is in ui.lua
	"nvim-telescope/telescope-bibtex.nvim",
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-dap.nvim", dependencies = { "mfussenegger/nvim-dap" } },
	{ "nvim-telescope/telescope-file-browser.nvim" },
}

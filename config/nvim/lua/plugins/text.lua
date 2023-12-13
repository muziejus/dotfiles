return {
	{
		"lervag/vimtex",
		init = function()
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.vimtex_quickfix_ignore_filters = {
				"Font Warning",
				"Overfull",
			}
		end,
	},
	{ "jbyuki/nabla.nvim" },
	{ "vim-pandoc/vim-pandoc" },
	{ "vim-pandoc/vim-pandoc-syntax" },
	{ "quarto-dev/quarto-nvim" },
	{ "jmbuhr/otter.nvim" },
}

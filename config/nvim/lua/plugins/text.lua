return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
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
	-- { "vim-pandoc/vim-pandoc" },
	-- { "vim-pandoc/vim-pandoc-syntax" },
	{ "quarto-dev/quarto-nvim" },
	{ "jmbuhr/otter.nvim" },
	{
		"preservim/vim-pencil",
		init = function()
			vim.g["pencil#wrapModeDefault"] = "soft"
		end,
	},
	{ "skwee357/nvim-prose" },
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_output_win_max_height = 13
		end,
	},
}

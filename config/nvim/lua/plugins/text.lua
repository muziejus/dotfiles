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
	-- { "jbyuki/nabla.nvim" },
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
      version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
      dependencies = { "3rd/image.nvim" },
      build = ":UpdateRemotePlugins",
      init = function()
          -- these are examples, not defaults. Please see the readme
          vim.g.molten_image_provider = "image.nvim"
          vim.g.molten_output_win_max_height = 20
      end,
  },
  {
  "GCBallesteros/jupytext.nvim",
  config = true,
  -- Depending on your nvim distro or config you may need to make the loading not lazy
  -- lazy=false,
  }
}
